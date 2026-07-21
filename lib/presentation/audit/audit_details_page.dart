import 'dart:convert';
import 'dart:typed_data';

import 'package:drift/drift.dart' as drift;
import 'package:file_saver/file_saver.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:k_urja/core/ai_service.dart';
import 'package:k_urja/core/carbon_calculator.dart';
import 'package:k_urja/core/carbon_calculator_helper.dart';
import 'package:k_urja/core/data_uploader.dart';
import 'package:k_urja/data/local/database.dart';
import 'package:k_urja/data/models/audit_report_model.dart' as app_model;
import 'package:k_urja/presentation/audit/models/appliance_model.dart';
import 'package:k_urja/presentation/audit/models/heavy_appliance_model.dart';
import 'package:k_urja/presentation/audit/models/vehicle_model.dart';
import 'package:k_urja/presentation/widgets/section_header.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// --- DATA MODELS ---
class PumpData {
  final String tankCapacity;
  final String pumpCapacity;
  final String fillingTime;
  final String pumpCount;

  PumpData({
    required this.tankCapacity,
    required this.pumpCapacity,
    required this.fillingTime,
    required this.pumpCount,
  });
}

class AuditData {
  final String ownerName;
  final String houseName;
  final String mobileNumber;
  final String consumerNo;
  final String section;
  final String ksebPostOffice;
  final String pinCode;
  final String panchayath;
  final String memberCount;
  final String daysUninhabited;
  final bool hasSolarPlant;
  final String solarCapacity;
  final String tariffCategory;
  final String connectedLoad;
  final String natureOfConnection;
  final String houseBuildingType;
  final String ownOrRental;
  final String noOfFloors;
  final String totalBuildingArea;
  final String typeOfEarthing;
  final String controlSystems;
  final String noOfMcbs;
  final String typeOfEnergyMeter;
  final String? solarPlantType;
  final double calculatedAverageDailyConsumption;
  final double averageUnitCost;
  final String firewoodUsage;
  final String lpgCylinders;
  final String biogasUsage;
  final String otherFuel;
  final List<ApplianceModel> lightSources;
  final List<ApplianceModel> fanList;
  final List<ApplianceModel> otherAppliances;
  final List<HeavyApplianceModel> fridgeList;
  final List<HeavyApplianceModel> acList;
  final List<VehicleModel> vehicleList;
  final PumpData pumpData;
  final String waterSource;
  final String waterUsage;
  final String waterBill;
  final double dailyPowerPump;
  final double annualPowerPump;

  AuditData({
    required this.ownerName,
    required this.houseName,
    required this.mobileNumber,
    required this.consumerNo,
    required this.section,
    required this.ksebPostOffice,
    required this.pinCode,
    required this.panchayath,
    required this.memberCount,
    required this.daysUninhabited,
    required this.hasSolarPlant,
    required this.solarCapacity,
    required this.tariffCategory,
    required this.connectedLoad,
    required this.natureOfConnection,
    required this.houseBuildingType,
    required this.ownOrRental,
    required this.noOfFloors,
    required this.totalBuildingArea,
    required this.typeOfEarthing,
    required this.controlSystems,
    required this.noOfMcbs,
    required this.typeOfEnergyMeter,
    this.solarPlantType,
    required this.calculatedAverageDailyConsumption,
    required this.averageUnitCost,
    required this.firewoodUsage,
    required this.lpgCylinders,
    required this.biogasUsage,
    required this.otherFuel,
    required this.lightSources,
    required this.fanList,
    required this.otherAppliances,
    required this.fridgeList,
    required this.acList,
    required this.vehicleList,
    required this.pumpData,
    required this.waterSource,
    required this.waterUsage,
    required this.waterBill,
    required this.dailyPowerPump,
    required this.annualPowerPump,
  });

  AuditsCompanion toDriftCompanion(String userId) {
    final appliancesJson = jsonEncode({
      'lightSources': lightSources.map((e) => e.toJson()).toList(),
      'fanList': fanList.map((e) => e.toJson()).toList(),
      'otherAppliances': otherAppliances.map((e) => e.toJson()).toList(),
    });

    final heavyAppliancesJson = jsonEncode({
      'fridgeList': fridgeList.map((e) => e.toJson()).toList(),
      'acList': acList.map((e) => e.toJson()).toList(),
    });

    final vehiclesJson = jsonEncode(
      vehicleList.map((e) => e.toJson()).toList(),
    );

    return AuditsCompanion(
      userId: drift.Value(userId),
      ownerName: drift.Value(ownerName),
      houseName: drift.Value(houseName),
      mobileNumber: drift.Value(mobileNumber),
      consumerNo: drift.Value(consumerNo),
      section: drift.Value(section),
      ksebPostOffice: drift.Value(ksebPostOffice),
      pinCode: drift.Value(pinCode),
      panchayath: drift.Value(panchayath),
      biMonthlyConsumption: drift.Value(
        calculatedAverageDailyConsumption.toString(),
      ),
      biMonthlyBill: drift.Value(averageUnitCost.toString()),
      memberCount: drift.Value(memberCount),
      daysUninhabited: drift.Value(daysUninhabited),
      hasSolarPlant: drift.Value(hasSolarPlant),
      solarCapacity: drift.Value(solarCapacity),
      tariffCategory: drift.Value(tariffCategory),
      connectedLoad: drift.Value(connectedLoad),
      natureOfConnection: drift.Value(natureOfConnection),
      houseBuildingType: drift.Value(houseBuildingType),
      ownOrRental: drift.Value(ownOrRental),
      noOfFloors: drift.Value(noOfFloors),
      totalBuildingArea: drift.Value(totalBuildingArea),
      typeOfEarthing: drift.Value(typeOfEarthing),
      controlSystems: drift.Value(controlSystems),
      noOfMcbs: drift.Value(noOfMcbs),
      typeOfEnergyMeter: drift.Value(typeOfEnergyMeter),
      solarPlantType: drift.Value(solarPlantType),
      firewood: drift.Value(firewoodUsage),
      lpg: drift.Value(lpgCylinders),
      biogas: drift.Value(biogasUsage),
      otherFuel: drift.Value(otherFuel),
      tankCapacity: drift.Value(pumpData.tankCapacity),
      pumpCapacity: drift.Value(pumpData.pumpCapacity),
      fillingTime: drift.Value(pumpData.fillingTime),
      pumpCount: drift.Value(pumpData.pumpCount),
      waterSource: drift.Value(waterSource),
      waterUsage: drift.Value(waterUsage),
      waterBill: drift.Value(waterBill),
      dailyPowerPump: drift.Value(dailyPowerPump),
      annualPowerPump: drift.Value(annualPowerPump),
      appliances: drift.Value(appliancesJson),
      heavyAppliances: drift.Value(heavyAppliancesJson),
      vehicles: drift.Value(vehiclesJson),
      completionTime: drift.Value(DateTime.now()),
    );
  }
}

