import 'package:flutter/material.dart';
import 'package:k_urja/l10n/app_localizations.dart';
import 'package:k_urja/presentation/audit/models/appliance_model.dart';

class ApplianceSection extends StatefulWidget {
  final String title;
  final List<ApplianceModel> items;
  final VoidCallback onAdd;

  const ApplianceSection({
    super.key,
    required this.title,
    required this.items,
    required this.onAdd,
  });

  @override
  State<ApplianceSection> createState() => _ApplianceSectionState();
}

class _ApplianceSectionState extends State<ApplianceSection> {
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
          ApplianceModel item = entry.value;
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

  Widget _buildRow(BuildContext context, int index, ApplianceModel item) {
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
                      Expanded(
                        flex: 2,
                        child: TextFormField(
                          initialValue: item.name,
                          decoration: const InputDecoration(
                            labelText: 'Item Name',
                            isDense: true,
                            contentPadding: EdgeInsets.all(8),
                          ),
                          onChanged: (val) => item.name = val,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 1,
                        child: TextFormField(
                          initialValue: item.count,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'Count',
                            isDense: true,
                            contentPadding: EdgeInsets.all(8),
                          ),
                          onChanged: (val) => item.count = val,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          initialValue: item.watts,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'Watts',
                            suffixText: "W",
                            isDense: true,
                            contentPadding: EdgeInsets.all(8),
                          ),
                          onChanged: (val) => item.watts = val,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextFormField(
                          initialValue: item.hours,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'Hours/Day',
                            isDense: true,
                            contentPadding: EdgeInsets.all(8),
                          ),
                          onChanged: (val) => item.hours = val,
                        ),
                      ),
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
                      labelText: l10n
                          .labelSavingTips, // "Opportunity for saving power..."
                      hintText: "E.g. Replace old bulb with LED",
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
