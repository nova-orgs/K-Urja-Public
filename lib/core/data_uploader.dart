import 'dart:convert';
import 'dart:developer'; // Kept for explicit 'log' usage

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:k_urja/data/local/database.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DataUploader {
  final MyDatabase _database;
  final SupabaseClient _supabase;

  DataUploader(this._database, this._supabase);

  Future<void> uploadPendingAudits() async {
    final connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.none)) {
      log('No internet connection. Audits will be uploaded later.');
      return;
    }

    final pendingAudits = await _database.getPendingAudits();
    if (pendingAudits.isEmpty) {
      return;
    }

    final auditIds = pendingAudits.map((audit) => audit.audit.id).toList();
    await _database.markAuditsAsUploading(auditIds);

    for (final fullAudit in pendingAudits) {
      final localAudit = fullAudit.audit;
      final localReport = fullAudit.report;

      if (localAudit.userId == null) {
        log(
          'Skipping audit with local ID ${localAudit.id} because it has no user ID.',
        );
        continue;
      }

      try {
        final reportData = {
          'id': localReport.id,
          'user_id': localReport.userId,
          'total_carbon_footprint': localReport.totalCarbonFootprint,
          'electricity_consumption': localReport.electricityConsumption,
          'vehicle_usage': localReport.vehicleUsage,
          'gas_and_other_fuels': localReport.gasAndOtherFuels,
          'waste_and_recycling': localReport.wasteAndRecycling,
          'appliance_carbon_footprint': localReport.applianceCarbonFootprint,
          'heavy_appliance_carbon_footprint':
              localReport.heavyApplianceCarbonFootprint,
          'vehicle_carbon_footprint': localReport.vehicleCarbonFootprint,
          'energy_saving_suggestions': localReport.energySavingSuggestions,
          'energy_efficiency_improvements':
              localReport.energyEfficiencyImprovements,
          'renewable_energy_opportunities':
              localReport.renewableEnergyOpportunities,
          'estimated_annual_savings': localReport.estimatedAnnualSavings,
          'potential_investment_cost': localReport.potentialInvestmentCost,
          'payback_period': localReport.paybackPeriod,
          'created_at': localReport.createdAt.toIso8601String(),
        };

        final surveyData = {
          'owner_name': localAudit.ownerName,
          'house_name': localAudit.houseName,
          'mobile_number': localAudit.mobileNumber,
          'consumer_no': localAudit.consumerNo,
          'section': localAudit.section,
          'post_office': localAudit.ksebPostOffice,
          'pin_code': localAudit.pinCode,
          'panchayath': localAudit.panchayath,
          'bi_monthly_consumption': localAudit.biMonthlyConsumption,
          'bi_monthly_bill': localAudit.biMonthlyBill,
          'member_count': localAudit.memberCount,
          'days_uninhabited': localAudit.daysUninhabited,
          'has_solar_plant': localAudit.hasSolarPlant,
          'solar_capacity': localAudit.solarCapacity,
          'tariff_category': localAudit.tariffCategory,
          'connected_load': localAudit.connectedLoad,
          'nature_of_connection': localAudit.natureOfConnection,
          'house_building_type': localAudit.houseBuildingType,
          'own_or_rental': localAudit.ownOrRental,
          'no_of_floors': localAudit.noOfFloors,
          'total_building_area': localAudit.totalBuildingArea,
          'type_of_earthing': localAudit.typeOfEarthing,
          'control_systems': localAudit.controlSystems,
          'no_of_mcbs': localAudit.noOfMcbs,
          'type_of_energy_meter': localAudit.typeOfEnergyMeter,
          'solar_plant_type': localAudit.solarPlantType,
          'firewood': localAudit.firewood,
          'lpg': localAudit.lpg,
          'biogas': localAudit.biogas,
          'induction': localAudit.induction,
          'other_fuel': localAudit.otherFuel,
          'tank_capacity': localAudit.tankCapacity,
          'pump_capacity': localAudit.pumpCapacity,
          'filling_time': localAudit.fillingTime,
          'pump_count': localAudit.pumpCount,
          'water_source': localAudit.waterSource,
          'water_usage': localAudit.waterUsage,
          'water_bill': localAudit.waterBill,
          'daily_power_pump': localAudit.dailyPowerPump,
          'annual_power_pump': localAudit.annualPowerPump,
          'appliances': jsonDecode(localAudit.appliances),
          'heavy_appliances': jsonDecode(localAudit.heavyAppliances),
          'vehicles': jsonDecode(localAudit.vehicles),
          'completion_time': localAudit.completionTime?.toIso8601String(),
          'user_id': localAudit.userId,
        };

        final response = await _supabase
            .rpc(
              'upload_audit_transaction',
              params: {'report_data': reportData, 'survey_data': surveyData},
            )
            .select('survey_id')
            .single();

        final uploadedSupabaseId = response['survey_id'];

        if (uploadedSupabaseId != null) {
          await _database.markAuditAsUploaded(
            localAudit.id,
            uploadedSupabaseId,
          );
          log(
            'Audit with local ID ${localAudit.id} uploaded successfully with Supabase survey ID $uploadedSupabaseId',
          );
        } else {
          log(
            'Failed to get uploaded ID for survey with local ID ${localAudit.id}',
          );
          await _database.resetUploadingStatus([localAudit.id]);
        }
      } catch (e) {
        log('Error uploading audit with local ID ${localAudit.id}: $e');
        await _database.resetUploadingStatus([localAudit.id]);
      }
    }
  }
}
