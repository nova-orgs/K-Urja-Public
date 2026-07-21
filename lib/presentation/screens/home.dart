// lib/presentation/screens/home.dart
import 'dart:convert';
import 'package:k_urja/presentation/widgets/upload_popup.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:k_urja/data/local/database.dart';
import 'package:k_urja/presentation/audit/audit_entry_page.dart';
import 'package:intl/intl.dart';
import 'package:k_urja/presentation/audit/models/appliance_model.dart';
import 'package:k_urja/presentation/audit/models/heavy_appliance_model.dart';
import 'package:k_urja/presentation/audit/models/vehicle_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:k_urja/core/user_cache.dart';

import '../audit/audit_details_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HistoryItem {
  final Audit audit;
  _HistoryItem(this.audit);
}

class _HomeScreenState extends State<HomeScreen> {
  final db = MyDatabase.instance;
  List<_HistoryItem> _history = [];
  bool _loading = true;
  String? _cachedUsername;
  int _auditCount = 0;

  @override
  void initState() {
    super.initState();
    _loadHistory();
    // Use cached username if available, and listen for changes
    _cachedUsername = UserCache().username;
    UserCache().addListener(_onUserCacheChange);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        showUploadPopup(context);
      }
    });
  }

  @override
  void dispose() {
    UserCache().removeListener(_onUserCacheChange);
    super.dispose();
  }

  void _onUserCacheChange() {
    if (mounted) {
      setState(() {
        _cachedUsername = UserCache().username;
      });
    }
  }

  // Removed _getDashboardData, now using UserCache

  Future<void> _loadHistory() async {
    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      // Load from local Drift/Moor database
      final audits = await db.select(db.audits).get();
      if (mounted) {
        setState(() {
          _history = audits.map((audit) => _HistoryItem(audit)).toList();
          _auditCount = _history.length;
          _loading = false;
        });
      }
    } catch (e) {
      debugPrint("Error loading history: $e");
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4FFEF),
      body: SafeArea(
        child: _loading
            ? const Center(child: CircularProgressIndicator())
            : ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                children: [
                  _buildDashboardContent(
                    context,
                    _cachedUsername ?? 'Guest',
                    _auditCount,
                  ),
                  const SizedBox(height: 24),
                  _buildRecentActivity(context),
                ],
              ),
      ),
    );
  }

  // Extracted this method to avoid duplicating UI code in the FutureBuilder logic
  Widget _buildDashboardContent(
    BuildContext context,
    String name,
    int auditCount,
  ) {
    return Column(
      children: [
        _buildAppBar(context, name),
        const SizedBox(height: 24),
        _buildSummaryCard(context, auditCount),
      ],
    );
  }

  Widget _buildAppBar(BuildContext context, String name) {
    return Row(
      children: [
        const Icon(Icons.person, size: 48),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name, style: Theme.of(context).textTheme.titleMedium),
            Text('Welcome Back', style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
        const Spacer(),
      ],
    );
  }

  Widget _buildSummaryCard(BuildContext context, int auditCount) {
    return Card(
      color: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Summary',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                ElevatedButton.icon(
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AuditEntryPage(),
                      ),
                    );
                    _loadHistory();
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('New Audit'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFCDEA66),
                    foregroundColor: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Total Audits Completed',
              style: TextStyle(color: Colors.white70),
            ),
            Text(
              '$auditCount',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentActivity(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Recent Audits',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            if (_history.isEmpty)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 12.0),
                child: Center(child: Text("No local audits found")),
              )
            else
              Column(
                children: _history.map((item) {
                  return _buildActivityItem(
                    context,
                    Icons.receipt_long,
                    item.audit.ownerName ?? 'Audit #${item.audit.id}',
                    item.audit.completionTime != null
                        ? DateFormat(
                            'EEEE, d MMMM',
                          ).format(item.audit.completionTime!)
                        : 'N/A',
                    '',
                    item.audit,
                  );
                }).toList(),
              ),
          ],
        ),
      ),
    );
  }

  AuditData _convertAuditToAuditData(Audit audit) {
    final appliances = jsonDecode(audit.appliances);
    final heavyAppliancesRaw = jsonDecode(audit.heavyAppliances);
    final vehicles = jsonDecode(audit.vehicles);

    List<HeavyApplianceModel> fridgeList;
    List<HeavyApplianceModel> acList;

    if (heavyAppliancesRaw is Map) {
      // New format
      fridgeList = (heavyAppliancesRaw['fridgeList'] as List)
          .map((e) => HeavyApplianceModel.fromJson(e))
          .toList();
      acList = (heavyAppliancesRaw['acList'] as List)
          .map((e) => HeavyApplianceModel.fromJson(e))
          .toList();
    } else if (heavyAppliancesRaw is List) {
      // Old format - a list of heavy appliances. We can't distinguish
      // between fridge and AC, so we'll put them all in one list
      // to prevent a crash. The user can re-save the audit to fix this.
      fridgeList = heavyAppliancesRaw
          .map((e) => HeavyApplianceModel.fromJson(e))
          .toList();
      acList = [];
    } else {
      fridgeList = [];
      acList = [];
    }

    return AuditData(
      ownerName: audit.ownerName ?? '',
      houseName: audit.houseName ?? '',
      mobileNumber: audit.mobileNumber ?? '',
      consumerNo: audit.consumerNo ?? '',
      section: audit.section ?? '',
      ksebPostOffice: audit.ksebPostOffice ?? '',
      pinCode: audit.pinCode ?? '',
      panchayath: audit.panchayath ?? '',
      memberCount: audit.memberCount ?? '',
      daysUninhabited: audit.daysUninhabited ?? '',
      hasSolarPlant: audit.hasSolarPlant ?? false,
      solarCapacity: audit.solarCapacity ?? '',
      tariffCategory: audit.tariffCategory ?? '',
      connectedLoad: audit.connectedLoad ?? '',
      natureOfConnection: audit.natureOfConnection ?? '',
      houseBuildingType: audit.houseBuildingType ?? '',
      ownOrRental: audit.ownOrRental ?? '',
      noOfFloors: audit.noOfFloors ?? '',
      totalBuildingArea: audit.totalBuildingArea ?? '',
      typeOfEarthing: audit.typeOfEarthing ?? '',
      controlSystems: audit.controlSystems ?? '',
      noOfMcbs: audit.noOfMcbs ?? '',
      typeOfEnergyMeter: audit.typeOfEnergyMeter ?? '',
      solarPlantType: audit.solarPlantType,
      calculatedAverageDailyConsumption:
          double.tryParse(audit.biMonthlyConsumption ?? '0') ?? 0.0,
      averageUnitCost: double.tryParse(audit.biMonthlyBill ?? '0') ?? 0.0,
      firewoodUsage: audit.firewood ?? '',
      lpgCylinders: audit.lpg ?? '',
      biogasUsage: audit.biogas ?? '',
      otherFuel: audit.otherFuel ?? '',
      lightSources: (appliances['lightSources'] as List)
          .map((e) => ApplianceModel.fromJson(e))
          .toList(),
      fanList: (appliances['fanList'] as List)
          .map((e) => ApplianceModel.fromJson(e))
          .toList(),
      otherAppliances: (appliances['otherAppliances'] as List)
          .map((e) => ApplianceModel.fromJson(e))
          .toList(),
      fridgeList: fridgeList,
      acList: acList,
      vehicleList: (vehicles as List)
          .map((e) => VehicleModel.fromJson(e))
          .toList(),
      pumpData: PumpData(
        tankCapacity: audit.tankCapacity ?? '',
        pumpCapacity: audit.pumpCapacity ?? '',
        fillingTime: audit.fillingTime ?? '',
        pumpCount: audit.pumpCount ?? '',
      ),
      waterSource: audit.waterSource ?? '',
      waterUsage: audit.waterUsage ?? '',
      waterBill: audit.waterBill ?? '',
      dailyPowerPump: audit.dailyPowerPump ?? 0.0,
      annualPowerPump: audit.annualPowerPump ?? 0.0,
    );
  }

  Widget _buildActivityItem(
    BuildContext context,
    IconData icon,
    String title,
    String subtitle,
    String amount,
    Audit audit,
  ) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey[200],
        child: Icon(icon, color: Colors.black),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(
        subtitle,
        style: TextStyle(color: Colors.grey[600], fontSize: 12),
      ),
      trailing: Text(
        amount,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      onTap: () {
        final auditData = _convertAuditToAuditData(audit);
        context.push(
          '/audit-details',
          extra: {
            'auditData': auditData,
            'showSaveButton': false,
            'savedAudit': audit,
          },
        );
      },
    );
  }
}
