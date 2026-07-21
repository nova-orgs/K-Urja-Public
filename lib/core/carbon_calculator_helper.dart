import 'package:k_urja/core/carbon_factors.dart';
import 'package:k_urja/presentation/audit/audit_details_page.dart';
import 'package:k_urja/presentation/audit/models/appliance_model.dart';
import 'package:k_urja/presentation/audit/models/heavy_appliance_model.dart';
import 'package:k_urja/presentation/audit/models/vehicle_model.dart';

class CarbonCalculatorHelper {
  // Calculation for regular appliances like lights, fans, etc.
  static double calculateApplianceCarbonFootprint(ApplianceModel appliance) {
    final watts = double.tryParse(appliance.watts) ?? 0;
    final hours = double.tryParse(appliance.hours) ?? 0;
    final count = int.tryParse(appliance.count) ?? 1;
    // Assuming 365 days of usage
    final annualConsumptionKwh = (watts * hours * count * 365) / 1000;
    return annualConsumptionKwh * CarbonFactors.electricity;
  }

  // Calculation for heavy appliances like fridge and AC
  static double calculateHeavyApplianceCarbonFootprint(
    HeavyApplianceModel heavyAppliance, {
    bool isRefrigerator = false,
  }) {
    final watts = double.tryParse(heavyAppliance.wattage) ?? 0;
    final hours = isRefrigerator
        ? 24.0
        : (double.tryParse(heavyAppliance.hoursUsed) ?? 0);
    final days = double.tryParse(heavyAppliance.daysUsed) ?? 365;
    final count = int.tryParse(heavyAppliance.count) ?? 1;

    final annualConsumptionKwh = (watts * hours * days * count) / 1000;
    return annualConsumptionKwh * CarbonFactors.electricity;
  }

  // Calculation for vehicles
  static double calculateVehicleCarbonFootprint(VehicleModel vehicle) {
    final fuelUsage =
        double.tryParse(vehicle.fuelUsage) ??
        0; // Assuming fuelUsage is in liters/month
    final annualFuelUsage = fuelUsage * 12;

    switch (vehicle.fuelType) {
      case 'Petrol':
        return annualFuelUsage * CarbonFactors.petrol;
      case 'Diesel':
        return annualFuelUsage * CarbonFactors.diesel;
      default:
        return 0.0;
    }
  }

  // Calculation for cooking fuels
  static double calculateFirewoodCarbonFootprint(String kgPerMonth) {
    final monthlyUsage = double.tryParse(kgPerMonth) ?? 0;
    final annualUsage = monthlyUsage * 12;
    return annualUsage * CarbonFactors.wood;
  }

  static double calculateLpgCarbonFootprint(String cylindersPerMonth) {
    final monthlyUsage = double.tryParse(cylindersPerMonth) ?? 0;
    final annualCylinders = monthlyUsage * 12;
    return annualCylinders * CarbonFactors.lpg;
  }

  static double calculateBiogasCarbonFootprint(String hoursPerMonth) {
    final monthlyUsage = double.tryParse(hoursPerMonth) ?? 0;
    final annualUsage = monthlyUsage * 12;
    return annualUsage * CarbonFactors.biogas;
  }

  static double calculatePumpCarbonFootprint(PumpData pumpData) {
    final pumpCapacityHP = double.tryParse(pumpData.pumpCapacity) ?? 0;
    final fillingTimeMinutes = double.tryParse(pumpData.fillingTime) ?? 0;
    final pumpCount = double.tryParse(pumpData.pumpCount) ?? 0;

    if (pumpCapacityHP == 0 || fillingTimeMinutes == 0 || pumpCount == 0) {
      return 0.0;
    }

    final pumpCapacityWatts = pumpCapacityHP * 746;
    final fillingTimeHours = fillingTimeMinutes / 60;

    final dailyKwh = (pumpCapacityWatts * fillingTimeHours * pumpCount) / 1000;
    final annualKwh = dailyKwh * 365;

    return annualKwh * CarbonFactors.electricity;
  }

  static double calculateSavedCarbon(String savingWatts, String hours) {
    final watts = double.tryParse(savingWatts) ?? 0;
    final dailyHours = double.tryParse(hours) ?? 0;
    if (watts == 0) return 0;

    final annualKwh = (watts * dailyHours * 365) / 1000;
    return annualKwh * CarbonFactors.electricity;
  }
}
