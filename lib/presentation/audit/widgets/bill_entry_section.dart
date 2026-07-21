import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BillEntrySection extends StatefulWidget {
  final bool hasSolar;
  final String? solarType; // 'On grid', 'Off grid', 'Hybrid'
  final Function(double average) onAverageCalculated;
  final Function(double unitCost) onUnitCostChanged;

  const BillEntrySection({
    super.key,
    required this.hasSolar,
    required this.solarType,
    required this.onAverageCalculated,
    required this.onUnitCostChanged,
  });

  @override
  State<BillEntrySection> createState() => _BillEntrySectionState();
}

// 1. Add 'with AutomaticKeepAliveClientMixin' to the State class
class _BillEntrySectionState extends State<BillEntrySection>
    with AutomaticKeepAliveClientMixin {
  int _numberOfBills = 6;
  List<TextEditingController> _controllers = [];
  final TextEditingController _unitCostController = TextEditingController();
  double _calculatedAverage = 0.0;
  double _totalUnits = 0.0;
  double _averageUnitCost = 0.0;

  // 2. Override wantKeepAlive to return true
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _initializeFields();
    _unitCostController.addListener(_updateUnitCost);
    _loadUnitCost();
  }

  Future<void> _loadUnitCost() async {
    final prefs = await SharedPreferences.getInstance();
    final unitCost = prefs.getDouble('averageUnitCost');
    if (unitCost != null) {
      if (mounted) {
        setState(() {
          _averageUnitCost = unitCost;
          _unitCostController.text = unitCost.toString();
        });
        widget.onUnitCostChanged(unitCost);
      }
    }
  }

  @override
  void didUpdateWidget(covariant BillEntrySection oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Only reset if the solar settings specifically changed.
    // This prevents data loss if the parent rebuilds for other reasons.
    if (oldWidget.hasSolar != widget.hasSolar ||
        oldWidget.solarType != widget.solarType) {
      _initializeFields();
    }
  }

  void _initializeFields() {
    if (!widget.hasSolar) {
      _numberOfBills = 6;
    } else {
      if (widget.solarType == 'Off grid') {
        _numberOfBills = 6;
      } else {
        _numberOfBills = 12; // On grid, Hybrid
      }
    }

    // Dispose old controllers safely before creating new ones
    for (var c in _controllers) {
      c.dispose();
    }

    _controllers = List.generate(
      _numberOfBills,
      (index) => TextEditingController(),
    );

    // Reset calculation
    _calculateAverage();
  }

  @override
  void dispose() {
    for (var c in _controllers) {
      c.dispose();
    }
    _unitCostController.dispose();
    super.dispose();
  }

  void _updateUnitCost() async {
    // Only proceed if the text is a valid number
    if (_unitCostController.text.isEmpty) return;

    final cost = double.tryParse(_unitCostController.text) ?? 0.0;

    // Avoid infinite loops or unnecessary rebuilds
    if (cost != _averageUnitCost) {
      final prefs = await SharedPreferences.getInstance();
      setState(() {
        _averageUnitCost = cost;
      });
      prefs.setDouble('averageUnitCost', _averageUnitCost);
      widget.onUnitCostChanged(_averageUnitCost);
    }
  }

  void _calculateAverage() {
    double sum = 0;
    int count = 0;
    for (var controller in _controllers) {
      if (controller.text.isNotEmpty) {
        final value = double.tryParse(controller.text);
        if (value != null && value > 0) {
          sum += value;
          count++;
        }
      }
    }

    double dailyAverage = 0;
    double annualConsumption = 0;

    if (count > 0) {
      // Calculate the average consumption per bill period
      final averagePerBill = sum / count;
      // Extrapolate to annual consumption (_numberOfBills is 6 for bimonthly)
      annualConsumption = averagePerBill * _numberOfBills;
      // Calculate the daily average from the extrapolated annual figure
      dailyAverage = annualConsumption / 365;
    }

    // Update local state
    setState(() {
      _totalUnits =
          annualConsumption; // This now correctly reflects extrapolated annual
      _calculatedAverage = dailyAverage;
    });

    // Send the result back to the main page immediately
    widget.onAverageCalculated(_calculatedAverage);
  }

  Widget _buildBillEntryRows() {
    List<Widget> rows = [];
    for (int i = 0; i < _numberOfBills; i += 3) {
      List<Widget> rowChildren = [];
      for (int j = i; j < i + 3 && j < _numberOfBills; j++) {
        rowChildren.add(
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: TextFormField(
                controller: _controllers[j],
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Bill ${j + 1}',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 0,
                  ),
                ),
                // Changed from onChanged to onEditingComplete or just keep onChanged
                // Keeping onChanged is fine, but ensures calculation triggers
                onChanged: (_) => _calculateAverage(),
              ),
            ),
          ),
        );
      }
      rows.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Row(children: rowChildren),
        ),
      );
    }
    return Column(children: rows);
  }

  @override
  Widget build(BuildContext context) {
    // 3. Must call super.build(context) for AutomaticKeepAliveClientMixin
    super.build(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Enter last $_numberOfBills Electricity Bills",
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey,
          ),
        ),
        const Text(
          "(Enter Units in kWh)",
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
        const SizedBox(height: 16),

        _buildBillEntryRows(),

        const SizedBox(height: 20),

        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFFCDEA66).withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFCDEA66), width: 2),
          ),
          child: Column(
            children: [
              const Text(
                "Total Annual Consumption",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Text(
                "${_totalUnits.toStringAsFixed(0)} kWh",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const Divider(),

              const Text(
                "Daily Average",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Text(
                "${_calculatedAverage.toStringAsFixed(2)} kWh/day",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        TextFormField(
          controller: _unitCostController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'Average Unit Cost (₹/kWh)',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 15,
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter the average unit cost';
            }
            if (double.tryParse(value) == null) {
              return 'Please enter a valid number';
            }
            if (double.parse(value) <= 0) {
              return 'Unit cost must be greater than zero';
            }
            return null;
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
