import 'package:flutter/material.dart';
import 'package:k_urja/l10n/app_localizations.dart';
import 'package:k_urja/presentation/audit/models/heavy_appliance_model.dart';

class HeavyApplianceSection extends StatefulWidget {
  final String title;
  final List<HeavyApplianceModel> items;
  final VoidCallback onAdd;
  final bool isAC;

  const HeavyApplianceSection({
    super.key,
    required this.title,
    required this.items,
    required this.onAdd,
    this.isAC = false,
  });

  @override
  State<HeavyApplianceSection> createState() => _HeavyApplianceSectionState();
}

class _HeavyApplianceSectionState extends State<HeavyApplianceSection> {
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

        ...widget.items.asMap().entries.map((entry) {
          int index = entry.key;
          HeavyApplianceModel item = entry.value;
          return _buildRow(context, index, item);
        }),

        Align(
          alignment: Alignment.centerRight,
          child: TextButton.icon(
            onPressed: widget.onAdd,
            icon: const Icon(Icons.add_circle, color: Color(0xFFCDEA66)),
            label: const Text("Add Item"),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildRow(BuildContext context, int index, HeavyApplianceModel item) {
    final l10n = AppLocalizations.of(context)!;

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
            // --- SECTION 1: CURRENT USAGE (Gray Background) ---
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      // Capacity (Liters or Tons)
                      Expanded(
                        child: TextFormField(
                          initialValue: item.capacity,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: widget.isAC
                                ? 'Capacity (Tons)'
                                : 'Capacity (Liters)',
                            isDense: true,
                            contentPadding: const EdgeInsets.all(8),
                          ),
                          onChanged: (val) => item.capacity = val,
                        ),
                      ),
                      const SizedBox(width: 10),
                      // Wattage
                      Expanded(
                        child: TextFormField(
                          initialValue: item.wattage,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'Wattage (W)',
                            isDense: true,
                            contentPadding: EdgeInsets.all(8),
                          ),
                          onChanged: (val) => item.wattage = val,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      // Star Rating
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          initialValue: item.starRating,
                          decoration: const InputDecoration(
                            labelText: 'Stars',
                            isDense: true,
                            contentPadding: EdgeInsets.all(8),
                          ),
                          items: ['1', '2', '3', '4', '5'].map((star) {
                            return DropdownMenuItem(
                              value: star,
                              child: Text("$star Star"),
                            );
                          }).toList(),
                          onChanged: (val) => item.starRating = val!,
                        ),
                      ),
                      const SizedBox(width: 10),
                      // Days Used
                      Expanded(
                        child: TextFormField(
                          initialValue: item.daysUsed,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'Days/Year',
                            isDense: true,
                            contentPadding: EdgeInsets.all(8),
                          ),
                          onChanged: (val) => item.daysUsed = val,
                        ),
                      ),
                      // Hours Used (AC Only)
                      if (widget.isAC) ...[
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextFormField(
                            initialValue: item.hoursUsed,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: 'Hours/Day',
                              isDense: true,
                              contentPadding: EdgeInsets.all(8),
                            ),
                            onChanged: (val) => item.hoursUsed = val,
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),
            Text(
              "Recommendation (Student Input)",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 8),

            // --- SECTION 2: SAVINGS & INVESTMENT ---
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    initialValue: item.savingWatts,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      labelText:
                          l10n.labelPowerSavings, // "Est. Savings (Watts)"
                      suffixText: "W",
                      isDense: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onChanged: (val) => item.savingWatts = val,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    initialValue: item.investmentCost,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: l10n.labelInvestment, // "Investment Cost (₹)"
                      prefixText: "₹",
                      isDense: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onChanged: (val) => item.investmentCost = val,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            // --- SECTION 3: SUGGESTION TEXT ---
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    initialValue: item.tips,
                    maxLines: 2,
                    decoration: InputDecoration(
                      labelText: l10n.labelSavingTips,
                      hintText: "E.g., Upgrade to 5 Star Inverter AC",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      isDense: true,
                    ),
                    onChanged: (val) => item.tips = val,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.redAccent),
                  onPressed: () {
                    setState(() {
                      widget.items.removeAt(index);
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
