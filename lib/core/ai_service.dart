import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:k_urja/data/local/database.dart';

class AiService {
  // Using a model capable of handling larger contexts and reasoning
  static const String openRouterApiUrl =
      "https://openrouter.ai/api/v1/chat/completions";

  static Future<String> generateReport(Audit audit) async {
    final apiKey = dotenv.env['OPENROUTER_API_KEY'];

    if (apiKey == null) {
      return "Error: OPENROUTER_API_KEY not found in .env file.";
    }

    // 1. Perform Math on the device side (Reliable)
    final calculations = _performCalculations(audit);

    // 2. Build a comprehensive prompt with ALL data
    final prompt = _buildPrompt(audit, calculations);

    try {
      final response = await http.post(
        Uri.parse(openRouterApiUrl),
        headers: {
          "Authorization": "Bearer $apiKey",
          "Content-Type": "application/json",
          "HTTP-Referer": "https://k-urja.app",
          "X-Title": "K-Urja Energy Audit",
        },
        body: jsonEncode({
          // Amazon Nova Lite is good, but Gemini Flash is often faster/cheaper for large contexts
          // You can stick to your preferred model.
          "model": "amazon/nova-2-lite-v1:free",
          "messages": [
            {
              "role": "system",
              "content":
                  "You are a Senior Certified Energy Auditor (BEE India). "
                  "Analyze the provided audit data deeply. "
                  "Report Structure: \n"
                  "1. EXECUTIVE SUMMARY (Key metrics & Efficiency Score).\n"
                  "2. CRITICAL SAFETY CHECK (Earthing, MCBs, Overloading).\n"
                  "3. CONSUMPTION ANALYSIS (Electricity, Water, Fuel).\n"
                  "4. RECOMMENDATIONS (Low Cost, High Cost, Solar).\n"
                  "Format: Markdown, Bold Headers, Tables for data. NO EMOJIS.",
            },
            {"role": "user", "content": prompt},
          ],
          "temperature": 0.3,
        }),
      );

      if (response.statusCode == 200) {
        final decodedResponse = jsonDecode(utf8.decode(response.bodyBytes));
        return decodedResponse['choices'][0]['message']['content'];
      } else {
        return "Error: Failed to generate report. Status code: ${response.statusCode}\n${response.body}";
      }
    } catch (e) {
      return "Error: Connection failed. Exception: $e";
    }
  }

  static Map<String, dynamic> _performCalculations(Audit audit) {
    double dailyConsumption =
        double.tryParse(audit.biMonthlyConsumption ?? '0') ?? 0.0;
    double unitRate = double.tryParse(audit.biMonthlyBill ?? '0') ?? 0.0;

    double annualKWh = dailyConsumption * 365;
    double monthlyBillEst = (dailyConsumption * 30) * unitRate;

    // Solar Calculation: 1kW plant ~ 4 units/day
    double requiredSolarKw = dailyConsumption / 4;
    if (requiredSolarKw < 1) requiredSolarKw = 1;

    // Carbon Footprint (India Grid Avg: 0.82 kg/kWh)
    double carbonMonthly = (dailyConsumption * 30) * 0.82;

    return {
      "dailyKWh": dailyConsumption,
      "annualKWh": annualKWh,
      "unitRate": unitRate,
      "monthlyBill": monthlyBillEst,
      "solarKw": requiredSolarKw,
      "carbonMonthly": carbonMonthly,
    };
  }

  // --- DATA PARSING HELPERS ---

  static String _parseAppliances(String? jsonStr) {
    if (jsonStr == null || jsonStr.isEmpty) return "None";
    try {
      final decoded = jsonDecode(jsonStr);
      // Handle the nested structure from AuditData.toDriftCompanion
      // Structure: {'lightSources': [], 'fanList': [], 'otherAppliances': []}
      if (decoded is Map) {
        List<String> items = [];
        decoded.forEach((key, value) {
          if (value is List) {
            for (var item in value) {
              items.add(
                "${item['count']}x ${item['name']} (${item['watts']}W, ${item['hours']}hrs/day)",
              );
            }
          }
        });
        return items.isEmpty ? "None" : items.join(", ");
      }
      // Handle legacy or direct list format
      else if (decoded is List) {
        return decoded
            .map((e) => "${e['count']}x ${e['name']} (${e['watts']}W)")
            .join(", ");
      }
      return "Invalid Data";
    } catch (e) {
      return "Error parsing appliances";
    }
  }

  static String _parseHeavyAppliances(String? jsonStr) {
    if (jsonStr == null || jsonStr.isEmpty) return "None";
    try {
      final decoded = jsonDecode(jsonStr);
      if (decoded is Map) {
        List<String> items = [];
        decoded.forEach((key, value) {
          if (value is List) {
            for (var item in value) {
              // Try to get detailed info
              String details = "${item['count']}x ${item['name']}";
              if (item['capacity'] != null) details += " [${item['capacity']}]";
              if (item['starRating'] != null)
                details += " [${item['starRating']} Star]";
              if (item['age'] != null) details += " [${item['age']} yrs old]";
              items.add(details);
            }
          }
        });
        return items.isEmpty ? "None" : items.join(", ");
      }
      return "None";
    } catch (e) {
      return "Error parsing heavy appliances";
    }
  }

