import 'dart:convert';
import 'package:k_urja/data/local/database.dart';
import 'package:k_urja/data/models/audit_report_model.dart'
    as app_model; // Alias added
import 'package:k_urja/presentation/audit/models/appliance_model.dart';
import 'package:k_urja/presentation/audit/models/heavy_appliance_model.dart';
import 'package:k_urja/presentation/audit/models/vehicle_model.dart';
import 'package:uuid/uuid.dart';

class CarbonCalculator {
  // Emission factors (kg CO2e per unit)
  static const double efElectricity = 0.82; // kg CO2e per kWh (India's factor)
  static const double efPetrol = 2.31; // kg CO2e per litre
  static const double efDiesel = 2.68; // kg CO2e per litre
  static const double efLpg = 2.93; // kg CO2e per kg
  static const double efFirewood = 1.8; // kg CO2e per kg (approximation)

  static app_model.AuditReportModel performCalculations(
    Audit audit,
    String userId,
  ) {
    final electricityCF = calculateElectricityCarbonFootprint(audit);
    final applianceCF = calculateApplianceCarbonFootprint(audit);
    final heavyApplianceCF = calculateHeavyApplianceCarbonFootprint(audit);
    final vehicleCF = calculateVehicleCarbonFootprint(audit);
    final gasAndFuelsCF = calculateGasAndOtherFuelsCarbonFootprint(audit);
    final pumpElectricityCF = calculatePumpElectricityCarbonFootprint(audit);

    final totalCF =
        electricityCF +
        applianceCF +
        heavyApplianceCF +
        vehicleCF +
        gasAndFuelsCF +
        pumpElectricityCF;

    final allSuggestions = <Map<String, dynamic>>[];
    final estimatedAnnualSavings = <Map<String, dynamic>>[];
    final potentialInvestmentCosts = <Map<String, dynamic>>[];
    final paybackPeriods = <Map<String, dynamic>>[];

    final biMonthlyBill = double.tryParse(audit.biMonthlyBill ?? '0') ?? 0.0;
    final biMonthlyConsumption =
        double.tryParse(audit.biMonthlyConsumption ?? '0') ?? 0.0;
    final averageUnitCost = biMonthlyConsumption > 0
        ? biMonthlyBill / biMonthlyConsumption
        : 0.0;

    double totalVehicleFuelUsage = 0.0;
    try {
      final vehicles = (jsonDecode(audit.vehicles) as List)
          .map((e) => VehicleModel.fromJson(e))
          .toList();
      for (var vehicle in vehicles) {
        totalVehicleFuelUsage += double.tryParse(vehicle.fuelUsage) ?? 0.0;
      }
    } catch (e) {
      // Ignore errors if JSON is invalid
    }

    try {
      final appliances = jsonDecode(audit.appliances);
      final lightSources = (appliances['lightSources'] as List)
          .map((e) => ApplianceModel.fromJson(e))
          .toList();
      final fanList = (appliances['fanList'] as List)
          .map((e) => ApplianceModel.fromJson(e))
          .toList();
      final otherAppliances = (appliances['otherAppliances'] as List)
          .map((e) => ApplianceModel.fromJson(e))
          .toList();

      for (var appliance in [...lightSources, ...fanList, ...otherAppliances]) {
        if (appliance.tips.isNotEmpty) {
          allSuggestions.add({
            'appliance_name': appliance.name,
            'suggestion': appliance.tips,
            'saving_watts': appliance.savingWatts,
            'investment_cost': appliance.investmentCost,
          });
        }

        if (appliance.savingWatts.isNotEmpty &&
            appliance.investmentCost.isNotEmpty) {
          final savingWatts = double.tryParse(appliance.savingWatts) ?? 0.0;
          final hours = double.tryParse(appliance.hours) ?? 0.0;
          final investmentCost =
              double.tryParse(appliance.investmentCost) ?? 0.0;

          final annualKwhSavings = savingWatts * hours * 365 / 1000;
          final annualMoneySavings = annualKwhSavings * averageUnitCost;
          final paybackPeriod = annualMoneySavings > 0
              ? investmentCost / annualMoneySavings
              : 0.0;

          if (annualMoneySavings > 0) {
            estimatedAnnualSavings.add({
              'appliance_name': appliance.name,
              'savings': annualMoneySavings,
            });
          }
          if (investmentCost > 0) {
            potentialInvestmentCosts.add({
              'appliance_name': appliance.name,
              'cost': investmentCost,
            });
          }
          if (paybackPeriod > 0) {
            paybackPeriods.add({
              'appliance_name': appliance.name,
              'period': paybackPeriod,
            });
          }
        }
      }
    } catch (e) {
      // Ignore errors if JSON is invalid
    }

    try {
      final heavyAppliancesRaw = jsonDecode(audit.heavyAppliances);
      List<HeavyApplianceModel> fridgeList = [];
      List<HeavyApplianceModel> otherHeavyAppliances = [];

      if (heavyAppliancesRaw is Map) {
        // New format
        fridgeList = (heavyAppliancesRaw['fridgeList'] as List)
            .map((e) => HeavyApplianceModel.fromJson(e))
            .toList();
        otherHeavyAppliances = (heavyAppliancesRaw['acList'] as List)
            .map((e) => HeavyApplianceModel.fromJson(e))
            .toList();
      } else if (heavyAppliancesRaw is List) {
        // Old format, treat all as 'other'
        otherHeavyAppliances = heavyAppliancesRaw
            .map((e) => HeavyApplianceModel.fromJson(e))
            .toList();
      }

      // Process refrigerators with 24 hours
      for (var appliance in fridgeList) {
        if (appliance.savingWatts.isNotEmpty &&
            appliance.investmentCost.isNotEmpty) {
          final savingWatts = double.tryParse(appliance.savingWatts) ?? 0.0;
          const hours = 24.0; // Refrigerators run all day
          final investmentCost =
              double.tryParse(appliance.investmentCost) ?? 0.0;

          final annualKwhSavings = savingWatts * hours * 365 / 1000;
          final annualMoneySavings = annualKwhSavings * averageUnitCost;
          final paybackPeriod = annualMoneySavings > 0
              ? investmentCost / annualMoneySavings
              : 0.0;

          if (annualMoneySavings > 0) {
            estimatedAnnualSavings.add({
              'appliance_name': 'Refrigerator',
              'savings': annualMoneySavings,
            });
          }
          if (investmentCost > 0) {
            potentialInvestmentCosts.add({
              'appliance_name': 'Refrigerator',
              'cost': investmentCost,
            });
          }
          if (paybackPeriod > 0) {
            paybackPeriods.add({
              'appliance_name': 'Refrigerator',
              'period': paybackPeriod,
            });
          }
        }
      }

      // Process other heavy appliances
      for (var appliance in otherHeavyAppliances) {
        if (appliance.tips.isNotEmpty) {
          allSuggestions.add({
            'appliance_name':
                'Heavy Appliance', // HeavyApplianceModel doesn't have a name
            'suggestion': appliance.tips,
            'saving_watts': appliance.savingWatts,
            'investment_cost': appliance.investmentCost,
          });
        }
        if (appliance.savingWatts.isNotEmpty &&
            appliance.investmentCost.isNotEmpty) {
          final savingWatts = double.tryParse(appliance.savingWatts) ?? 0.0;
          final hours = double.tryParse(appliance.hoursUsed) ?? 0.0;
          final investmentCost =
              double.tryParse(appliance.investmentCost) ?? 0.0;

          final annualKwhSavings = savingWatts * hours * 365 / 1000;
          final annualMoneySavings = annualKwhSavings * averageUnitCost;
          final paybackPeriod = annualMoneySavings > 0
              ? investmentCost / annualMoneySavings
              : 0.0;

          if (annualMoneySavings > 0) {
            estimatedAnnualSavings.add({
              'appliance_name': 'Heavy Appliance',
              'savings': annualMoneySavings,
            });
          }
          if (investmentCost > 0) {
            potentialInvestmentCosts.add({
              'appliance_name': 'Heavy Appliance',
              'cost': investmentCost,
            });
          }
          if (paybackPeriod > 0) {
            paybackPeriods.add({
              'appliance_name': 'Heavy Appliance',
              'period': paybackPeriod,
            });
          }
        }
      }
    } catch (e) {
      // Ignore errors if JSON is invalid
    }

    final efficiencyImprovements = <Map<String, dynamic>>[];
    final renewableOpportunities = <Map<String, dynamic>>[];

    for (final suggestion in allSuggestions) {
      if (suggestion['suggestion']!.toLowerCase().contains('solar') ||
          suggestion['suggestion']!.toLowerCase().contains('renewable')) {
        renewableOpportunities.add(suggestion);
      } else {
        efficiencyImprovements.add(suggestion);
      }
    }

    return app_model.AuditReportModel(
      id: const Uuid().v4(),
      userId: userId,
      createdAt: DateTime.now(),
      totalCarbonFootprint: totalCF,
      electricityConsumption: electricityCF + pumpElectricityCF,
      applianceCarbonFootprint: applianceCF,
      heavyApplianceCarbonFootprint: heavyApplianceCF,
      vehicleCarbonFootprint: vehicleCF,
      gasAndOtherFuels: gasAndFuelsCF,
      vehicleUsage: totalVehicleFuelUsage,
      wasteAndRecycling: 0,
      estimatedAnnualSavings: estimatedAnnualSavings,
      potentialInvestmentCost: potentialInvestmentCosts,
      paybackPeriod: paybackPeriods,
      energySavingSuggestions: allSuggestions,
      energyEfficiencyImprovements: efficiencyImprovements,
      renewableEnergyOpportunities: renewableOpportunities,
    );
  }

