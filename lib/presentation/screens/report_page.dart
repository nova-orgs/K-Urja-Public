import 'package:flutter/material.dart';
import 'package:k_urja/core/carbon_calculator.dart';
import 'package:k_urja/data/local/database.dart';
import 'package:k_urja/data/models/audit_report_model.dart';
import 'package:k_urja/presentation/screens/supabase_service.dart';

class ReportPage extends StatefulWidget {
  final Audit audit;

  const ReportPage({super.key, required this.audit});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  AuditReportModel? _auditReport;
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _calculateReport();
  }

  Future<void> _calculateReport() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    final userId = SupabaseService.userId;
    if (userId == null) {
      setState(() {
        _error = "User not authenticated. Cannot calculate report.";
        _isLoading = false;
      });
      return;
    }

    try {
      final report = CarbonCalculator.performCalculations(widget.audit, userId);
      setState(() {
        _auditReport = report;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = "Failed to calculate report: $e";
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Audit Report')),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  _error!,
                  style: const TextStyle(color: Colors.red, fontSize: 16),
                ),
              ),
            )
          : _auditReport != null
          ? SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTotalCarbonFootprint(),
                  const SizedBox(height: 24),
                  Text(
                    "Consumption Breakdown",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 16),
                  GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      _buildInfoCard(
                        "Electricity",
                        _auditReport!.electricityConsumption,
                        "kg CO2e",
                      ),
                      _buildInfoCard(
                        "Appliances",
                        _auditReport!.applianceCarbonFootprint,
                        "kg CO2e",
                      ),
                      _buildInfoCard(
                        "Heavy Appliances",
                        _auditReport!.heavyApplianceCarbonFootprint,
                        "kg CO2e",
                      ),
                      _buildInfoCard(
                        "Vehicles",
                        _auditReport!.vehicleCarbonFootprint,
                        "kg CO2e",
                      ),
                      _buildInfoCard(
                        "Gas & Fuels",
                        _auditReport!.gasAndOtherFuels,
                        "kg CO2e",
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  _buildSuggestionsCard(
                    "Energy Saving Suggestions",
                    _auditReport!.energySavingSuggestions,
                  ),
                ],
              ),
            )
          : const Center(child: Text('Failed to generate report.')),
    );
  }

  Widget _buildTotalCarbonFootprint() {
    return Card(
      color: Colors.black,
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            children: [
              const Text(
                'Total Carbon Footprint',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '${_auditReport?.totalCarbonFootprint?.toStringAsFixed(2) ?? 'N/A'} kg CO2e/year',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard(String title, double? value, String unit) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              '${value?.toStringAsFixed(2) ?? 'N/A'} $unit',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSuggestionsCard(
    String title,
    List<Map<String, dynamic>>? suggestions,
  ) {
    if (suggestions == null || suggestions.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 16),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: suggestions.length,
          itemBuilder: (context, index) {
            final suggestion = suggestions[index];
            return Card(
              elevation: 2,
              margin: const EdgeInsets.only(bottom: 10),
              child: ListTile(
                leading: const Icon(Icons.lightbulb_outline),
                title: Text(suggestion['suggestion'] ?? 'No suggestion text.'),
                subtitle: suggestion['appliance_name'] != null
                    ? Text("Appliance: ${suggestion['appliance_name']}")
                    : null,
              ),
            );
          },
        ),
      ],
    );
  }
}