  static String _parseVehicles(String? jsonStr) {
    if (jsonStr == null || jsonStr.isEmpty || jsonStr == "[]") return "None";
    try {
      final List list = jsonDecode(jsonStr);
      return list
          .map(
            (e) =>
                "${e['vehicleType']} (${e['fuelType']}, ${e['fuelUsage']} L/Month)",
          )
          .join(", ");
    } catch (e) {
      return "None";
    }
  }

  static String _buildPrompt(Audit audit, Map<String, dynamic> calcs) {
    return """
Perform a detailed Energy Audit based on the complete dataset below.

### 1. CONSUMER & LOCATION
* **Name:** ${audit.ownerName}
* **Consumer No:** ${audit.consumerNo}
* **Location:** ${audit.panchayath}, ${audit.ksebPostOffice} (PIN: ${audit.pinCode})
* **Tariff Category:** ${audit.tariffCategory} | **Section:** ${audit.section}

### 2. BUILDING INFRASTRUCTURE
* **Type:** ${audit.houseBuildingType} (${audit.ownOrRental})
* **Area:** ${audit.totalBuildingArea} SqFt across ${audit.noOfFloors} floors.
* **Occupancy:** ${audit.memberCount} Members.
* **Usage Pattern:** House uninhabited for ${audit.daysUninhabited} days/year.

### 3. ELECTRICAL CONNECTION & SAFETY (CRITICAL)
* **Connected Load:** ${audit.connectedLoad}
* **Connection Type:** ${audit.natureOfConnection} (Phase)
* **Earthing:** ${audit.typeOfEarthing} (Analyze if this is safe).
* **Protection:** ${audit.noOfMcbs} MCBs installed.
* **Meter Type:** ${audit.typeOfEnergyMeter}
* **Control Systems:** ${audit.controlSystems ?? 'None'}

### 4. ELECTRICITY CONSUMPTION METRICS
* **Daily Usage:** ${calcs['dailyKWh'].toStringAsFixed(2)} kWh
* **Annual Projection:** ${calcs['annualKWh'].toStringAsFixed(0)} kWh
* **Estimated Bill:** ₹${calcs['monthlyBill'].toStringAsFixed(0)} / month (Unit Rate: ₹${calcs['unitRate']})
* **Existing Solar:** ${(audit.hasSolarPlant ?? false) ? 'Yes (${audit.solarCapacity}, ${audit.solarPlantType})' : 'No'}

### 5. APPLIANCE INVENTORY
* **General Appliances:** ${_parseAppliances(audit.appliances)}
* **Heavy Loads (AC/Fridge/Motor):** ${_parseHeavyAppliances(audit.heavyAppliances)}
* **Cooking Fuel:** LPG: ${audit.lpg} cyl/mo | Firewood: ${audit.firewood} kg/mo | Biogas: ${audit.biogas} hrs/mo.

### 6. WATER & PUMPING
* **Source:** ${audit.waterSource}
* **Usage:** ${audit.waterUsage} Liters/day
* **Water Bill:** ₹${audit.waterBill}
* **Pump Details:**
  - Count: ${audit.pumpCount}
  - Capacity: ${audit.pumpCapacity} HP
  - Tank Size: ${audit.tankCapacity} Liters
  - Filling Time: ${audit.fillingTime} Minutes
  - Daily Power by Pump: ${audit.dailyPowerPump?.toStringAsFixed(2) ?? 'N/A'} kWh
  - Annual Power by Pump: ${audit.annualPowerPump?.toStringAsFixed(2) ?? 'N/A'} kWh
  *(Analyze if the pump filling time is efficient for the tank size/HP)*

### 7. TRANSPORTATION
* **Vehicles:** ${_parseVehicles(audit.vehicles)}

---

**AUDIT INSTRUCTIONS:**
1.  **Safety First:** If Earthing is 'Pipe' or 'None', or MCB count is low for the building size/load, flag this immediately in red/bold.
2.  **Pump Efficiency:** Calculate if the pump is taking too long to fill the tank based on HP.
3.  **Solar ROI:** Calculate payback for a proposed ${(calcs['solarKw'] as double).toStringAsFixed(1)}kW system.
4.  **Carbon Footprint:** Combine Electricity + Cooking + Fuel data for a total assessment.
5.  **Specific Tips:** Look at the 'Age' and 'Star Rating' of heavy appliances to suggest replacements.
---
**Format Rules:**
* Use specific numbers from the data above.
* Use Markdown Tables for the "Analysis" section.
* Keep the tone constructive but urgent regarding safety.
* Do not use emojis.
* No not use Italics, Bold Etc
* Follow all my instructions strictly
Generate the report now.
""";
  }
}