  static double calculateElectricityCarbonFootprint(Audit audit) {
    final biMonthlyConsumption =
        double.tryParse(audit.biMonthlyConsumption ?? '0') ?? 0;
    final annualConsumption = biMonthlyConsumption * 365;
    return annualConsumption * efElectricity;
  }

  static double calculatePumpElectricityCarbonFootprint(Audit audit) {
    return (audit.annualPowerPump ?? 0.0) * efElectricity;
  }

  static double calculateApplianceCarbonFootprint(Audit audit) {
    try {
      final appliances = jsonDecode(audit.appliances);
      final lightSources = (appliances['lightSources'] as List)
          .map((e) => ApplianceModel.fromJson(e))
          .toList();
      final fanList = (appliances['fanList'] as List)
          .map((e) => ApplianceModel.fromJson(e))
          .toList();
      final otherAppliances = (appliances['otherAppliances'] as List)
          .map((e) => ApplianceModel.fromJson(e))
          .toList();

      double totalWattage = 0;

      for (var appliance in [...lightSources, ...fanList, ...otherAppliances]) {
        final watts = double.tryParse(appliance.watts) ?? 0;
        final hours = double.tryParse(appliance.hours) ?? 0;
        final count = int.tryParse(appliance.count) ?? 1;
        totalWattage += watts * hours * count;
      }

      final dailyConsumption = totalWattage / 1000; // kWh per day
      final annualConsumption = dailyConsumption * 365;
      return annualConsumption * efElectricity;
    } catch (e) {
      return 0.0;
    }
  }

