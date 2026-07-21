// lib/presentation/screens/reports.dart
import 'package:flutter/material.dart';
import 'models.dart';

class ReportsPage extends StatelessWidget {
  final CalculationResult result;
  final AuditData? data;
  const ReportsPage({super.key, required this.result, this.data});

  @override
  Widget build(BuildContext context) {
    final sample = [
      result.electricity,
      result.appliances,
      result.cooking,
      result.transport,
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Final Report')),
      backgroundColor: const Color(0xFFF4FFEF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: _kpiCard(
                      'Total CO₂\n(kg / year)',
                      result.total.toStringAsFixed(2),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _kpiCard(
                      'Annual energy\n(kWh)',
                      result.annualKwh.toStringAsFixed(0),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _kpiCard(
                      'Energy saved\n(kWh)',
                      result.energySavedKwh.toStringAsFixed(0),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _kpiCard(
                      'Carbon saved\n(kg)',
                      result.carbonSavedKg.toStringAsFixed(2),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Overview',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        height: 140,
                        child: SimpleBarChart(values: sample),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _legendItem('Electricity', Colors.green.shade600),
                          _legendItem('Appliances', Colors.black54),
                          _legendItem('Cooking', Colors.orange.shade600),
                          _legendItem('Transport', Colors.blueGrey),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Breakdown',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      _breakdownRow('Electricity', result.electricity),
                      _breakdownRow('Appliances', result.appliances),
                      _breakdownRow('Cooking', result.cooking),
                      _breakdownRow('Transport', result.transport),
                      const Divider(),
                      _breakdownRow('Total', result.total, isTotal: true),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.lightbulb),
                      title: const Text('Replace old lights with LED'),
                      subtitle: const Text(
                        'LED lights can reduce lighting energy by ~50%',
                      ),
                    ),
                    ListTile(
                      leading: const Icon(Icons.solar_power),
                      title: const Text('Consider solar panels'),
                      subtitle: Text(
                        result.energySavedKwh > 0
                            ? 'You already have solar, estimated energy offset: ${result.energySavedKwh.toStringAsFixed(0)} kWh'
                            : 'Solar could offset ~20–40% of your grid electricity',
                      ),
                    ),
                    ListTile(
                      leading: const Icon(Icons.timer),
                      title: const Text('Appliance scheduling & maintenance'),
                      subtitle: const Text(
                        'Service refrigerators/AC and avoid phantom loads',
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () =>
                    Navigator.popUntil(context, (route) => route.isFirst),
                child: const Text('Back to Home'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _kpiCard(String title, String value) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(color: Colors.black54)),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _legendItem(String label, Color c) => Row(
    children: [
      Container(
        width: 12,
        height: 12,
        decoration: BoxDecoration(
          color: c,
          borderRadius: BorderRadius.circular(3),
        ),
      ),
      const SizedBox(width: 6),
      Text(label, style: const TextStyle(fontSize: 12)),
    ],
  );

  Widget _breakdownRow(String label, double value, {bool isTotal = false}) =>
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(
                fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            Text(
              value.toStringAsFixed(2),
              style: TextStyle(
                fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      );
}

class SimpleBarChart extends StatelessWidget {
  final List<double> values;
  const SimpleBarChart({super.key, required this.values});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (c, cons) {
        final maxV = values.isEmpty
            ? 1
            : values.reduce((a, b) => a > b ? a : b);
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: values.map((v) {
            final h = (v / maxV) * cons.maxHeight;
            return Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0, end: h),
                  duration: const Duration(milliseconds: 600),
                  builder: (context, height, _) => Container(
                    height: height,
                    width: 20,
                    decoration: BoxDecoration(
                      color: Colors.green.shade600,
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                const Text('', style: TextStyle(fontSize: 10)),
              ],
            );
          }).toList(),
        );
      },
    );
  }
}