// --- MAIN WIDGET ---
class AuditDetailsPage extends StatefulWidget {
  final AuditData auditData;
  final bool showSaveButton;
  final Audit? savedAudit;

  const AuditDetailsPage({
    super.key,
    required this.auditData,
    this.showSaveButton = false,
    this.savedAudit,
  });

  @override
  State<AuditDetailsPage> createState() => _AuditDetailsPageState();
}

class _AuditDetailsPageState extends State<AuditDetailsPage> {
  bool _isSaving = false;
  bool _isSaved = false;
  app_model.AuditReportModel? _reportModel;
  Audit? _savedAudit;
  String? _aiReportContent;
  bool _isGeneratingAiReport = false;

  @override
  void initState() {
    super.initState();
    if (widget.savedAudit != null) {
      _savedAudit = widget.savedAudit;
    }
  }

  Future<void> _saveAudit() async {
    if (_isSaved) return;

    setState(() => _isSaving = true);

    try {
      final supabase = Supabase.instance.client;
      final userId = supabase.auth.currentUser?.id;
      if (userId == null) {
        throw Exception("User is not logged in.");
      }

      final database = MyDatabase.instance;
      final auditCompanion = widget.auditData.toDriftCompanion(userId);

      // 1. Insert the raw audit data
      final newAudit = await database
          .into(database.audits)
          .insertReturning(auditCompanion);
      setState(() {
        _savedAudit = newAudit;
      });

      // 2. Perform calculations
      final reportModel = CarbonCalculator.performCalculations(
        newAudit,
        userId,
      );
      setState(() {
        _reportModel = reportModel;
      });

      // 3. Save the report and link it to the audit
      await database.insertReportAndLinkToAudit(newAudit.id, reportModel);

      setState(() {
        _isSaved = true;
      });

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Audit saved locally! Attempting to upload...'),
        ),
      );