  static double calculateHeavyApplianceCarbonFootprint(Audit audit) {
    try {
      final heavyAppliancesRaw = jsonDecode(audit.heavyAppliances);
      List<HeavyApplianceModel> otherHeavyAppliances = [];
      List<HeavyApplianceModel> fridgeList = [];

      if (heavyAppliancesRaw is Map) {
        fridgeList.addAll(
          (heavyAppliancesRaw['fridgeList'] as List)
              .map((e) => HeavyApplianceModel.fromJson(e))
              .toList(),
        );
        otherHeavyAppliances.addAll(
          (heavyAppliancesRaw['acList'] as List)
              .map((e) => HeavyApplianceModel.fromJson(e))
              .toList(),
        );
      } else if (heavyAppliancesRaw is List) {
        // Handle old format - treat all as 'other' and don't assume 24 hours
        otherHeavyAppliances = heavyAppliancesRaw
            .map((e) => HeavyApplianceModel.fromJson(e))
            .toList();
      }

      double totalConsumption = 0;

      // Calculate for refrigerators (always 24 hours)
      for (var appliance in fridgeList) {
        final wattage = double.tryParse(appliance.wattage) ?? 0;
        final hours = 24.0; // Refrigerators run all day

        if (wattage > 0) {
          totalConsumption += (wattage * hours); // Watt-hours per day
        }
      }

      // Calculate for other heavy appliances (use specified hours)
      for (var appliance in otherHeavyAppliances) {
        double wattage = double.tryParse(appliance.wattage) ?? 0;
        final hours = double.tryParse(appliance.hoursUsed) ?? 0;

        if (wattage <= 0) {
          // If wattage is not available, estimate it from star rating and tonnage
          final tonnage = double.tryParse(appliance.capacity) ?? 0;
          final starRating = int.tryParse(appliance.starRating) ?? 3;
          final iseer = _getIseerForStarRating(starRating);

          if (tonnage > 0 && iseer > 0) {
            final coolingPowerWatts = tonnage * 3517;
            wattage = coolingPowerWatts / iseer;
          }
        }

        totalConsumption += (wattage * hours);
      }

      final annualConsumption = (totalConsumption * 365) / 1000; // kWh
      return annualConsumption * efElectricity;
    } catch (e) {
      return 0.0;
    }
  }

