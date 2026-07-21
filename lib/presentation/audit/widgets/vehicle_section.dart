import 'package:flutter/material.dart';
import 'package:k_urja/presentation/audit/models/vehicle_model.dart';

class VehicleSection extends StatefulWidget {
  final String title;
  final List<VehicleModel> items;
  final VoidCallback onAdd;
  final Function(VehicleModel) onRemove;

  const VehicleSection({
    super.key,
    required this.title,
    required this.items,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  State<VehicleSection> createState() => _VehicleSectionState();
}

class _VehicleSectionState extends State<VehicleSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const Divider(thickness: 2),
        const SizedBox(height: 10),

        ...widget.items.map((item) => _buildRow(context, item)),

        Align(
          alignment: Alignment.centerRight,
          child: TextButton.icon(
            onPressed: widget.onAdd,
            icon: const Icon(Icons.add_circle, color: Color(0xFFCDEA66)),
            label: const Text("Add Vehicle"),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildRow(BuildContext context, VehicleModel item) {
    final vehicleTypes = [
      'Car',
      'Two Wheeler',
      'Three Wheeler',
      'Heavy Vehicles',
    ];
    final fuelTypes = ['Petrol', 'Diesel', 'CNG', 'Electric'];

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    initialValue: item.vehicleType,
                    decoration: const InputDecoration(
                      labelText: 'Vehicle Type',
                    ),
                    items: vehicleTypes.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        item.vehicleType = newValue!;
                      });
                    },
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () => widget.onRemove(item),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    initialValue: item.fuelType,
                    decoration: const InputDecoration(labelText: 'Fuel Type'),
                    items: fuelTypes.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        item.fuelType = newValue!;
                        item.isEV = newValue == 'Electric';
                      });
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    initialValue: item.kmUsage,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'Monthly KM'),
                    onChanged: (val) => item.kmUsage = val,
                  ),
                ),
              ],
            ),
            if (!item.isEV) ...[
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      initialValue: item.fuelUsage,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Fuel (Liters)',
                      ),
                      onChanged: (val) => item.fuelUsage = val,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      initialValue: item.fuelCost,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(labelText: 'Cost (₹)'),
                      onChanged: (val) => item.fuelCost = val,
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