      // 4. Trigger background upload
      final uploader = DataUploader(database, supabase);
      await uploader.uploadPendingAudits();
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error saving audit: $e')));
    } finally {
      if (mounted) {
        setState(() => _isSaving = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carbon Footprint Report'),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () => _showShareOptions(context),
          ),
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              context.goNamed('home');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeader(title: 'Consumer Details'),
            _buildBasicInfo(),
            const SizedBox(height: 24),
            const SectionHeader(title: 'Building & Connection Details'),
            _buildHouseDetails(),
            const SizedBox(height: 24),
            const SectionHeader(title: 'Resources (Water & Solar)'),
            _buildWaterAndSolarDetails(),
            const SizedBox(height: 24),
            const SectionHeader(title: 'Electricity Consumption'),
            _buildElectricityReport(),
            const SizedBox(height: 24),
            const SectionHeader(title: 'Energy Performance Index (EPI)'),
            _buildEPIReport(),
            const SizedBox(height: 24),
            const SectionHeader(title: 'Cooking Fuel Consumption'),
            _buildCookingFuelReport(),
            const SizedBox(height: 24),
            const SectionHeader(title: 'Appliance Consumption'),
            _buildApplianceReport(),
            const SizedBox(height: 24),
            const SectionHeader(title: 'Vehicle Consumption'),
            _buildVehicleReport(),
            const SizedBox(height: 24),
            _buildTotalCarbonFootprint(),
            const SizedBox(height: 40),
          ],
        ),
      ),
      bottomNavigationBar: widget.showSaveButton
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton.icon(
                icon: _isSaving
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : (_isSaved
                          ? const Icon(Icons.check)
                          : const Icon(Icons.save)),
                label: Text(
                  _isSaved ? 'Saved & Uploading' : 'Save and Finalize',
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isSaved ? Colors.green : Colors.black,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: (_isSaving || _isSaved) ? null : _saveAudit,
              ),
            )
          : null,
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 2,
            child: Text(label, style: const TextStyle(color: Colors.grey)),
          ),
          const SizedBox(width: 16),
          Flexible(
            flex: 3,
            child: Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBasicInfo() {
    return ReportCard(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailItem('Owner Name', widget.auditData.ownerName),
            if (widget.auditData.houseName.isNotEmpty)
              _buildDetailItem('House Name', widget.auditData.houseName),
            _buildDetailItem('Mobile Number', widget.auditData.mobileNumber),
            _buildDetailItem('Consumer No', widget.auditData.consumerNo),
            _buildDetailItem('Section', widget.auditData.section),
            _buildDetailItem(
              'Post Office',
              '${widget.auditData.ksebPostOffice} - ${widget.auditData.pinCode}',
            ),
            _buildDetailItem('Panchayath', widget.auditData.panchayath),
            _buildDetailItem('Members', widget.auditData.memberCount),
            _buildDetailItem(
              'Days Uninhabited',
              widget.auditData.daysUninhabited,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHouseDetails() {
    return ReportCard(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailItem(
              'Tariff Category',
              widget.auditData.tariffCategory,
            ),
            _buildDetailItem('Connected Load', widget.auditData.connectedLoad),
            _buildDetailItem(
              'House Building Type',
              widget.auditData.houseBuildingType,
            ),
            _buildDetailItem(
              'Total Building Area',
              '${widget.auditData.totalBuildingArea} sqft',
            ),
            _buildDetailItem('Number of Floors', widget.auditData.noOfFloors),
            _buildDetailItem('Own or Rental', widget.auditData.ownOrRental),
            _buildDetailItem(
              'Type of Earthing',
              widget.auditData.typeOfEarthing,
            ),
            _buildDetailItem('Number of MCBs', widget.auditData.noOfMcbs),
            _buildDetailItem(
              'Type of Energy Meter',
              widget.auditData.typeOfEnergyMeter,
            ),
            if (widget.auditData.controlSystems.isNotEmpty)
              _buildDetailItem(
                'Control Systems',
                widget.auditData.controlSystems,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildWaterAndSolarDetails() {
    return ReportCard(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailItem('Water Source', widget.auditData.waterSource),
            _buildDetailItem(
              'Water Usage',
              '${widget.auditData.waterUsage} L/day',
            ),
            if (widget.auditData.waterBill.isNotEmpty)
              _buildDetailItem(
                'Water Bill',
                'Rs ${widget.auditData.waterBill}',
              ),
            _buildDetailItem(
              'Tank Capacity',
              '${widget.auditData.pumpData.tankCapacity} L',
            ),
            _buildDetailItem(
              'Pump Capacity',
              '${widget.auditData.pumpData.pumpCapacity} HP',
            ),
            _buildDetailItem(
              'Filling Time',
              '${widget.auditData.pumpData.fillingTime} min',
            ),
            _buildDetailItem(
              'Pump Count',
              '${widget.auditData.pumpData.pumpCount}/day',
            ),
            _buildDetailItem(
              'Motor Daily Power Consumption',
              '${widget.auditData.dailyPowerPump.toStringAsFixed(2)} kWh',
            ),
            _buildDetailItem(
              'Motor Annual Power Consumption',
              '${widget.auditData.annualPowerPump.toStringAsFixed(2)} kWh/yr',
            ),
            if (widget.auditData.hasSolarPlant) ...[
              const Divider(),
              _buildDetailItem('Solar Plant', 'Yes'),
              _buildDetailItem('Capacity', widget.auditData.solarCapacity),
              _buildDetailItem(
                'Type',
                widget.auditData.solarPlantType ?? 'N/A',
              ),
            ] else ...[
              const Divider(),
              _buildDetailItem('Solar Plant', 'No'),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildElectricityReport() {
    final annualConsumption =
        widget.auditData.calculatedAverageDailyConsumption * 365;
    final carbonFootprint = annualConsumption * 0.79;
    return ReportCard(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildDetailItem(
              'Avg Daily Consumption',
              '${widget.auditData.calculatedAverageDailyConsumption.toStringAsFixed(2)} kWh',
            ),
            _buildDetailItem(
              'Annual Carbon Footprint',
              '${carbonFootprint.toStringAsFixed(2)} Kg CO2/yr',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEPIReport() {
    final annualConsumption =
        widget.auditData.calculatedAverageDailyConsumption * 365;
    final buildingAreaSqFt =
        double.tryParse(widget.auditData.totalBuildingArea) ?? 0.0;
    final buildingAreaSqM = buildingAreaSqFt * 0.092903;
    final epi = buildingAreaSqM > 0 ? annualConsumption / buildingAreaSqM : 0.0;
    return ReportCard(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _buildDetailItem('EPI', '${epi.toStringAsFixed(2)} kWh/m²/year'),
      ),
    );
  }

  Widget _buildCookingFuelReport() {
    final firewoodCarbon =
        CarbonCalculatorHelper.calculateFirewoodCarbonFootprint(
          widget.auditData.firewoodUsage,
        );
    final lpgCarbon = CarbonCalculatorHelper.calculateLpgCarbonFootprint(
      widget.auditData.lpgCylinders,
    );
    final biogasCarbon = CarbonCalculatorHelper.calculateBiogasCarbonFootprint(
      widget.auditData.biogasUsage,
    );

    return ReportCard(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            if (firewoodCarbon > 0)
              _buildDetailItem(
                'Firewood',
                '${widget.auditData.firewoodUsage} Kg/month (${firewoodCarbon.toStringAsFixed(2)} Kg CO2/yr)',
              ),
            if (lpgCarbon > 0)
              _buildDetailItem(
                'LPG',
                '${widget.auditData.lpgCylinders} cyl/month (${lpgCarbon.toStringAsFixed(2)} Kg CO2/yr)',
              ),
            if (biogasCarbon > 0)
              _buildDetailItem(
                'Biogas',
                '${widget.auditData.biogasUsage} hrs/month (${biogasCarbon.toStringAsFixed(2)} Kg CO2/yr)',
              ),
            if (widget.auditData.otherFuel.isNotEmpty)
              _buildDetailItem('Other Fuel', widget.auditData.otherFuel),
          ],
        ),
      ),
    );
  }

  Widget _buildApplianceReport() {
    return Column(
      children: [
        if (widget.auditData.lightSources.isNotEmpty)
          _buildApplianceList(widget.auditData.lightSources, 'Light Sources'),
        if (widget.auditData.fanList.isNotEmpty)
          _buildApplianceList(widget.auditData.fanList, 'Fans'),
        if (widget.auditData.otherAppliances.isNotEmpty)
          _buildApplianceList(
            widget.auditData.otherAppliances,
            'Other Appliances',
          ),
        if (widget.auditData.fridgeList.isNotEmpty)
          _buildHeavyApplianceList(
            widget.auditData.fridgeList,
            'Refrigerators',
          ),
        if (widget.auditData.acList.isNotEmpty)
          _buildHeavyApplianceList(widget.auditData.acList, 'Air Conditioners'),
      ],
    );
  }

  Widget _buildApplianceList(List<ApplianceModel> appliances, String category) {
    return ReportCard(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              category,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const Divider(),
            ...appliances.map((app) {
              final carbon =
                  CarbonCalculatorHelper.calculateApplianceCarbonFootprint(app);
              final double investment =
                  double.tryParse(app.investmentCost) ?? 0.0;
              final double annualKwhSavings =
                  (double.tryParse(app.savingWatts) ?? 0.0) *
                  (double.tryParse(app.hours) ?? 0.0) *
                  365 /
                  1000;
              final double annualSavings =
                  annualKwhSavings * widget.auditData.averageUnitCost;
              final String paybackPeriod = (annualSavings > 0 && investment > 0)
                  ? '${(investment / annualSavings).toStringAsFixed(1)} years'
                  : 'N/A';

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Column(
                  children: [
                    _buildDetailItem(
                      app.name,
                      '${app.watts}W x ${app.hours}h x ${app.count} (${carbon.toStringAsFixed(2)} Kg CO2/yr)',
                    ),
                    if (app.tips.isNotEmpty)
                      _buildDetailSubItem('Suggestion', app.tips),
                    if (investment > 0)
                      _buildDetailSubItem(
                        'Investment',
                        'Rs ${app.investmentCost}',
                      ),
                    if (annualSavings > 0)
                      _buildDetailSubItem(
                        'Savings',
                        'Rs ${annualSavings.toStringAsFixed(2)}/yr',
                        valueColor: Colors.green,
                      ),
                    if (paybackPeriod != 'N/A')
                      _buildDetailSubItem(
                        'Payback',
                        paybackPeriod,
                        valueColor: Colors.blue,
                      ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildHeavyApplianceList(
    List<HeavyApplianceModel> appliances,
    String category,
  ) {
    return ReportCard(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              category,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const Divider(),
            ...appliances.map((app) {
              final carbon =
                  CarbonCalculatorHelper.calculateHeavyApplianceCarbonFootprint(
                    app,
                    isRefrigerator: category == 'Refrigerators',
                  );
              final double investment =
                  double.tryParse(app.investmentCost) ?? 0.0;
              final bool isRefrigerator = category == 'Refrigerators';
              final double hoursForSavings = isRefrigerator
                  ? 24.0
                  : (double.tryParse(app.hoursUsed) ?? 0.0);
              final double annualKwhSavings =
                  (double.tryParse(app.savingWatts) ?? 0.0) *
                  hoursForSavings *
                  (double.tryParse(app.daysUsed) ?? 0.0) /
                  1000;
              final double annualSavings =
                  annualKwhSavings * widget.auditData.averageUnitCost;
              final String paybackPeriod = (annualSavings > 0 && investment > 0)
                  ? '${(investment / annualSavings).toStringAsFixed(1)} years'
                  : 'N/A';

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Column(
                  children: [
                    _buildDetailItem(
                      'Cap: ${app.capacity}',
                      category == 'Refrigerators'
                          ? '24h x ${app.daysUsed}d x ${app.count} (${carbon.toStringAsFixed(2)} Kg CO2/yr)'
                          : '${app.hoursUsed}h x ${app.daysUsed}d x ${app.count} (${carbon.toStringAsFixed(2)} Kg CO2/yr)',
                    ),
                    if (app.tips.isNotEmpty)
                      _buildDetailSubItem('Suggestion', app.tips),
                    if (investment > 0)
                      _buildDetailSubItem(
                        'Investment',
                        'Rs ${app.investmentCost}',
                      ),
                    if (annualSavings > 0)
                      _buildDetailSubItem(
                        'Savings',
                        'Rs ${annualSavings.toStringAsFixed(2)}/yr',
                        valueColor: Colors.green,
                      ),
                    if (paybackPeriod != 'N/A')
                      _buildDetailSubItem(
                        'Payback',
                        paybackPeriod,
                        valueColor: Colors.blue,
                      ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailSubItem(String label, String value, {Color? valueColor}) {
    return Padding(
      padding: const EdgeInsets.only(top: 2.0, left: 16.0),
      child: Row(
        children: [
          Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: valueColor,
              ),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVehicleReport() {
    return ReportCard(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: widget.auditData.vehicleList
              .where((v) => v.fuelUsage.isNotEmpty)
              .map((v) {
                final carbon =
                    CarbonCalculatorHelper.calculateVehicleCarbonFootprint(v);
                return _buildDetailItem(
                  '${v.vehicleType} (${v.fuelType})',
                  '${v.fuelUsage} L/month (${carbon.toStringAsFixed(2)} Kg CO2/yr)',
                );
              })
              .toList(),
        ),
      ),
    );
  }

  Widget _buildTotalCarbonFootprint() {
    final totalCarbon = _calculateTotalCarbon();
    return ReportCard(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _buildDetailItem(
          'Total Annual Carbon Footprint',
          '${totalCarbon.toStringAsFixed(2)} Kg CO2',
        ),
      ),
    );
  }

  // --- DIALOGS & ACTIONS ---

  void _showProcessingDialog(String text) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        content: Row(
          children: [
            const CircularProgressIndicator(),
            const SizedBox(width: 20),
            Text(text),
          ],
        ),
      ),
    );
  }

  Future<String?> _getAiReport() async {
    if (_aiReportContent != null) return _aiReportContent;

    if (_savedAudit == null) {
      if (!mounted) return null;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please save the audit first.'),
          backgroundColor: Colors.orange,
        ),
      );
      return null;
    }

    if (!mounted) return null;
    _showProcessingDialog('Generating AI Report...');
    setState(() => _isGeneratingAiReport = true);

    String? report;
    String? error;

    try {
      final result = await AiService.generateReport(_savedAudit!);
      if (result.startsWith('Error:')) {
        error = result;
      } else {
        report = result;
      }
    } catch (e) {
      error = 'An unexpected error occurred: $e';
    } finally {
      if (mounted) {
        Navigator.of(context).pop(); // Dismiss dialog
        setState(() => _isGeneratingAiReport = false);

        if (report != null) {
          setState(() => _aiReportContent = report);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('AI Report Generated Successfully!'),
              backgroundColor: Colors.green,
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to generate AI report: $error'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }
    return report;
  }

  // --- PDF GENERATION ---

  void _showShareOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.share),
                title: const Text('Share without AI Report'),
                onTap: () {
                  Navigator.of(context).pop();
                  // Explicitly call the non-AI version
                  _exportPdfWithoutAi(context);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.auto_awesome,
                ), // Changed icon for better distinction
                title: const Text('Share with AI report'),
                onTap: () {
                  Navigator.of(context).pop();
                  // Explicitly call the AI version
                  _sharePdf(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _savePdfToDownloads(BuildContext context) async {
    final aiReport = await _getAiReport();
    if (aiReport == null) return;

    if (!context.mounted) return;
    _showProcessingDialog('Generating PDF...');

    try {
      final pdfBytes = await _generatePdf(aiReport: aiReport);

      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final fileName =
          'k-urja-report-${widget.auditData.consumerNo}-$timestamp';

      await FileSaver.instance.saveFile(
        name: fileName,
        bytes: pdfBytes,
        fileExtension: 'pdf',
        mimeType: MimeType.pdf,
      );

      if (context.mounted) {
        Navigator.of(context).pop(); // Dismiss PDF dialog
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('File Saved Successfully!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        Navigator.of(context).pop(); // Dismiss PDF dialog
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to save PDF: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _exportPdfWithoutAi(BuildContext context) async {
    if (!context.mounted) return;
    _showProcessingDialog('Generating PDF...');

    try {
      final pdf = await _generatePdf(
        aiReport: null,
      ); // Generate PDF without AI report

      if (context.mounted) Navigator.of(context).pop();

      await Printing.sharePdf(
        bytes: pdf,
        filename: 'k-urja-report-${widget.auditData.consumerNo}-no-ai.pdf',
      );
    } catch (e) {
      if (context.mounted) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to export PDF: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _sharePdf(BuildContext context) async {
    final aiReport = await _getAiReport();
    if (aiReport == null) return;

    if (!context.mounted) return;
    _showProcessingDialog('Generating PDF...');

    try {
      final pdf = await _generatePdf(aiReport: aiReport);

      if (context.mounted) Navigator.of(context).pop();

      await Printing.sharePdf(
        bytes: pdf,
        filename: 'k-urja-report-${widget.auditData.consumerNo}.pdf',
      );
    } catch (e) {
      if (context.mounted) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to share PDF: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  // --- UPDATED PDF GENERATOR WITH MARKDOWN SUPPORT & FALLBACK FONTS ---
  Future<Uint8List> _generatePdf({String? aiReport}) async {
    final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);

    // 1. Load Primary Fonts
    final font = await PdfGoogleFonts.openSansRegular();
    final boldFont = await PdfGoogleFonts.openSansBold();
    final italicFont = await PdfGoogleFonts.openSansItalic();
    final boldItalicFont = await PdfGoogleFonts.openSansBoldItalic();

    // 2. Load Fallback Fonts (For Rupee ₹ and Emojis ✅🔌)
    final fallbackFont = await PdfGoogleFonts.notoSansRegular();
    final emojiFont = await PdfGoogleFonts.notoColorEmoji();

    final fontFallback = [fallbackFont, emojiFont];

    // 3. Setup Theme with Fallbacks
    final pageTheme = pw.PageTheme(
      pageFormat: PdfPageFormat.a4,
      theme: pw.ThemeData.withFont(
        base: font,
        bold: boldFont,
        italic: italicFont,
        boldItalic: boldItalicFont,
        fontFallback: fontFallback,
      ),
    );

    pdf.addPage(
      pw.MultiPage(
        pageTheme: pageTheme,
        build: (context) => [
          _pdfHeader(),
          pw.SizedBox(height: 20),
          _pdfSectionTitle('Consumer Information'),
          _pdfBasicInfo(),
          pw.SizedBox(height: 15),
          _pdfSectionTitle('Building & Connection'),
          _pdfHouseDetails(),
          pw.SizedBox(height: 15),
          _pdfSectionTitle('Resources (Water & Solar)'),
          _pdfWaterAndSolarDetails(),
          pw.SizedBox(height: 20),
          _pdfSectionTitle('Electricity Consumption'),
          _pdfElectricity(),
          pw.SizedBox(height: 15),
          _pdfSectionTitle('Energy Performance Index (EPI)'),
          _pdfEPI(),
          pw.SizedBox(height: 15),
          _pdfSectionTitle('Cooking Fuel'),
          _pdfCookingFuel(),
          pw.SizedBox(height: 15),
          _pdfSectionTitle('Appliances'),
          _pdfAppliances(),
          pw.SizedBox(height: 15),
          _pdfSectionTitle('Vehicles'),
          _pdfVehicles(),
          pw.SizedBox(height: 30),
          _pdfTotal(),
        ],
      ),
    );

    if (aiReport != null && aiReport.isNotEmpty) {
      pdf.addPage(
        pw.MultiPage(
          pageTheme: pageTheme,
          header: (context) => _pdfHeader(),
          build: (context) {
            // Parses the Markdown text from AI into PDF widgets (Tables, Bold, etc.)
            final markdownWidgets = _parseMarkdownToPdf(
              aiReport,
              font,
              boldFont,
              italicFont,
              boldItalicFont,
              fontFallback,
            );

            return [
              _pdfSectionTitle('AI-Generated Energy Audit Report'),
              pw.SizedBox(height: 10),
              ...markdownWidgets, // Spread the parsed widgets here
            ];
          },
        ),
      );
    }

    return pdf.save();
  }

  /// --------------------------------------------------------------------------
  /// MARKDOWN PARSING HELPERS (FOR AI REPORT) - UPDATED
  /// --------------------------------------------------------------------------

  List<pw.Widget> _parseMarkdownToPdf(
    String markdown,
    pw.Font font,
    pw.Font boldFont,
    pw.Font italicFont,
    pw.Font boldItalicFont,
    List<pw.Font> fontFallback,
  ) {
    final List<pw.Widget> widgets = [];
    final lines = markdown.split('\n');
    List<List<String>> tableRows = [];
    bool inTable = false;

    for (var i = 0; i < lines.length; i++) {
      String line = lines[i].trim();

      if (line.isEmpty) {
        if (inTable) {
          _processTable(
            widgets,
            tableRows,
            font,
            boldFont,
            italicFont,
            boldItalicFont,
            fontFallback,
          );
          inTable = false;
          tableRows = [];
        }
        continue;
      }

      // 1. Handle Tables
      if (line.startsWith('|')) {
        inTable = true;
        final cells = line
            .split('|')
            .where((e) => e.trim().isNotEmpty)
            .map((e) => e.trim())
            .toList();

        if (cells.isNotEmpty && cells.first.replaceAll('-', '').isEmpty) {
          continue;
        }
        tableRows.add(cells);
        continue;
      } else if (inTable) {
        _processTable(
          widgets,
          tableRows,
          font,
          boldFont,
          italicFont,
          boldItalicFont,
          fontFallback,
        );
        inTable = false;
        tableRows = [];
      }

      // 2. Handle Headers (Added H4 support)
      if (line.startsWith('#### ')) {
        widgets.add(
          pw.Padding(
            padding: const pw.EdgeInsets.only(top: 6, bottom: 2),
            child: _parseRichText(
              line.substring(5),
              font,
              boldFont,
              italicFont,
              boldItalicFont,
              fontFallback,
              fontSize: 12,
              isBold: true, // Slightly smaller than H3
            ),
          ),
        );
      } else if (line.startsWith('### ')) {
        widgets.add(
          pw.Padding(
            padding: const pw.EdgeInsets.only(top: 12, bottom: 6),
            child: _parseRichText(
              line.substring(4),
              font,
              boldFont,
              italicFont,
              boldItalicFont,
              fontFallback,
              fontSize: 14,
              isBold: true,
            ),
          ),
        );
      } else if (line.startsWith('## ')) {
        widgets.add(
          pw.Padding(
            padding: const pw.EdgeInsets.only(top: 16, bottom: 8),
            child: _parseRichText(
              line.substring(3),
              font,
              boldFont,
              italicFont,
              boldItalicFont,
              fontFallback,
              fontSize: 16,
              isBold: true,
            ),
          ),
        );
      } else if (line.startsWith('# ')) {
        widgets.add(
          pw.Padding(
            padding: const pw.EdgeInsets.only(top: 20, bottom: 10),
            child: _parseRichText(
              line.substring(2),
              font,
              boldFont,
              italicFont,
              boldItalicFont,
              fontFallback,
              fontSize: 18,
              isBold: true,
            ),
          ),
        );
      }
      // 3. Handle Bullet Points
      else if (line.startsWith('* ') || line.startsWith('- ')) {
        widgets.add(
          pw.Padding(
            padding: const pw.EdgeInsets.only(left: 10, bottom: 4),
            child: pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text(
                  '• ',
                  style: pw.TextStyle(
                    font: font,
                    fontSize: 12,
                    fontFallback: fontFallback,
                  ),
                ),
                pw.Expanded(
                  child: _parseRichText(
                    line.substring(2),
                    font,
                    boldFont,
                    italicFont,
                    boldItalicFont,
                    fontFallback,
                  ),
                ),
              ],
            ),
          ),
        );
      }
      // 4. Regular Paragraphs
      else {
        widgets.add(
          pw.Padding(
            padding: const pw.EdgeInsets.only(bottom: 4),
            child: _parseRichText(
              line,
              font,
              boldFont,
              italicFont,
              boldItalicFont,
              fontFallback,
            ),
          ),
        );
      }
    }

    if (inTable) {
      _processTable(
        widgets,
        tableRows,
        font,
        boldFont,
        italicFont,
        boldItalicFont,
        fontFallback,
      );
    }

    return widgets;
  }

  void _processTable(
    List<pw.Widget> widgets,
    List<List<String>> rows,
    pw.Font font,
    pw.Font boldFont,
    pw.Font italicFont,
    pw.Font boldItalicFont,
    List<pw.Font> fontFallback,
  ) {
    if (rows.isEmpty) return;

    // Convert the List<List<String>> into List<List<pw.Widget>>
    // so we can parse markdown inside every cell
    final List<List<pw.Widget>> richRows = rows.map((row) {
      return row.map((cellText) {
        // Use the same helper used for paragraphs to parse bold/italics in cells
        return _parseRichText(
          cellText,
          font,
          boldFont,
          italicFont,
          boldItalicFont,
          fontFallback,
          fontSize: 10, // Keep table font size small
        );
      }).toList();
    }).toList();

    widgets.add(
      pw.Padding(
        padding: const pw.EdgeInsets.symmetric(vertical: 8),
        child: pw.TableHelper.fromTextArray(
          context:
              null, // Context is not strictly needed here for standard tables
          data: richRows, // Pass the List of Widgets, not Strings
          border: pw.TableBorder.all(color: PdfColors.grey400, width: 0.5),
          // We handle styling inside the widgets themselves now,
          // but we keep header decoration for the background color.
          headerDecoration: const pw.BoxDecoration(color: PdfColors.grey200),
          cellAlignments: {
            0: pw.Alignment.centerLeft,
            1: pw
                .Alignment
                .centerLeft, // Changed to left for better readability
          },
        ),
      ),
    );
  }

  pw.Widget _parseRichText(
    String text,
    pw.Font font,
    pw.Font boldFont,
    pw.Font italicFont,
    pw.Font boldItalicFont,
    List<pw.Font> fontFallback, {
    double fontSize = 10,
    bool isBold = false, // Fallback if no specific markdown is found
  }) {
    final List<pw.TextSpan> spans = [];

    // Regex to find the chunks:
    // Matches ***BoldItalic*** OR **Bold** OR *Italic*
    final RegExp exp = RegExp(r'(\*\*\*.*?\*\*\*)|(\*\*.*?\*\*)|(\*.*?\*)');

    int start = 0;

    for (final Match match in exp.allMatches(text)) {
      // 1. Add the normal text existing BEFORE the current match
      if (match.start > start) {
        spans.add(
          pw.TextSpan(
            text: text.substring(start, match.start),
            style: pw.TextStyle(
              font: isBold ? boldFont : font,
              fontSize: fontSize,
              fontFallback: fontFallback,
            ),
          ),
        );
      }

      // 2. Process the Markdown Match
      final String fullMatch = match.group(0)!; // e.g., "**Bold**"
      String cleanText = "";
      pw.Font styleFont = font;

      if (fullMatch.startsWith('***')) {
        // Handle ***BoldItalic*** -> Remove 3 chars from start and end
        cleanText = fullMatch.substring(3, fullMatch.length - 3);
        styleFont = boldItalicFont;
      } else if (fullMatch.startsWith('**')) {
        // Handle **Bold** -> Remove 2 chars from start and end
        cleanText = fullMatch.substring(2, fullMatch.length - 2);
        styleFont = boldFont;
      } else if (fullMatch.startsWith('*')) {
        // Handle *Italic* -> Remove 1 char from start and end
        cleanText = fullMatch.substring(1, fullMatch.length - 1);
        styleFont = italicFont;
      }

      // 3. Add the styled text without stars
      spans.add(
        pw.TextSpan(
          text: cleanText,
          style: pw.TextStyle(
            font: styleFont,
            fontSize: fontSize,
            fontFallback: fontFallback,
          ),
        ),
      );

      start = match.end;
    }

    // 4. Add any remaining text AFTER the last match
    if (start < text.length) {
      spans.add(
        pw.TextSpan(
          text: text.substring(start),
          style: pw.TextStyle(
            font: isBold ? boldFont : font,
            fontSize: fontSize,
            fontFallback: fontFallback,
          ),
        ),
      );
    }

    return pw.RichText(text: pw.TextSpan(children: spans));
  }

  // ---------------------------------------------------------------------------

  pw.Widget _pdfHeader() {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Text(
              'K-Urja Carbon Report',
              style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold),
            ),
            pw.Text(
              'Date: ${DateTime.now().toLocal().toString().split(' ')[0]}',
              style: const pw.TextStyle(color: PdfColors.grey700),
            ),
          ],
        ),
        pw.Divider(height: 20, thickness: 2),
      ],
    );
  }

  pw.Widget _pdfBasicInfo() {
    return pw.Container(
      padding: const pw.EdgeInsets.all(10),
      decoration: pw.BoxDecoration(
        border: pw.Border.all(color: PdfColors.grey400, width: 0.5),
      ),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.stretch,
        children: [
          pw.Row(
            children: [
              pw.Text(
                'Name: ',
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
              ),
              pw.Text(widget.auditData.ownerName),
            ],
          ),
          if (widget.auditData.houseName.isNotEmpty)
            pw.Row(
              children: [
                pw.Text(
                  'House: ',
                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                ),
                pw.Text(widget.auditData.houseName),
              ],
            ),
          pw.SizedBox(height: 5),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text('Mob: ${widget.auditData.mobileNumber}'),
              pw.Text('Consumer No: ${widget.auditData.consumerNo}'),
            ],
          ),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text('Section: ${widget.auditData.section}'),
              pw.Text(
                'Post: ${widget.auditData.ksebPostOffice} - ${widget.auditData.pinCode}',
              ),
            ],
          ),
          pw.Text('Panchayath: ${widget.auditData.panchayath}'),
          pw.Text(
            'Members: ${widget.auditData.memberCount} | Days Uninhabited: ${widget.auditData.daysUninhabited}',
          ),
        ],
      ),
    );
  }

  pw.Widget _pdfHouseDetails() {
    return pw.Container(
      padding: const pw.EdgeInsets.all(10),
      decoration: pw.BoxDecoration(
        border: pw.Border.all(color: PdfColors.grey400, width: 0.5),
      ),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text('Tariff: ${widget.auditData.tariffCategory}'),
              pw.Text('Load: ${widget.auditData.connectedLoad}'),
            ],
          ),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text('Type: ${widget.auditData.houseBuildingType}'),
              pw.Text('Area: ${widget.auditData.totalBuildingArea} sqft'),
            ],
          ),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text('Floors: ${widget.auditData.noOfFloors}'),
              pw.Text('Ownership: ${widget.auditData.ownOrRental}'),
            ],
          ),
          pw.Divider(thickness: 0.5, color: PdfColors.grey300),
          pw.Text(
            'Tech: ${widget.auditData.typeOfEarthing} Earthing | ${widget.auditData.noOfMcbs} MCBs | ${widget.auditData.typeOfEnergyMeter} Meter',
          ),
          if (widget.auditData.controlSystems.isNotEmpty)
            pw.Text('Controls: ${widget.auditData.controlSystems}'),
        ],
      ),
    );
  }

  pw.Widget _pdfWaterAndSolarDetails() {
    return pw.Container(
      padding: const pw.EdgeInsets.all(10),
      decoration: pw.BoxDecoration(
        border: pw.Border.all(color: PdfColors.grey400, width: 0.5),
      ),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text('Water Source: ${widget.auditData.waterSource}'),
          pw.Text('Water Usage: ${widget.auditData.waterUsage} L/day'),
          if (widget.auditData.waterBill.isNotEmpty)
            pw.Text('Water Bill: Rs ${widget.auditData.waterBill}'),
          pw.Text('Tank Capacity: ${widget.auditData.pumpData.tankCapacity} L'),
          pw.Text(
            'Pump Capacity: ${widget.auditData.pumpData.pumpCapacity} HP',
          ),
          pw.Text('Filling Time: ${widget.auditData.pumpData.fillingTime} min'),
          pw.Text('Pump Count: ${widget.auditData.pumpData.pumpCount}/day'),
          pw.Text(
            'Motor Daily Power Consumption: ${widget.auditData.dailyPowerPump.toStringAsFixed(2)} kWh',
          ),
          pw.Text(
            'Motor Annual Power Consumption: ${widget.auditData.annualPowerPump.toStringAsFixed(2)} kWh/yr',
          ),
          if (widget.auditData.hasSolarPlant) ...[
            pw.Divider(thickness: 0.5, color: PdfColors.grey300),
            pw.Text(
              'Solar Plant: Yes | Capacity: ${widget.auditData.solarCapacity} | Type: ${widget.auditData.solarPlantType ?? 'N/A'}',
              style: pw.TextStyle(color: PdfColors.green900),
            ),
          ] else ...[
            pw.Divider(thickness: 0.5, color: PdfColors.grey300),
            pw.Text('Solar Plant: No'),
          ],
        ],
      ),
    );
  }

  pw.Widget _pdfSectionTitle(String title) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          title,
          style: pw.TextStyle(
            fontSize: 16,
            fontWeight: pw.FontWeight.bold,
            color: PdfColors.blueGrey800,
          ),
        ),
        pw.SizedBox(height: 5),
      ],
    );
  }

  pw.Widget _pdfElectricity() {
    final annualConsumption =
        widget.auditData.calculatedAverageDailyConsumption * 365;
    final carbonFootprint = annualConsumption * 0.79;

    return pw.Column(
      children: [
        _pdfKeyValue(
          'Calc. Avg Daily',
          '${widget.auditData.calculatedAverageDailyConsumption.toStringAsFixed(2)} kWh',
          '${carbonFootprint.toStringAsFixed(2)} Kg CO2/yr',
        ),
      ],
    );
  }

  pw.Widget _pdfEPI() {
    final annualConsumption =
        widget.auditData.calculatedAverageDailyConsumption * 365;
    final buildingAreaSqFt =
        double.tryParse(widget.auditData.totalBuildingArea) ?? 0.0;
    final buildingAreaSqM = buildingAreaSqFt * 0.092903;
    final epi = buildingAreaSqM > 0 ? annualConsumption / buildingAreaSqM : 0.0;

    return pw.Container(
      padding: const pw.EdgeInsets.all(10),
      decoration: pw.BoxDecoration(
        border: pw.Border.all(color: PdfColors.grey400, width: 0.5),
      ),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Text(
            'EPI:',
            style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold),
          ),
          pw.Text(
            '${epi.toStringAsFixed(2)} kWh/m²/year',
            style: pw.TextStyle(
              fontSize: 16,
              fontWeight: pw.FontWeight.bold,
              color: PdfColors.deepPurple,
            ),
          ),
        ],
      ),
    );
  }

  pw.Widget _pdfCookingFuel() {
    final firewoodCarbon =
        CarbonCalculatorHelper.calculateFirewoodCarbonFootprint(
          widget.auditData.firewoodUsage,
        );
    final lpgCarbon = CarbonCalculatorHelper.calculateLpgCarbonFootprint(
      widget.auditData.lpgCylinders,
    );
    final biogasCarbon = CarbonCalculatorHelper.calculateBiogasCarbonFootprint(
      widget.auditData.biogasUsage,
    );

    return pw.Column(
      children: [
        if (firewoodCarbon > 0)
          _pdfKeyValue(
            'Firewood',
            '${widget.auditData.firewoodUsage} Kg/month',
            '${firewoodCarbon.toStringAsFixed(2)} Kg CO2/yr',
          ),
        if (lpgCarbon > 0)
          _pdfKeyValue(
            'LPG',
            '${widget.auditData.lpgCylinders} cyl/month',
            '${lpgCarbon.toStringAsFixed(2)} Kg CO2/yr',
          ),
        if (biogasCarbon > 0)
          _pdfKeyValue(
            'Biogas',
            '${widget.auditData.biogasUsage} hrs/month',
            '${biogasCarbon.toStringAsFixed(2)} Kg CO2/yr',
          ),
        if (widget.auditData.otherFuel.isNotEmpty)
          _pdfKeyValue('Other Fuel', widget.auditData.otherFuel, '-'),
      ],
    );
  }

  pw.Widget _pdfAppliances() {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        if (widget.auditData.lightSources.isNotEmpty)
          ..._pdfApplianceCategoryData(
            'Light Sources',
            widget.auditData.lightSources,
          ),
        if (widget.auditData.fanList.isNotEmpty)
          ..._pdfApplianceCategoryData('Fans', widget.auditData.fanList),
        if (widget.auditData.otherAppliances.isNotEmpty)
          ..._pdfApplianceCategoryData(
            'Other Appliances',
            widget.auditData.otherAppliances,
          ),
        if (widget.auditData.fridgeList.isNotEmpty)
          ..._pdfHeavyApplianceCategoryData(
            'Refrigerators',
            widget.auditData.fridgeList,
          ),
        if (widget.auditData.acList.isNotEmpty)
          ..._pdfHeavyApplianceCategoryData(
            'Air Conditioners',
            widget.auditData.acList,
          ),
      ],
    );
  }

  List<pw.Widget> _pdfApplianceCategoryData(
    String title,
    List<ApplianceModel> appliances,
  ) {
    final validItems = appliances.where((a) => a.name.isNotEmpty).toList();

    if (validItems.isEmpty) return [];

    return [
      pw.Text(
        title,
        style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 10),
      ),
      ...validItems.map((app) {
        final carbon = CarbonCalculatorHelper.calculateApplianceCarbonFootprint(
          app,
        );
        final double investment = double.tryParse(app.investmentCost) ?? 0.0;
        final double annualKwhSavings =
            (double.tryParse(app.savingWatts) ?? 0.0) *
            (double.tryParse(app.hours) ?? 0.0) *
            365 /
            1000;
        final double annualSavings =
            annualKwhSavings * widget.auditData.averageUnitCost;

        final String paybackPeriod = (annualSavings > 0 && investment > 0)
            ? '${(investment / annualSavings).toStringAsFixed(1)} years'
            : 'N/A';

        return _pdfKeyValue(
          app.name,
          '${app.watts}W x ${app.hours}h x ${app.count}',
          '${carbon.toStringAsFixed(2)} Kg CO2/yr',
          details: [
            if (app.tips.isNotEmpty)
              pw.Text(
                'Suggestion: ${app.tips}',
                style: pw.TextStyle(
                  fontStyle: pw.FontStyle.italic,
                  fontSize: 8,
                ),
              ),
            if (investment > 0)
              pw.Text(
                'Investment: Rs ${app.investmentCost}',
                style: const pw.TextStyle(fontSize: 8),
              ),
            if (annualSavings > 0)
              pw.Text(
                'Savings: Rs ${annualSavings.toStringAsFixed(2)}/yr',
                style: pw.TextStyle(color: PdfColors.green, fontSize: 8),
              ),
            if (paybackPeriod != 'N/A')
              pw.Text(
                'Payback: $paybackPeriod',
                style: pw.TextStyle(color: PdfColors.blue, fontSize: 8),
              ),
          ],
        );
      }),
      pw.SizedBox(height: 5),
    ];
  }

  List<pw.Widget> _pdfHeavyApplianceCategoryData(
    String title,
    List<HeavyApplianceModel> appliances,
  ) {
    final validItems = appliances.where((a) => a.capacity.isNotEmpty).toList();

    if (validItems.isEmpty) return [];

    return [
      pw.Text(
        title,
        style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 10),
      ),
      ...validItems.map((app) {
        final carbon =
            CarbonCalculatorHelper.calculateHeavyApplianceCarbonFootprint(
              app,
              isRefrigerator: title == 'Refrigerators',
            );
        final double investment = double.tryParse(app.investmentCost) ?? 0.0;
        final double annualKwhSavings =
            (double.tryParse(app.savingWatts) ?? 0.0) *
            (double.tryParse(app.hoursUsed) ?? 0.0) *
            (double.tryParse(app.daysUsed) ?? 0.0) /
            1000;
        final double annualSavings =
            annualKwhSavings * widget.auditData.averageUnitCost;

        final String paybackPeriod = (annualSavings > 0 && investment > 0)
            ? '${(investment / annualSavings).toStringAsFixed(1)} years'
            : 'N/A';

        final usageString = title == 'Refrigerators'
            ? '24h x ${app.daysUsed}d x ${app.count}'
            : '${app.hoursUsed}h x ${app.daysUsed}d x ${app.count}';

        return _pdfKeyValue(
          'Cap: ${app.capacity}',
          usageString,
          '${carbon.toStringAsFixed(2)} Kg CO2/yr',
          details: [
            if (app.tips.isNotEmpty)
              pw.Text(
                'Suggestion: ${app.tips}',
                style: pw.TextStyle(
                  fontStyle: pw.FontStyle.normal,
                  fontSize: 8,
                ),
              ),
            if (investment > 0)
              pw.Text(
                'Investment: Rs ${app.investmentCost}',
                style: const pw.TextStyle(fontSize: 8),
              ),
            if (annualSavings > 0)
              pw.Text(
                'Savings: Rs ${annualSavings.toStringAsFixed(2)}/yr',
                style: pw.TextStyle(color: PdfColors.green, fontSize: 8),
              ),
            if (paybackPeriod != 'N/A')
              pw.Text(
                'Payback: $paybackPeriod',
                style: pw.TextStyle(color: PdfColors.blue, fontSize: 8),
              ),
          ],
        );
      }),
      pw.SizedBox(height: 5),
    ];
  }

  pw.Widget _pdfVehicles() {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        ...widget.auditData.vehicleList
            .where((v) => v.fuelUsage.isNotEmpty)
            .map((v) {
              final carbon =
                  CarbonCalculatorHelper.calculateVehicleCarbonFootprint(v);
              return _pdfKeyValue(
                '${v.vehicleType} (${v.fuelType})',
                '${v.fuelUsage} L/month',
                '${carbon.toStringAsFixed(2)} Kg CO2/yr',
              );
            }),
      ],
    );
  }

  pw.Widget _pdfTotal() {
    final totalCarbon = _calculateTotalCarbon();

    return pw.Container(
      padding: const pw.EdgeInsets.all(10),
      decoration: const pw.BoxDecoration(color: PdfColors.grey200),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Text(
            'Total Annual Carbon Footprint',
            style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold),
          ),
          pw.Text(
            '${totalCarbon.toStringAsFixed(2)} Kg CO2',
            style: pw.TextStyle(
              fontSize: 16,
              fontWeight: pw.FontWeight.bold,
              color: PdfColors.green900,
            ),
          ),
        ],
      ),
    );
  }

  double _calculateTotalCarbon() {
    double totalCF = 0.0;

    // 1. Electricity (annual, from bills)
    final annualKwh = widget.auditData.calculatedAverageDailyConsumption * 365;
    totalCF += annualKwh * 0.79; // CarbonFactors.electricity

    // 2. LPG (cylinders per month)
    final lpgCyl = double.tryParse(widget.auditData.lpgCylinders) ?? 0.0;
    totalCF += lpgCyl * 12 * 44.5; // CarbonFactors.lpg

    // 3. Firewood (kg per month)
    final firewoodKg = double.tryParse(widget.auditData.firewoodUsage) ?? 0.0;
    totalCF += firewoodKg * 12 * 2.8; // CarbonFactors.wood

    // 4. Biogas (hours per month)
    final biogasHrs = double.tryParse(widget.auditData.biogasUsage) ?? 0.0;
    totalCF += biogasHrs * 12 * 1.8; // CarbonFactors.biogas

    // 5. Pump
    totalCF += CarbonCalculatorHelper.calculatePumpCarbonFootprint(
      widget.auditData.pumpData,
    );

    // 6. Appliances
    for (final app in widget.auditData.lightSources) {
      totalCF += CarbonCalculatorHelper.calculateApplianceCarbonFootprint(app);
    }
    for (final app in widget.auditData.fanList) {
      totalCF += CarbonCalculatorHelper.calculateApplianceCarbonFootprint(app);
    }
    for (final app in widget.auditData.otherAppliances) {
      totalCF += CarbonCalculatorHelper.calculateApplianceCarbonFootprint(app);
    }

    // 7. Heavy Appliances
    for (final app in widget.auditData.fridgeList) {
      totalCF += CarbonCalculatorHelper.calculateHeavyApplianceCarbonFootprint(
        app,
      );
    }
    for (final app in widget.auditData.acList) {
      totalCF += CarbonCalculatorHelper.calculateHeavyApplianceCarbonFootprint(
        app,
      );
    }

    // 8. Vehicles (petrol/diesel, km/day, use vehicleList)
    if (widget.auditData.vehicleList.isNotEmpty) {
      for (final v in widget.auditData.vehicleList) {
        totalCF += CarbonCalculatorHelper.calculateVehicleCarbonFootprint(v);
      }
    }

    return totalCF;
  }

  pw.Widget _pdfKeyValue(
    String key,
    String value,
    String carbon, {
    List<pw.Widget>? details,
  }) {
    return pw.Padding(
      padding: const pw.EdgeInsets.symmetric(vertical: 2),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Expanded(
                flex: 3,
                child: pw.Row(
                  children: [
                    pw.Text(
                      key,
                      style: pw.TextStyle(
                        fontSize: 10,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                    pw.SizedBox(width: 5),
                    pw.Text(
                      value,
                      style: const pw.TextStyle(
                        fontSize: 10,
                        color: PdfColors.grey700,
                      ),
                    ),
                  ],
                ),
              ),
              pw.Expanded(
                flex: 1,
                child: pw.Text(
                  carbon,
                  textAlign: pw.TextAlign.right,
                  style: const pw.TextStyle(fontSize: 10),
                ),
              ),
            ],
          ),
          if (details != null && details.isNotEmpty)
            pw.Padding(
              padding: const pw.EdgeInsets.only(left: 10, top: 2),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: details,
              ),
            ),
        ],
      ),
    );
  }
}

class ReportCard extends StatelessWidget {
  final Widget child;

  const ReportCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: child,
    );
  }
}