  static double _getIseerForStarRating(int starRating) {
    switch (starRating) {
      case 1:
        return 3.3;
      case 2:
        return 3.5;
      case 3:
        return 3.8;
      case 4:
        return 4.4;
      case 5:
        return 5.0;
      default:
        return 3.8; // Default to 3-star
    }
  }

  static double calculateVehicleCarbonFootprint(Audit audit) {
    try {
      final vehicles = (jsonDecode(audit.vehicles) as List)
          .map((e) => VehicleModel.fromJson(e))
          .toList();
      double totalFootprint = 0;

      for (var vehicle in vehicles) {
        final mileage = double.tryParse(vehicle.mileage) ?? 1;
        final distance = double.tryParse(vehicle.kmUsage) ?? 0;
        final fuelConsumed = distance / mileage; // Litres per month
        final annualFuelConsumed = fuelConsumed * 12;

        if (vehicle.fuelType.toLowerCase() == 'petrol') {
          totalFootprint += annualFuelConsumed * efPetrol;
        } else if (vehicle.fuelType.toLowerCase() == 'diesel') {
          totalFootprint += annualFuelConsumed * efDiesel;
        }
      }
      return totalFootprint;
    } catch (e) {
      return 0.0;
    }
  }

  static double calculateGasAndOtherFuelsCarbonFootprint(Audit audit) {
    double totalFootprint = 0;
    // LPG: assuming 'lpg' field is kg per month
    final lpgUsage = double.tryParse(audit.lpg ?? '0') ?? 0;
    totalFootprint += lpgUsage * 12 * efLpg;

    // Firewood: assuming 'firewood' field is kg per month
    final firewoodUsage = double.tryParse(audit.firewood ?? '0') ?? 0;
    totalFootprint += firewoodUsage * 12 * efFirewood;

    return totalFootprint;
  }
}
