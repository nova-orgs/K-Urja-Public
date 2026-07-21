// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $AuditReportsTable extends AuditReports
    with drift.TableInfo<$AuditReportsTable, AuditReport> {
  @override
  final drift.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AuditReportsTable(this.attachedDatabase, [this._alias]);
  static const drift.VerificationMeta _idMeta = const drift.VerificationMeta(
    'id',
  );
  @override
  late final drift.GeneratedColumn<String> id = drift.GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const drift.VerificationMeta _userIdMeta =
      const drift.VerificationMeta('userId');
  @override
  late final drift.GeneratedColumn<String> userId =
      drift.GeneratedColumn<String>(
        'user_id',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const drift.VerificationMeta _totalCarbonFootprintMeta =
      const drift.VerificationMeta('totalCarbonFootprint');
  @override
  late final drift.GeneratedColumn<double> totalCarbonFootprint =
      drift.GeneratedColumn<double>(
        'total_carbon_footprint',
        aliasedName,
        true,
        type: DriftSqlType.double,
        requiredDuringInsert: false,
      );
  static const drift.VerificationMeta _electricityConsumptionMeta =
      const drift.VerificationMeta('electricityConsumption');
  @override
  late final drift.GeneratedColumn<double> electricityConsumption =
      drift.GeneratedColumn<double>(
        'electricity_consumption',
        aliasedName,
        true,
        type: DriftSqlType.double,
        requiredDuringInsert: false,
      );
  static const drift.VerificationMeta _vehicleUsageMeta =
      const drift.VerificationMeta('vehicleUsage');
  @override
  late final drift.GeneratedColumn<double> vehicleUsage =
      drift.GeneratedColumn<double>(
        'vehicle_usage',
        aliasedName,
        true,
        type: DriftSqlType.double,
        requiredDuringInsert: false,
      );
  static const drift.VerificationMeta _gasAndOtherFuelsMeta =
      const drift.VerificationMeta('gasAndOtherFuels');
  @override
  late final drift.GeneratedColumn<double> gasAndOtherFuels =
      drift.GeneratedColumn<double>(
        'gas_and_other_fuels',
        aliasedName,
        true,
        type: DriftSqlType.double,
        requiredDuringInsert: false,
      );
  static const drift.VerificationMeta _wasteAndRecyclingMeta =
      const drift.VerificationMeta('wasteAndRecycling');
  @override
  late final drift.GeneratedColumn<double> wasteAndRecycling =
      drift.GeneratedColumn<double>(
        'waste_and_recycling',
        aliasedName,
        true,
        type: DriftSqlType.double,
        requiredDuringInsert: false,
      );
  static const drift.VerificationMeta _applianceCarbonFootprintMeta =
      const drift.VerificationMeta('applianceCarbonFootprint');
  @override
  late final drift.GeneratedColumn<double> applianceCarbonFootprint =
      drift.GeneratedColumn<double>(
        'appliance_carbon_footprint',
        aliasedName,
        true,
        type: DriftSqlType.double,
        requiredDuringInsert: false,
      );
  static const drift.VerificationMeta _heavyApplianceCarbonFootprintMeta =
      const drift.VerificationMeta('heavyApplianceCarbonFootprint');
  @override
  late final drift.GeneratedColumn<double> heavyApplianceCarbonFootprint =
      drift.GeneratedColumn<double>(
        'heavy_appliance_carbon_footprint',
        aliasedName,
        true,
        type: DriftSqlType.double,
        requiredDuringInsert: false,
      );
  static const drift.VerificationMeta _vehicleCarbonFootprintMeta =
      const drift.VerificationMeta('vehicleCarbonFootprint');
  @override
  late final drift.GeneratedColumn<double> vehicleCarbonFootprint =
      drift.GeneratedColumn<double>(
        'vehicle_carbon_footprint',
        aliasedName,
        true,
        type: DriftSqlType.double,
        requiredDuringInsert: false,
      );
  static const drift.VerificationMeta _energySavingSuggestionsMeta =
      const drift.VerificationMeta('energySavingSuggestions');
  @override
  late final drift.GeneratedColumn<String> energySavingSuggestions =
      drift.GeneratedColumn<String>(
        'energy_saving_suggestions',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const drift.VerificationMeta _energyEfficiencyImprovementsMeta =
      const drift.VerificationMeta('energyEfficiencyImprovements');
  @override
  late final drift.GeneratedColumn<String> energyEfficiencyImprovements =
      drift.GeneratedColumn<String>(
        'energy_efficiency_improvements',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const drift.VerificationMeta _renewableEnergyOpportunitiesMeta =
      const drift.VerificationMeta('renewableEnergyOpportunities');
  @override
  late final drift.GeneratedColumn<String> renewableEnergyOpportunities =
      drift.GeneratedColumn<String>(
        'renewable_energy_opportunities',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const drift.VerificationMeta _estimatedAnnualSavingsMeta =
      const drift.VerificationMeta('estimatedAnnualSavings');
  @override
  late final drift.GeneratedColumn<String> estimatedAnnualSavings =
      drift.GeneratedColumn<String>(
        'estimated_annual_savings',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const drift.VerificationMeta _potentialInvestmentCostMeta =
      const drift.VerificationMeta('potentialInvestmentCost');
  @override
  late final drift.GeneratedColumn<String> potentialInvestmentCost =
      drift.GeneratedColumn<String>(
        'potential_investment_cost',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const drift.VerificationMeta _paybackPeriodMeta =
      const drift.VerificationMeta('paybackPeriod');
  @override
  late final drift.GeneratedColumn<String> paybackPeriod =
      drift.GeneratedColumn<String>(
        'payback_period',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const drift.VerificationMeta _createdAtMeta =
      const drift.VerificationMeta('createdAt');
  @override
  late final drift.GeneratedColumn<DateTime> createdAt =
      drift.GeneratedColumn<DateTime>(
        'created_at',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  @override
  List<drift.GeneratedColumn> get $columns => [
    id,
    userId,
    totalCarbonFootprint,
    electricityConsumption,
    vehicleUsage,
    gasAndOtherFuels,
    wasteAndRecycling,
    applianceCarbonFootprint,
    heavyApplianceCarbonFootprint,
    vehicleCarbonFootprint,
    energySavingSuggestions,
    energyEfficiencyImprovements,
    renewableEnergyOpportunities,
    estimatedAnnualSavings,
    potentialInvestmentCost,
    paybackPeriod,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'audit_reports';
  @override
  drift.VerificationContext validateIntegrity(
    drift.Insertable<AuditReport> instance, {
    bool isInserting = false,
  }) {
    final context = drift.VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('total_carbon_footprint')) {
      context.handle(
        _totalCarbonFootprintMeta,
        totalCarbonFootprint.isAcceptableOrUnknown(
          data['total_carbon_footprint']!,
          _totalCarbonFootprintMeta,
        ),
      );
    }
    if (data.containsKey('electricity_consumption')) {
      context.handle(
        _electricityConsumptionMeta,
        electricityConsumption.isAcceptableOrUnknown(
          data['electricity_consumption']!,
          _electricityConsumptionMeta,
        ),
      );
    }
    if (data.containsKey('vehicle_usage')) {
      context.handle(
        _vehicleUsageMeta,
        vehicleUsage.isAcceptableOrUnknown(
          data['vehicle_usage']!,
          _vehicleUsageMeta,
        ),
      );
    }
    if (data.containsKey('gas_and_other_fuels')) {
      context.handle(
        _gasAndOtherFuelsMeta,
        gasAndOtherFuels.isAcceptableOrUnknown(
          data['gas_and_other_fuels']!,
          _gasAndOtherFuelsMeta,
        ),
      );
    }
    if (data.containsKey('waste_and_recycling')) {
      context.handle(
        _wasteAndRecyclingMeta,
        wasteAndRecycling.isAcceptableOrUnknown(
          data['waste_and_recycling']!,
          _wasteAndRecyclingMeta,
        ),
      );
    }
    if (data.containsKey('appliance_carbon_footprint')) {
      context.handle(
        _applianceCarbonFootprintMeta,
        applianceCarbonFootprint.isAcceptableOrUnknown(
          data['appliance_carbon_footprint']!,
          _applianceCarbonFootprintMeta,
        ),
      );
    }
    if (data.containsKey('heavy_appliance_carbon_footprint')) {
      context.handle(
        _heavyApplianceCarbonFootprintMeta,
        heavyApplianceCarbonFootprint.isAcceptableOrUnknown(
          data['heavy_appliance_carbon_footprint']!,
          _heavyApplianceCarbonFootprintMeta,
        ),
      );
    }
    if (data.containsKey('vehicle_carbon_footprint')) {
      context.handle(
        _vehicleCarbonFootprintMeta,
        vehicleCarbonFootprint.isAcceptableOrUnknown(
          data['vehicle_carbon_footprint']!,
          _vehicleCarbonFootprintMeta,
        ),
      );
    }
    if (data.containsKey('energy_saving_suggestions')) {
      context.handle(
        _energySavingSuggestionsMeta,
        energySavingSuggestions.isAcceptableOrUnknown(
          data['energy_saving_suggestions']!,
          _energySavingSuggestionsMeta,
        ),
      );
    }
    if (data.containsKey('energy_efficiency_improvements')) {
      context.handle(
        _energyEfficiencyImprovementsMeta,
        energyEfficiencyImprovements.isAcceptableOrUnknown(
          data['energy_efficiency_improvements']!,
          _energyEfficiencyImprovementsMeta,
        ),
      );
    }
    if (data.containsKey('renewable_energy_opportunities')) {
      context.handle(
        _renewableEnergyOpportunitiesMeta,
        renewableEnergyOpportunities.isAcceptableOrUnknown(
          data['renewable_energy_opportunities']!,
          _renewableEnergyOpportunitiesMeta,
        ),
      );
    }
    if (data.containsKey('estimated_annual_savings')) {
      context.handle(
        _estimatedAnnualSavingsMeta,
        estimatedAnnualSavings.isAcceptableOrUnknown(
          data['estimated_annual_savings']!,
          _estimatedAnnualSavingsMeta,
        ),
      );
    }
    if (data.containsKey('potential_investment_cost')) {
      context.handle(
        _potentialInvestmentCostMeta,
        potentialInvestmentCost.isAcceptableOrUnknown(
          data['potential_investment_cost']!,
          _potentialInvestmentCostMeta,
        ),
      );
    }
    if (data.containsKey('payback_period')) {
      context.handle(
        _paybackPeriodMeta,
        paybackPeriod.isAcceptableOrUnknown(
          data['payback_period']!,
          _paybackPeriodMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<drift.GeneratedColumn> get $primaryKey => {id};
  @override
  AuditReport map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AuditReport(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      totalCarbonFootprint: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}total_carbon_footprint'],
      ),
      electricityConsumption: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}electricity_consumption'],
      ),
      vehicleUsage: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}vehicle_usage'],
      ),
      gasAndOtherFuels: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}gas_and_other_fuels'],
      ),
      wasteAndRecycling: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}waste_and_recycling'],
      ),
      applianceCarbonFootprint: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}appliance_carbon_footprint'],
      ),
      heavyApplianceCarbonFootprint: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}heavy_appliance_carbon_footprint'],
      ),
      vehicleCarbonFootprint: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}vehicle_carbon_footprint'],
      ),
      energySavingSuggestions: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}energy_saving_suggestions'],
      ),
      energyEfficiencyImprovements: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}energy_efficiency_improvements'],
      ),
      renewableEnergyOpportunities: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}renewable_energy_opportunities'],
      ),
      estimatedAnnualSavings: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}estimated_annual_savings'],
      ),
      potentialInvestmentCost: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}potential_investment_cost'],
      ),
      paybackPeriod: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payback_period'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $AuditReportsTable createAlias(String alias) {
    return $AuditReportsTable(attachedDatabase, alias);
  }
}

class AuditReport extends drift.DataClass
    implements drift.Insertable<AuditReport> {
  final String id;
  final String userId;
  final double? totalCarbonFootprint;
  final double? electricityConsumption;
  final double? vehicleUsage;
  final double? gasAndOtherFuels;
  final double? wasteAndRecycling;
  final double? applianceCarbonFootprint;
  final double? heavyApplianceCarbonFootprint;
  final double? vehicleCarbonFootprint;
  final String? energySavingSuggestions;
  final String? energyEfficiencyImprovements;
  final String? renewableEnergyOpportunities;
  final String? estimatedAnnualSavings;
  final String? potentialInvestmentCost;
  final String? paybackPeriod;
  final DateTime createdAt;
  const AuditReport({
    required this.id,
    required this.userId,
    this.totalCarbonFootprint,
    this.electricityConsumption,
    this.vehicleUsage,
    this.gasAndOtherFuels,
    this.wasteAndRecycling,
    this.applianceCarbonFootprint,
    this.heavyApplianceCarbonFootprint,
    this.vehicleCarbonFootprint,
    this.energySavingSuggestions,
    this.energyEfficiencyImprovements,
    this.renewableEnergyOpportunities,
    this.estimatedAnnualSavings,
    this.potentialInvestmentCost,
    this.paybackPeriod,
    required this.createdAt,
  });
  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    map['id'] = drift.Variable<String>(id);
    map['user_id'] = drift.Variable<String>(userId);
    if (!nullToAbsent || totalCarbonFootprint != null) {
      map['total_carbon_footprint'] = drift.Variable<double>(
        totalCarbonFootprint,
      );
    }
    if (!nullToAbsent || electricityConsumption != null) {
      map['electricity_consumption'] = drift.Variable<double>(
        electricityConsumption,
      );
    }
    if (!nullToAbsent || vehicleUsage != null) {
      map['vehicle_usage'] = drift.Variable<double>(vehicleUsage);
    }
    if (!nullToAbsent || gasAndOtherFuels != null) {
      map['gas_and_other_fuels'] = drift.Variable<double>(gasAndOtherFuels);
    }
    if (!nullToAbsent || wasteAndRecycling != null) {
      map['waste_and_recycling'] = drift.Variable<double>(wasteAndRecycling);
    }
    if (!nullToAbsent || applianceCarbonFootprint != null) {
      map['appliance_carbon_footprint'] = drift.Variable<double>(
        applianceCarbonFootprint,
      );
    }
    if (!nullToAbsent || heavyApplianceCarbonFootprint != null) {
      map['heavy_appliance_carbon_footprint'] = drift.Variable<double>(
        heavyApplianceCarbonFootprint,
      );
    }
    if (!nullToAbsent || vehicleCarbonFootprint != null) {
      map['vehicle_carbon_footprint'] = drift.Variable<double>(
        vehicleCarbonFootprint,
      );
    }
    if (!nullToAbsent || energySavingSuggestions != null) {
      map['energy_saving_suggestions'] = drift.Variable<String>(
        energySavingSuggestions,
      );
    }
    if (!nullToAbsent || energyEfficiencyImprovements != null) {
      map['energy_efficiency_improvements'] = drift.Variable<String>(
        energyEfficiencyImprovements,
      );
    }
    if (!nullToAbsent || renewableEnergyOpportunities != null) {
      map['renewable_energy_opportunities'] = drift.Variable<String>(
        renewableEnergyOpportunities,
      );
    }
    if (!nullToAbsent || estimatedAnnualSavings != null) {
      map['estimated_annual_savings'] = drift.Variable<String>(
        estimatedAnnualSavings,
      );
    }
    if (!nullToAbsent || potentialInvestmentCost != null) {
      map['potential_investment_cost'] = drift.Variable<String>(
        potentialInvestmentCost,
      );
    }
    if (!nullToAbsent || paybackPeriod != null) {
      map['payback_period'] = drift.Variable<String>(paybackPeriod);
    }
    map['created_at'] = drift.Variable<DateTime>(createdAt);
    return map;
  }

  AuditReportsCompanion toCompanion(bool nullToAbsent) {
    return AuditReportsCompanion(
      id: drift.Value(id),
      userId: drift.Value(userId),
      totalCarbonFootprint: totalCarbonFootprint == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(totalCarbonFootprint),
      electricityConsumption: electricityConsumption == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(electricityConsumption),
      vehicleUsage: vehicleUsage == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(vehicleUsage),
      gasAndOtherFuels: gasAndOtherFuels == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(gasAndOtherFuels),
      wasteAndRecycling: wasteAndRecycling == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(wasteAndRecycling),
      applianceCarbonFootprint: applianceCarbonFootprint == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(applianceCarbonFootprint),
      heavyApplianceCarbonFootprint:
          heavyApplianceCarbonFootprint == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(heavyApplianceCarbonFootprint),
      vehicleCarbonFootprint: vehicleCarbonFootprint == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(vehicleCarbonFootprint),
      energySavingSuggestions: energySavingSuggestions == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(energySavingSuggestions),
      energyEfficiencyImprovements:
          energyEfficiencyImprovements == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(energyEfficiencyImprovements),
      renewableEnergyOpportunities:
          renewableEnergyOpportunities == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(renewableEnergyOpportunities),
      estimatedAnnualSavings: estimatedAnnualSavings == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(estimatedAnnualSavings),
      potentialInvestmentCost: potentialInvestmentCost == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(potentialInvestmentCost),
      paybackPeriod: paybackPeriod == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(paybackPeriod),
      createdAt: drift.Value(createdAt),
    );
  }

  factory AuditReport.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return AuditReport(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      totalCarbonFootprint: serializer.fromJson<double?>(
        json['totalCarbonFootprint'],
      ),
      electricityConsumption: serializer.fromJson<double?>(
        json['electricityConsumption'],
      ),
      vehicleUsage: serializer.fromJson<double?>(json['vehicleUsage']),
      gasAndOtherFuels: serializer.fromJson<double?>(json['gasAndOtherFuels']),
      wasteAndRecycling: serializer.fromJson<double?>(
        json['wasteAndRecycling'],
      ),
      applianceCarbonFootprint: serializer.fromJson<double?>(
        json['applianceCarbonFootprint'],
      ),
      heavyApplianceCarbonFootprint: serializer.fromJson<double?>(
        json['heavyApplianceCarbonFootprint'],
      ),
      vehicleCarbonFootprint: serializer.fromJson<double?>(
        json['vehicleCarbonFootprint'],
      ),
      energySavingSuggestions: serializer.fromJson<String?>(
        json['energySavingSuggestions'],
      ),
      energyEfficiencyImprovements: serializer.fromJson<String?>(
        json['energyEfficiencyImprovements'],
      ),
      renewableEnergyOpportunities: serializer.fromJson<String?>(
        json['renewableEnergyOpportunities'],
      ),
      estimatedAnnualSavings: serializer.fromJson<String?>(
        json['estimatedAnnualSavings'],
      ),
      potentialInvestmentCost: serializer.fromJson<String?>(
        json['potentialInvestmentCost'],
      ),
      paybackPeriod: serializer.fromJson<String?>(json['paybackPeriod']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'totalCarbonFootprint': serializer.toJson<double?>(totalCarbonFootprint),
      'electricityConsumption': serializer.toJson<double?>(
        electricityConsumption,
      ),
      'vehicleUsage': serializer.toJson<double?>(vehicleUsage),
      'gasAndOtherFuels': serializer.toJson<double?>(gasAndOtherFuels),
      'wasteAndRecycling': serializer.toJson<double?>(wasteAndRecycling),
      'applianceCarbonFootprint': serializer.toJson<double?>(
        applianceCarbonFootprint,
      ),
      'heavyApplianceCarbonFootprint': serializer.toJson<double?>(
        heavyApplianceCarbonFootprint,
      ),
      'vehicleCarbonFootprint': serializer.toJson<double?>(
        vehicleCarbonFootprint,
      ),
      'energySavingSuggestions': serializer.toJson<String?>(
        energySavingSuggestions,
      ),
      'energyEfficiencyImprovements': serializer.toJson<String?>(
        energyEfficiencyImprovements,
      ),
      'renewableEnergyOpportunities': serializer.toJson<String?>(
        renewableEnergyOpportunities,
      ),
      'estimatedAnnualSavings': serializer.toJson<String?>(
        estimatedAnnualSavings,
      ),
      'potentialInvestmentCost': serializer.toJson<String?>(
        potentialInvestmentCost,
      ),
      'paybackPeriod': serializer.toJson<String?>(paybackPeriod),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  AuditReport copyWith({
    String? id,
    String? userId,
    drift.Value<double?> totalCarbonFootprint = const drift.Value.absent(),
    drift.Value<double?> electricityConsumption = const drift.Value.absent(),
    drift.Value<double?> vehicleUsage = const drift.Value.absent(),
    drift.Value<double?> gasAndOtherFuels = const drift.Value.absent(),
    drift.Value<double?> wasteAndRecycling = const drift.Value.absent(),
    drift.Value<double?> applianceCarbonFootprint = const drift.Value.absent(),
    drift.Value<double?> heavyApplianceCarbonFootprint =
        const drift.Value.absent(),
    drift.Value<double?> vehicleCarbonFootprint = const drift.Value.absent(),
    drift.Value<String?> energySavingSuggestions = const drift.Value.absent(),
    drift.Value<String?> energyEfficiencyImprovements =
        const drift.Value.absent(),
    drift.Value<String?> renewableEnergyOpportunities =
        const drift.Value.absent(),
    drift.Value<String?> estimatedAnnualSavings = const drift.Value.absent(),
    drift.Value<String?> potentialInvestmentCost = const drift.Value.absent(),
    drift.Value<String?> paybackPeriod = const drift.Value.absent(),
    DateTime? createdAt,
  }) => AuditReport(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    totalCarbonFootprint: totalCarbonFootprint.present
        ? totalCarbonFootprint.value
        : this.totalCarbonFootprint,
    electricityConsumption: electricityConsumption.present
        ? electricityConsumption.value
        : this.electricityConsumption,
    vehicleUsage: vehicleUsage.present ? vehicleUsage.value : this.vehicleUsage,
    gasAndOtherFuels: gasAndOtherFuels.present
        ? gasAndOtherFuels.value
        : this.gasAndOtherFuels,
    wasteAndRecycling: wasteAndRecycling.present
        ? wasteAndRecycling.value
        : this.wasteAndRecycling,
    applianceCarbonFootprint: applianceCarbonFootprint.present
        ? applianceCarbonFootprint.value
        : this.applianceCarbonFootprint,
    heavyApplianceCarbonFootprint: heavyApplianceCarbonFootprint.present
        ? heavyApplianceCarbonFootprint.value
        : this.heavyApplianceCarbonFootprint,
    vehicleCarbonFootprint: vehicleCarbonFootprint.present
        ? vehicleCarbonFootprint.value
        : this.vehicleCarbonFootprint,
    energySavingSuggestions: energySavingSuggestions.present
        ? energySavingSuggestions.value
        : this.energySavingSuggestions,
    energyEfficiencyImprovements: energyEfficiencyImprovements.present
        ? energyEfficiencyImprovements.value
        : this.energyEfficiencyImprovements,
    renewableEnergyOpportunities: renewableEnergyOpportunities.present
        ? renewableEnergyOpportunities.value
        : this.renewableEnergyOpportunities,
    estimatedAnnualSavings: estimatedAnnualSavings.present
        ? estimatedAnnualSavings.value
        : this.estimatedAnnualSavings,
    potentialInvestmentCost: potentialInvestmentCost.present
        ? potentialInvestmentCost.value
        : this.potentialInvestmentCost,
    paybackPeriod: paybackPeriod.present
        ? paybackPeriod.value
        : this.paybackPeriod,
    createdAt: createdAt ?? this.createdAt,
  );
  AuditReport copyWithCompanion(AuditReportsCompanion data) {
    return AuditReport(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      totalCarbonFootprint: data.totalCarbonFootprint.present
          ? data.totalCarbonFootprint.value
          : this.totalCarbonFootprint,
      electricityConsumption: data.electricityConsumption.present
          ? data.electricityConsumption.value
          : this.electricityConsumption,
      vehicleUsage: data.vehicleUsage.present
          ? data.vehicleUsage.value
          : this.vehicleUsage,
      gasAndOtherFuels: data.gasAndOtherFuels.present
          ? data.gasAndOtherFuels.value
          : this.gasAndOtherFuels,
      wasteAndRecycling: data.wasteAndRecycling.present
          ? data.wasteAndRecycling.value
          : this.wasteAndRecycling,
      applianceCarbonFootprint: data.applianceCarbonFootprint.present
          ? data.applianceCarbonFootprint.value
          : this.applianceCarbonFootprint,
      heavyApplianceCarbonFootprint: data.heavyApplianceCarbonFootprint.present
          ? data.heavyApplianceCarbonFootprint.value
          : this.heavyApplianceCarbonFootprint,
      vehicleCarbonFootprint: data.vehicleCarbonFootprint.present
          ? data.vehicleCarbonFootprint.value
          : this.vehicleCarbonFootprint,
      energySavingSuggestions: data.energySavingSuggestions.present
          ? data.energySavingSuggestions.value
          : this.energySavingSuggestions,
      energyEfficiencyImprovements: data.energyEfficiencyImprovements.present
          ? data.energyEfficiencyImprovements.value
          : this.energyEfficiencyImprovements,
      renewableEnergyOpportunities: data.renewableEnergyOpportunities.present
          ? data.renewableEnergyOpportunities.value
          : this.renewableEnergyOpportunities,
      estimatedAnnualSavings: data.estimatedAnnualSavings.present
          ? data.estimatedAnnualSavings.value
          : this.estimatedAnnualSavings,
      potentialInvestmentCost: data.potentialInvestmentCost.present
          ? data.potentialInvestmentCost.value
          : this.potentialInvestmentCost,
      paybackPeriod: data.paybackPeriod.present
          ? data.paybackPeriod.value
          : this.paybackPeriod,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AuditReport(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('totalCarbonFootprint: $totalCarbonFootprint, ')
          ..write('electricityConsumption: $electricityConsumption, ')
          ..write('vehicleUsage: $vehicleUsage, ')
          ..write('gasAndOtherFuels: $gasAndOtherFuels, ')
          ..write('wasteAndRecycling: $wasteAndRecycling, ')
          ..write('applianceCarbonFootprint: $applianceCarbonFootprint, ')
          ..write(
            'heavyApplianceCarbonFootprint: $heavyApplianceCarbonFootprint, ',
          )
          ..write('vehicleCarbonFootprint: $vehicleCarbonFootprint, ')
          ..write('energySavingSuggestions: $energySavingSuggestions, ')
          ..write(
            'energyEfficiencyImprovements: $energyEfficiencyImprovements, ',
          )
          ..write(
            'renewableEnergyOpportunities: $renewableEnergyOpportunities, ',
          )
          ..write('estimatedAnnualSavings: $estimatedAnnualSavings, ')
          ..write('potentialInvestmentCost: $potentialInvestmentCost, ')
          ..write('paybackPeriod: $paybackPeriod, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    totalCarbonFootprint,
    electricityConsumption,
    vehicleUsage,
    gasAndOtherFuels,
    wasteAndRecycling,
    applianceCarbonFootprint,
    heavyApplianceCarbonFootprint,
    vehicleCarbonFootprint,
    energySavingSuggestions,
    energyEfficiencyImprovements,
    renewableEnergyOpportunities,
    estimatedAnnualSavings,
    potentialInvestmentCost,
    paybackPeriod,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AuditReport &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.totalCarbonFootprint == this.totalCarbonFootprint &&
          other.electricityConsumption == this.electricityConsumption &&
          other.vehicleUsage == this.vehicleUsage &&
          other.gasAndOtherFuels == this.gasAndOtherFuels &&
          other.wasteAndRecycling == this.wasteAndRecycling &&
          other.applianceCarbonFootprint == this.applianceCarbonFootprint &&
          other.heavyApplianceCarbonFootprint ==
              this.heavyApplianceCarbonFootprint &&
          other.vehicleCarbonFootprint == this.vehicleCarbonFootprint &&
          other.energySavingSuggestions == this.energySavingSuggestions &&
          other.energyEfficiencyImprovements ==
              this.energyEfficiencyImprovements &&
          other.renewableEnergyOpportunities ==
              this.renewableEnergyOpportunities &&
          other.estimatedAnnualSavings == this.estimatedAnnualSavings &&
          other.potentialInvestmentCost == this.potentialInvestmentCost &&
          other.paybackPeriod == this.paybackPeriod &&
          other.createdAt == this.createdAt);
}

class AuditReportsCompanion extends drift.UpdateCompanion<AuditReport> {
  final drift.Value<String> id;
  final drift.Value<String> userId;
  final drift.Value<double?> totalCarbonFootprint;
  final drift.Value<double?> electricityConsumption;
  final drift.Value<double?> vehicleUsage;
  final drift.Value<double?> gasAndOtherFuels;
  final drift.Value<double?> wasteAndRecycling;
  final drift.Value<double?> applianceCarbonFootprint;
  final drift.Value<double?> heavyApplianceCarbonFootprint;
  final drift.Value<double?> vehicleCarbonFootprint;
  final drift.Value<String?> energySavingSuggestions;
  final drift.Value<String?> energyEfficiencyImprovements;
  final drift.Value<String?> renewableEnergyOpportunities;
  final drift.Value<String?> estimatedAnnualSavings;
  final drift.Value<String?> potentialInvestmentCost;
  final drift.Value<String?> paybackPeriod;
  final drift.Value<DateTime> createdAt;
  final drift.Value<int> rowid;
  const AuditReportsCompanion({
    this.id = const drift.Value.absent(),
    this.userId = const drift.Value.absent(),
    this.totalCarbonFootprint = const drift.Value.absent(),
    this.electricityConsumption = const drift.Value.absent(),
    this.vehicleUsage = const drift.Value.absent(),
    this.gasAndOtherFuels = const drift.Value.absent(),
    this.wasteAndRecycling = const drift.Value.absent(),
    this.applianceCarbonFootprint = const drift.Value.absent(),
    this.heavyApplianceCarbonFootprint = const drift.Value.absent(),
    this.vehicleCarbonFootprint = const drift.Value.absent(),
    this.energySavingSuggestions = const drift.Value.absent(),
    this.energyEfficiencyImprovements = const drift.Value.absent(),
    this.renewableEnergyOpportunities = const drift.Value.absent(),
    this.estimatedAnnualSavings = const drift.Value.absent(),
    this.potentialInvestmentCost = const drift.Value.absent(),
    this.paybackPeriod = const drift.Value.absent(),
    this.createdAt = const drift.Value.absent(),
    this.rowid = const drift.Value.absent(),
  });
  AuditReportsCompanion.insert({
    required String id,
    required String userId,
    this.totalCarbonFootprint = const drift.Value.absent(),
    this.electricityConsumption = const drift.Value.absent(),
    this.vehicleUsage = const drift.Value.absent(),
    this.gasAndOtherFuels = const drift.Value.absent(),
    this.wasteAndRecycling = const drift.Value.absent(),
    this.applianceCarbonFootprint = const drift.Value.absent(),
    this.heavyApplianceCarbonFootprint = const drift.Value.absent(),
    this.vehicleCarbonFootprint = const drift.Value.absent(),
    this.energySavingSuggestions = const drift.Value.absent(),
    this.energyEfficiencyImprovements = const drift.Value.absent(),
    this.renewableEnergyOpportunities = const drift.Value.absent(),
    this.estimatedAnnualSavings = const drift.Value.absent(),
    this.potentialInvestmentCost = const drift.Value.absent(),
    this.paybackPeriod = const drift.Value.absent(),
    required DateTime createdAt,
    this.rowid = const drift.Value.absent(),
  }) : id = drift.Value(id),
       userId = drift.Value(userId),
       createdAt = drift.Value(createdAt);
  static drift.Insertable<AuditReport> custom({
    drift.Expression<String>? id,
    drift.Expression<String>? userId,
    drift.Expression<double>? totalCarbonFootprint,
    drift.Expression<double>? electricityConsumption,
    drift.Expression<double>? vehicleUsage,
    drift.Expression<double>? gasAndOtherFuels,
    drift.Expression<double>? wasteAndRecycling,
    drift.Expression<double>? applianceCarbonFootprint,
    drift.Expression<double>? heavyApplianceCarbonFootprint,
    drift.Expression<double>? vehicleCarbonFootprint,
    drift.Expression<String>? energySavingSuggestions,
    drift.Expression<String>? energyEfficiencyImprovements,
    drift.Expression<String>? renewableEnergyOpportunities,
    drift.Expression<String>? estimatedAnnualSavings,
    drift.Expression<String>? potentialInvestmentCost,
    drift.Expression<String>? paybackPeriod,
    drift.Expression<DateTime>? createdAt,
    drift.Expression<int>? rowid,
  }) {
    return drift.RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (totalCarbonFootprint != null)
        'total_carbon_footprint': totalCarbonFootprint,
      if (electricityConsumption != null)
        'electricity_consumption': electricityConsumption,
      if (vehicleUsage != null) 'vehicle_usage': vehicleUsage,
      if (gasAndOtherFuels != null) 'gas_and_other_fuels': gasAndOtherFuels,
      if (wasteAndRecycling != null) 'waste_and_recycling': wasteAndRecycling,
      if (applianceCarbonFootprint != null)
        'appliance_carbon_footprint': applianceCarbonFootprint,
      if (heavyApplianceCarbonFootprint != null)
        'heavy_appliance_carbon_footprint': heavyApplianceCarbonFootprint,
      if (vehicleCarbonFootprint != null)
        'vehicle_carbon_footprint': vehicleCarbonFootprint,
      if (energySavingSuggestions != null)
        'energy_saving_suggestions': energySavingSuggestions,
      if (energyEfficiencyImprovements != null)
        'energy_efficiency_improvements': energyEfficiencyImprovements,
      if (renewableEnergyOpportunities != null)
        'renewable_energy_opportunities': renewableEnergyOpportunities,
      if (estimatedAnnualSavings != null)
        'estimated_annual_savings': estimatedAnnualSavings,
      if (potentialInvestmentCost != null)
        'potential_investment_cost': potentialInvestmentCost,
      if (paybackPeriod != null) 'payback_period': paybackPeriod,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AuditReportsCompanion copyWith({
    drift.Value<String>? id,
    drift.Value<String>? userId,
    drift.Value<double?>? totalCarbonFootprint,
    drift.Value<double?>? electricityConsumption,
    drift.Value<double?>? vehicleUsage,
    drift.Value<double?>? gasAndOtherFuels,
    drift.Value<double?>? wasteAndRecycling,
    drift.Value<double?>? applianceCarbonFootprint,
    drift.Value<double?>? heavyApplianceCarbonFootprint,
    drift.Value<double?>? vehicleCarbonFootprint,
    drift.Value<String?>? energySavingSuggestions,
    drift.Value<String?>? energyEfficiencyImprovements,
    drift.Value<String?>? renewableEnergyOpportunities,
    drift.Value<String?>? estimatedAnnualSavings,
    drift.Value<String?>? potentialInvestmentCost,
    drift.Value<String?>? paybackPeriod,
    drift.Value<DateTime>? createdAt,
    drift.Value<int>? rowid,
  }) {
    return AuditReportsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      totalCarbonFootprint: totalCarbonFootprint ?? this.totalCarbonFootprint,
      electricityConsumption:
          electricityConsumption ?? this.electricityConsumption,
      vehicleUsage: vehicleUsage ?? this.vehicleUsage,
      gasAndOtherFuels: gasAndOtherFuels ?? this.gasAndOtherFuels,
      wasteAndRecycling: wasteAndRecycling ?? this.wasteAndRecycling,
      applianceCarbonFootprint:
          applianceCarbonFootprint ?? this.applianceCarbonFootprint,
      heavyApplianceCarbonFootprint:
          heavyApplianceCarbonFootprint ?? this.heavyApplianceCarbonFootprint,
      vehicleCarbonFootprint:
          vehicleCarbonFootprint ?? this.vehicleCarbonFootprint,
      energySavingSuggestions:
          energySavingSuggestions ?? this.energySavingSuggestions,
      energyEfficiencyImprovements:
          energyEfficiencyImprovements ?? this.energyEfficiencyImprovements,
      renewableEnergyOpportunities:
          renewableEnergyOpportunities ?? this.renewableEnergyOpportunities,
      estimatedAnnualSavings:
          estimatedAnnualSavings ?? this.estimatedAnnualSavings,
      potentialInvestmentCost:
          potentialInvestmentCost ?? this.potentialInvestmentCost,
      paybackPeriod: paybackPeriod ?? this.paybackPeriod,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    if (id.present) {
      map['id'] = drift.Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = drift.Variable<String>(userId.value);
    }
    if (totalCarbonFootprint.present) {
      map['total_carbon_footprint'] = drift.Variable<double>(
        totalCarbonFootprint.value,
      );
    }
    if (electricityConsumption.present) {
      map['electricity_consumption'] = drift.Variable<double>(
        electricityConsumption.value,
      );
    }
    if (vehicleUsage.present) {
      map['vehicle_usage'] = drift.Variable<double>(vehicleUsage.value);
    }
    if (gasAndOtherFuels.present) {
      map['gas_and_other_fuels'] = drift.Variable<double>(
        gasAndOtherFuels.value,
      );
    }
    if (wasteAndRecycling.present) {
      map['waste_and_recycling'] = drift.Variable<double>(
        wasteAndRecycling.value,
      );
    }
    if (applianceCarbonFootprint.present) {
      map['appliance_carbon_footprint'] = drift.Variable<double>(
        applianceCarbonFootprint.value,
      );
    }
    if (heavyApplianceCarbonFootprint.present) {
      map['heavy_appliance_carbon_footprint'] = drift.Variable<double>(
        heavyApplianceCarbonFootprint.value,
      );
    }
    if (vehicleCarbonFootprint.present) {
      map['vehicle_carbon_footprint'] = drift.Variable<double>(
        vehicleCarbonFootprint.value,
      );
    }
    if (energySavingSuggestions.present) {
      map['energy_saving_suggestions'] = drift.Variable<String>(
        energySavingSuggestions.value,
      );
    }
    if (energyEfficiencyImprovements.present) {
      map['energy_efficiency_improvements'] = drift.Variable<String>(
        energyEfficiencyImprovements.value,
      );
    }
    if (renewableEnergyOpportunities.present) {
      map['renewable_energy_opportunities'] = drift.Variable<String>(
        renewableEnergyOpportunities.value,
      );
    }
    if (estimatedAnnualSavings.present) {
      map['estimated_annual_savings'] = drift.Variable<String>(
        estimatedAnnualSavings.value,
      );
    }
    if (potentialInvestmentCost.present) {
      map['potential_investment_cost'] = drift.Variable<String>(
        potentialInvestmentCost.value,
      );
    }
    if (paybackPeriod.present) {
      map['payback_period'] = drift.Variable<String>(paybackPeriod.value);
    }
    if (createdAt.present) {
      map['created_at'] = drift.Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = drift.Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AuditReportsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('totalCarbonFootprint: $totalCarbonFootprint, ')
          ..write('electricityConsumption: $electricityConsumption, ')
          ..write('vehicleUsage: $vehicleUsage, ')
          ..write('gasAndOtherFuels: $gasAndOtherFuels, ')
          ..write('wasteAndRecycling: $wasteAndRecycling, ')
          ..write('applianceCarbonFootprint: $applianceCarbonFootprint, ')
          ..write(
            'heavyApplianceCarbonFootprint: $heavyApplianceCarbonFootprint, ',
          )
          ..write('vehicleCarbonFootprint: $vehicleCarbonFootprint, ')
          ..write('energySavingSuggestions: $energySavingSuggestions, ')
          ..write(
            'energyEfficiencyImprovements: $energyEfficiencyImprovements, ',
          )
          ..write(
            'renewableEnergyOpportunities: $renewableEnergyOpportunities, ',
          )
          ..write('estimatedAnnualSavings: $estimatedAnnualSavings, ')
          ..write('potentialInvestmentCost: $potentialInvestmentCost, ')
          ..write('paybackPeriod: $paybackPeriod, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AuditsTable extends Audits with drift.TableInfo<$AuditsTable, Audit> {
  @override
  final drift.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AuditsTable(this.attachedDatabase, [this._alias]);
  static const drift.VerificationMeta _idMeta = const drift.VerificationMeta(
    'id',
  );
  @override
  late final drift.GeneratedColumn<int> id = drift.GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const drift.VerificationMeta _reportIdMeta =
      const drift.VerificationMeta('reportId');
  @override
  late final drift.GeneratedColumn<String> reportId =
      drift.GeneratedColumn<String>(
        'report_id',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES audit_reports (id)',
        ),
      );
  static const drift.VerificationMeta _ownerNameMeta =
      const drift.VerificationMeta('ownerName');
  @override
  late final drift.GeneratedColumn<String> ownerName =
      drift.GeneratedColumn<String>(
        'owner_name',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const drift.VerificationMeta _houseNameMeta =
      const drift.VerificationMeta('houseName');
  @override
  late final drift.GeneratedColumn<String> houseName =
      drift.GeneratedColumn<String>(
        'house_name',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const drift.VerificationMeta _mobileNumberMeta =
      const drift.VerificationMeta('mobileNumber');
  @override
  late final drift.GeneratedColumn<String> mobileNumber =
      drift.GeneratedColumn<String>(
        'mobile_number',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const drift.VerificationMeta _consumerNoMeta =
      const drift.VerificationMeta('consumerNo');
  @override
  late final drift.GeneratedColumn<String> consumerNo =
      drift.GeneratedColumn<String>(
        'consumer_no',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const drift.VerificationMeta _sectionMeta =
      const drift.VerificationMeta('section');
  @override
  late final drift.GeneratedColumn<String> section =
      drift.GeneratedColumn<String>(
        'section',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const drift.VerificationMeta _ksebPostOfficeMeta =
      const drift.VerificationMeta('ksebPostOffice');
  @override
  late final drift.GeneratedColumn<String> ksebPostOffice =
      drift.GeneratedColumn<String>(
        'kseb_post_office',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const drift.VerificationMeta _pinCodeMeta =
      const drift.VerificationMeta('pinCode');
  @override
  late final drift.GeneratedColumn<String> pinCode =
      drift.GeneratedColumn<String>(
        'pin_code',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const drift.VerificationMeta _panchayathMeta =
      const drift.VerificationMeta('panchayath');
  @override
  late final drift.GeneratedColumn<String> panchayath =
      drift.GeneratedColumn<String>(
        'panchayath',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const drift.VerificationMeta _biMonthlyConsumptionMeta =
      const drift.VerificationMeta('biMonthlyConsumption');
  @override
  late final drift.GeneratedColumn<String> biMonthlyConsumption =
      drift.GeneratedColumn<String>(
        'bi_monthly_consumption',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const drift.VerificationMeta _biMonthlyBillMeta =
      const drift.VerificationMeta('biMonthlyBill');
  @override
  late final drift.GeneratedColumn<String> biMonthlyBill =
      drift.GeneratedColumn<String>(
        'bi_monthly_bill',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const drift.VerificationMeta _memberCountMeta =
      const drift.VerificationMeta('memberCount');
  @override
  late final drift.GeneratedColumn<String> memberCount =
      drift.GeneratedColumn<String>(
        'member_count',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const drift.VerificationMeta _daysUninhabitedMeta =
      const drift.VerificationMeta('daysUninhabited');
  @override
  late final drift.GeneratedColumn<String> daysUninhabited =
      drift.GeneratedColumn<String>(
        'days_uninhabited',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const drift.VerificationMeta _hasSolarPlantMeta =
      const drift.VerificationMeta('hasSolarPlant');
  @override
  late final drift.GeneratedColumn<bool> hasSolarPlant =
      drift.GeneratedColumn<bool>(
        'has_solar_plant',
        aliasedName,
        true,
        type: DriftSqlType.bool,
        requiredDuringInsert: false,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("has_solar_plant" IN (0, 1))',
        ),
      );
  static const drift.VerificationMeta _solarCapacityMeta =
      const drift.VerificationMeta('solarCapacity');
  @override
  late final drift.GeneratedColumn<String> solarCapacity =
      drift.GeneratedColumn<String>(
        'solar_capacity',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const drift.VerificationMeta _tariffCategoryMeta =
      const drift.VerificationMeta('tariffCategory');
  @override
  late final drift.GeneratedColumn<String> tariffCategory =
      drift.GeneratedColumn<String>(
        'tariff_category',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const drift.VerificationMeta _connectedLoadMeta =
      const drift.VerificationMeta('connectedLoad');
  @override
  late final drift.GeneratedColumn<String> connectedLoad =
      drift.GeneratedColumn<String>(
        'connected_load',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const drift.VerificationMeta _natureOfConnectionMeta =
      const drift.VerificationMeta('natureOfConnection');
  @override
  late final drift.GeneratedColumn<String> natureOfConnection =
      drift.GeneratedColumn<String>(
        'nature_of_connection',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const drift.VerificationMeta _houseBuildingTypeMeta =
      const drift.VerificationMeta('houseBuildingType');
  @override
  late final drift.GeneratedColumn<String> houseBuildingType =
      drift.GeneratedColumn<String>(
        'house_building_type',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const drift.VerificationMeta _ownOrRentalMeta =
      const drift.VerificationMeta('ownOrRental');
  @override
  late final drift.GeneratedColumn<String> ownOrRental =
      drift.GeneratedColumn<String>(
        'own_or_rental',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const drift.VerificationMeta _noOfFloorsMeta =
      const drift.VerificationMeta('noOfFloors');
  @override
  late final drift.GeneratedColumn<String> noOfFloors =
      drift.GeneratedColumn<String>(
        'no_of_floors',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const drift.VerificationMeta _totalBuildingAreaMeta =
      const drift.VerificationMeta('totalBuildingArea');
  @override
  late final drift.GeneratedColumn<String> totalBuildingArea =
      drift.GeneratedColumn<String>(
        'total_building_area',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const drift.VerificationMeta _typeOfEarthingMeta =
      const drift.VerificationMeta('typeOfEarthing');
  @override
  late final drift.GeneratedColumn<String> typeOfEarthing =
      drift.GeneratedColumn<String>(
        'type_of_earthing',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const drift.VerificationMeta _controlSystemsMeta =
      const drift.VerificationMeta('controlSystems');
  @override
  late final drift.GeneratedColumn<String> controlSystems =
      drift.GeneratedColumn<String>(
        'control_systems',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const drift.VerificationMeta _noOfMcbsMeta =
      const drift.VerificationMeta('noOfMcbs');
  @override
  late final drift.GeneratedColumn<String> noOfMcbs =
      drift.GeneratedColumn<String>(
        'no_of_mcbs',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const drift.VerificationMeta _typeOfEnergyMeterMeta =
      const drift.VerificationMeta('typeOfEnergyMeter');
  @override
  late final drift.GeneratedColumn<String> typeOfEnergyMeter =
      drift.GeneratedColumn<String>(
        'type_of_energy_meter',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const drift.VerificationMeta _solarPlantTypeMeta =
      const drift.VerificationMeta('solarPlantType');
  @override
  late final drift.GeneratedColumn<String> solarPlantType =
      drift.GeneratedColumn<String>(
        'solar_plant_type',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const drift.VerificationMeta _firewoodMeta =
      const drift.VerificationMeta('firewood');
  @override
  late final drift.GeneratedColumn<String> firewood =
      drift.GeneratedColumn<String>(
        'firewood',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const drift.VerificationMeta _lpgMeta = const drift.VerificationMeta(
    'lpg',
  );
  @override
  late final drift.GeneratedColumn<String> lpg = drift.GeneratedColumn<String>(
    'lpg',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const drift.VerificationMeta _biogasMeta =
      const drift.VerificationMeta('biogas');
  @override
  late final drift.GeneratedColumn<String> biogas =
      drift.GeneratedColumn<String>(
        'biogas',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const drift.VerificationMeta _inductionMeta =
      const drift.VerificationMeta('induction');
  @override
  late final drift.GeneratedColumn<String> induction =
      drift.GeneratedColumn<String>(
        'induction',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const drift.VerificationMeta _otherFuelMeta =
      const drift.VerificationMeta('otherFuel');
  @override
  late final drift.GeneratedColumn<String> otherFuel =
      drift.GeneratedColumn<String>(
        'other_fuel',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const drift.VerificationMeta _tankCapacityMeta =
      const drift.VerificationMeta('tankCapacity');
  @override
  late final drift.GeneratedColumn<String> tankCapacity =
      drift.GeneratedColumn<String>(
        'tank_capacity',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const drift.VerificationMeta _pumpCapacityMeta =
      const drift.VerificationMeta('pumpCapacity');
  @override
  late final drift.GeneratedColumn<String> pumpCapacity =
      drift.GeneratedColumn<String>(
        'pump_capacity',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const drift.VerificationMeta _fillingTimeMeta =
      const drift.VerificationMeta('fillingTime');
  @override
  late final drift.GeneratedColumn<String> fillingTime =
      drift.GeneratedColumn<String>(
        'filling_time',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const drift.VerificationMeta _pumpCountMeta =
      const drift.VerificationMeta('pumpCount');
  @override
  late final drift.GeneratedColumn<String> pumpCount =
      drift.GeneratedColumn<String>(
        'pump_count',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const drift.VerificationMeta _waterSourceMeta =
      const drift.VerificationMeta('waterSource');
  @override
  late final drift.GeneratedColumn<String> waterSource =
      drift.GeneratedColumn<String>(
        'water_source',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const drift.VerificationMeta _waterUsageMeta =
      const drift.VerificationMeta('waterUsage');
  @override
  late final drift.GeneratedColumn<String> waterUsage =
      drift.GeneratedColumn<String>(
        'water_usage',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const drift.VerificationMeta _waterBillMeta =
      const drift.VerificationMeta('waterBill');
  @override
  late final drift.GeneratedColumn<String> waterBill =
      drift.GeneratedColumn<String>(
        'water_bill',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const drift.VerificationMeta _dailyPowerPumpMeta =
      const drift.VerificationMeta('dailyPowerPump');
  @override
  late final drift.GeneratedColumn<double> dailyPowerPump =
      drift.GeneratedColumn<double>(
        'daily_power_pump',
        aliasedName,
        true,
        type: DriftSqlType.double,
        requiredDuringInsert: false,
      );
  static const drift.VerificationMeta _annualPowerPumpMeta =
      const drift.VerificationMeta('annualPowerPump');
  @override
  late final drift.GeneratedColumn<double> annualPowerPump =
      drift.GeneratedColumn<double>(
        'annual_power_pump',
        aliasedName,
        true,
        type: DriftSqlType.double,
        requiredDuringInsert: false,
      );
  static const drift.VerificationMeta _appliancesMeta =
      const drift.VerificationMeta('appliances');
  @override
  late final drift.GeneratedColumn<String> appliances =
      drift.GeneratedColumn<String>(
        'appliances',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const drift.VerificationMeta _heavyAppliancesMeta =
      const drift.VerificationMeta('heavyAppliances');
  @override
  late final drift.GeneratedColumn<String> heavyAppliances =
      drift.GeneratedColumn<String>(
        'heavy_appliances',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const drift.VerificationMeta _vehiclesMeta =
      const drift.VerificationMeta('vehicles');
  @override
  late final drift.GeneratedColumn<String> vehicles =
      drift.GeneratedColumn<String>(
        'vehicles',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const drift.VerificationMeta _supabaseIdMeta =
      const drift.VerificationMeta('supabaseId');
  @override
  late final drift.GeneratedColumn<String> supabaseId =
      drift.GeneratedColumn<String>(
        'supabase_id',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const drift.VerificationMeta _userIdMeta =
      const drift.VerificationMeta('userId');
  @override
  late final drift.GeneratedColumn<String> userId =
      drift.GeneratedColumn<String>(
        'user_id',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const drift.VerificationMeta _isUploadedMeta =
      const drift.VerificationMeta('isUploaded');
  @override
  late final drift.GeneratedColumn<bool> isUploaded =
      drift.GeneratedColumn<bool>(
        'is_uploaded',
        aliasedName,
        false,
        type: DriftSqlType.bool,
        requiredDuringInsert: false,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_uploaded" IN (0, 1))',
        ),
        defaultValue: const drift.Constant(false),
      );
  static const drift.VerificationMeta _isUploadingMeta =
      const drift.VerificationMeta('isUploading');
  @override
  late final drift.GeneratedColumn<bool> isUploading =
      drift.GeneratedColumn<bool>(
        'is_uploading',
        aliasedName,
        false,
        type: DriftSqlType.bool,
        requiredDuringInsert: false,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_uploading" IN (0, 1))',
        ),
        defaultValue: const drift.Constant(false),
      );
  static const drift.VerificationMeta _completionTimeMeta =
      const drift.VerificationMeta('completionTime');
  @override
  late final drift.GeneratedColumn<DateTime> completionTime =
      drift.GeneratedColumn<DateTime>(
        'completion_time',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  @override
  List<drift.GeneratedColumn> get $columns => [
    id,
    reportId,
    ownerName,
    houseName,
    mobileNumber,
    consumerNo,
    section,
    ksebPostOffice,
    pinCode,
    panchayath,
    biMonthlyConsumption,
    biMonthlyBill,
    memberCount,
    daysUninhabited,
    hasSolarPlant,
    solarCapacity,
    tariffCategory,
    connectedLoad,
    natureOfConnection,
    houseBuildingType,
    ownOrRental,
    noOfFloors,
    totalBuildingArea,
    typeOfEarthing,
    controlSystems,
    noOfMcbs,
    typeOfEnergyMeter,
    solarPlantType,
    firewood,
    lpg,
    biogas,
    induction,
    otherFuel,
    tankCapacity,
    pumpCapacity,
    fillingTime,
    pumpCount,
    waterSource,
    waterUsage,
    waterBill,
    dailyPowerPump,
    annualPowerPump,
    appliances,
    heavyAppliances,
    vehicles,
    supabaseId,
    userId,
    isUploaded,
    isUploading,
    completionTime,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'audits';
  @override
  drift.VerificationContext validateIntegrity(
    drift.Insertable<Audit> instance, {
    bool isInserting = false,
  }) {
    final context = drift.VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('report_id')) {
      context.handle(
        _reportIdMeta,
        reportId.isAcceptableOrUnknown(data['report_id']!, _reportIdMeta),
      );
    }
    if (data.containsKey('owner_name')) {
      context.handle(
        _ownerNameMeta,
        ownerName.isAcceptableOrUnknown(data['owner_name']!, _ownerNameMeta),
      );
    }
    if (data.containsKey('house_name')) {
      context.handle(
        _houseNameMeta,
        houseName.isAcceptableOrUnknown(data['house_name']!, _houseNameMeta),
      );
    }
    if (data.containsKey('mobile_number')) {
      context.handle(
        _mobileNumberMeta,
        mobileNumber.isAcceptableOrUnknown(
          data['mobile_number']!,
          _mobileNumberMeta,
        ),
      );
    }
    if (data.containsKey('consumer_no')) {
      context.handle(
        _consumerNoMeta,
        consumerNo.isAcceptableOrUnknown(data['consumer_no']!, _consumerNoMeta),
      );
    }
    if (data.containsKey('section')) {
      context.handle(
        _sectionMeta,
        section.isAcceptableOrUnknown(data['section']!, _sectionMeta),
      );
    }
    if (data.containsKey('kseb_post_office')) {
      context.handle(
        _ksebPostOfficeMeta,
        ksebPostOffice.isAcceptableOrUnknown(
          data['kseb_post_office']!,
          _ksebPostOfficeMeta,
        ),
      );
    }
    if (data.containsKey('pin_code')) {
      context.handle(
        _pinCodeMeta,
        pinCode.isAcceptableOrUnknown(data['pin_code']!, _pinCodeMeta),
      );
    }
    if (data.containsKey('panchayath')) {
      context.handle(
        _panchayathMeta,
        panchayath.isAcceptableOrUnknown(data['panchayath']!, _panchayathMeta),
      );
    }
    if (data.containsKey('bi_monthly_consumption')) {
      context.handle(
        _biMonthlyConsumptionMeta,
        biMonthlyConsumption.isAcceptableOrUnknown(
          data['bi_monthly_consumption']!,
          _biMonthlyConsumptionMeta,
        ),
      );
    }
    if (data.containsKey('bi_monthly_bill')) {
      context.handle(
        _biMonthlyBillMeta,
        biMonthlyBill.isAcceptableOrUnknown(
          data['bi_monthly_bill']!,
          _biMonthlyBillMeta,
        ),
      );
    }
    if (data.containsKey('member_count')) {
      context.handle(
        _memberCountMeta,
        memberCount.isAcceptableOrUnknown(
          data['member_count']!,
          _memberCountMeta,
        ),
      );
    }
    if (data.containsKey('days_uninhabited')) {
      context.handle(
        _daysUninhabitedMeta,
        daysUninhabited.isAcceptableOrUnknown(
          data['days_uninhabited']!,
          _daysUninhabitedMeta,
        ),
      );
    }
    if (data.containsKey('has_solar_plant')) {
      context.handle(
        _hasSolarPlantMeta,
        hasSolarPlant.isAcceptableOrUnknown(
          data['has_solar_plant']!,
          _hasSolarPlantMeta,
        ),
      );
    }
    if (data.containsKey('solar_capacity')) {
      context.handle(
        _solarCapacityMeta,
        solarCapacity.isAcceptableOrUnknown(
          data['solar_capacity']!,
          _solarCapacityMeta,
        ),
      );
    }
    if (data.containsKey('tariff_category')) {
      context.handle(
        _tariffCategoryMeta,
        tariffCategory.isAcceptableOrUnknown(
          data['tariff_category']!,
          _tariffCategoryMeta,
        ),
      );
    }
    if (data.containsKey('connected_load')) {
      context.handle(
        _connectedLoadMeta,
        connectedLoad.isAcceptableOrUnknown(
          data['connected_load']!,
          _connectedLoadMeta,
        ),
      );
    }
    if (data.containsKey('nature_of_connection')) {
      context.handle(
        _natureOfConnectionMeta,
        natureOfConnection.isAcceptableOrUnknown(
          data['nature_of_connection']!,
          _natureOfConnectionMeta,
        ),
      );
    }
    if (data.containsKey('house_building_type')) {
      context.handle(
        _houseBuildingTypeMeta,
        houseBuildingType.isAcceptableOrUnknown(
          data['house_building_type']!,
          _houseBuildingTypeMeta,
        ),
      );
    }
    if (data.containsKey('own_or_rental')) {
      context.handle(
        _ownOrRentalMeta,
        ownOrRental.isAcceptableOrUnknown(
          data['own_or_rental']!,
          _ownOrRentalMeta,
        ),
      );
    }
    if (data.containsKey('no_of_floors')) {
      context.handle(
        _noOfFloorsMeta,
        noOfFloors.isAcceptableOrUnknown(
          data['no_of_floors']!,
          _noOfFloorsMeta,
        ),
      );
    }
    if (data.containsKey('total_building_area')) {
      context.handle(
        _totalBuildingAreaMeta,
        totalBuildingArea.isAcceptableOrUnknown(
          data['total_building_area']!,
          _totalBuildingAreaMeta,
        ),
      );
    }
    if (data.containsKey('type_of_earthing')) {
      context.handle(
        _typeOfEarthingMeta,
        typeOfEarthing.isAcceptableOrUnknown(
          data['type_of_earthing']!,
          _typeOfEarthingMeta,
        ),
      );
    }
    if (data.containsKey('control_systems')) {
      context.handle(
        _controlSystemsMeta,
        controlSystems.isAcceptableOrUnknown(
          data['control_systems']!,
          _controlSystemsMeta,
        ),
      );
    }
    if (data.containsKey('no_of_mcbs')) {
      context.handle(
        _noOfMcbsMeta,
        noOfMcbs.isAcceptableOrUnknown(data['no_of_mcbs']!, _noOfMcbsMeta),
      );
    }
    if (data.containsKey('type_of_energy_meter')) {
      context.handle(
        _typeOfEnergyMeterMeta,
        typeOfEnergyMeter.isAcceptableOrUnknown(
          data['type_of_energy_meter']!,
          _typeOfEnergyMeterMeta,
        ),
      );
    }
    if (data.containsKey('solar_plant_type')) {
      context.handle(
        _solarPlantTypeMeta,
        solarPlantType.isAcceptableOrUnknown(
          data['solar_plant_type']!,
          _solarPlantTypeMeta,
        ),
      );
    }
    if (data.containsKey('firewood')) {
      context.handle(
        _firewoodMeta,
        firewood.isAcceptableOrUnknown(data['firewood']!, _firewoodMeta),
      );
    }
    if (data.containsKey('lpg')) {
      context.handle(
        _lpgMeta,
        lpg.isAcceptableOrUnknown(data['lpg']!, _lpgMeta),
      );
    }
    if (data.containsKey('biogas')) {
      context.handle(
        _biogasMeta,
        biogas.isAcceptableOrUnknown(data['biogas']!, _biogasMeta),
      );
    }
    if (data.containsKey('induction')) {
      context.handle(
        _inductionMeta,
        induction.isAcceptableOrUnknown(data['induction']!, _inductionMeta),
      );
    }
    if (data.containsKey('other_fuel')) {
      context.handle(
        _otherFuelMeta,
        otherFuel.isAcceptableOrUnknown(data['other_fuel']!, _otherFuelMeta),
      );
    }
    if (data.containsKey('tank_capacity')) {
      context.handle(
        _tankCapacityMeta,
        tankCapacity.isAcceptableOrUnknown(
          data['tank_capacity']!,
          _tankCapacityMeta,
        ),
      );
    }
    if (data.containsKey('pump_capacity')) {
      context.handle(
        _pumpCapacityMeta,
        pumpCapacity.isAcceptableOrUnknown(
          data['pump_capacity']!,
          _pumpCapacityMeta,
        ),
      );
    }
    if (data.containsKey('filling_time')) {
      context.handle(
        _fillingTimeMeta,
        fillingTime.isAcceptableOrUnknown(
          data['filling_time']!,
          _fillingTimeMeta,
        ),
      );
    }
    if (data.containsKey('pump_count')) {
      context.handle(
        _pumpCountMeta,
        pumpCount.isAcceptableOrUnknown(data['pump_count']!, _pumpCountMeta),
      );
    }
    if (data.containsKey('water_source')) {
      context.handle(
        _waterSourceMeta,
        waterSource.isAcceptableOrUnknown(
          data['water_source']!,
          _waterSourceMeta,
        ),
      );
    }
    if (data.containsKey('water_usage')) {
      context.handle(
        _waterUsageMeta,
        waterUsage.isAcceptableOrUnknown(data['water_usage']!, _waterUsageMeta),
      );
    }
    if (data.containsKey('water_bill')) {
      context.handle(
        _waterBillMeta,
        waterBill.isAcceptableOrUnknown(data['water_bill']!, _waterBillMeta),
      );
    }
    if (data.containsKey('daily_power_pump')) {
      context.handle(
        _dailyPowerPumpMeta,
        dailyPowerPump.isAcceptableOrUnknown(
          data['daily_power_pump']!,
          _dailyPowerPumpMeta,
        ),
      );
    }
    if (data.containsKey('annual_power_pump')) {
      context.handle(
        _annualPowerPumpMeta,
        annualPowerPump.isAcceptableOrUnknown(
          data['annual_power_pump']!,
          _annualPowerPumpMeta,
        ),
      );
    }
    if (data.containsKey('appliances')) {
      context.handle(
        _appliancesMeta,
        appliances.isAcceptableOrUnknown(data['appliances']!, _appliancesMeta),
      );
    } else if (isInserting) {
      context.missing(_appliancesMeta);
    }
    if (data.containsKey('heavy_appliances')) {
      context.handle(
        _heavyAppliancesMeta,
        heavyAppliances.isAcceptableOrUnknown(
          data['heavy_appliances']!,
          _heavyAppliancesMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_heavyAppliancesMeta);
    }
    if (data.containsKey('vehicles')) {
      context.handle(
        _vehiclesMeta,
        vehicles.isAcceptableOrUnknown(data['vehicles']!, _vehiclesMeta),
      );
    } else if (isInserting) {
      context.missing(_vehiclesMeta);
    }
    if (data.containsKey('supabase_id')) {
      context.handle(
        _supabaseIdMeta,
        supabaseId.isAcceptableOrUnknown(data['supabase_id']!, _supabaseIdMeta),
      );
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    }
    if (data.containsKey('is_uploaded')) {
      context.handle(
        _isUploadedMeta,
        isUploaded.isAcceptableOrUnknown(data['is_uploaded']!, _isUploadedMeta),
      );
    }
    if (data.containsKey('is_uploading')) {
      context.handle(
        _isUploadingMeta,
        isUploading.isAcceptableOrUnknown(
          data['is_uploading']!,
          _isUploadingMeta,
        ),
      );
    }
    if (data.containsKey('completion_time')) {
      context.handle(
        _completionTimeMeta,
        completionTime.isAcceptableOrUnknown(
          data['completion_time']!,
          _completionTimeMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<drift.GeneratedColumn> get $primaryKey => {id};
  @override
  Audit map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Audit(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      reportId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}report_id'],
      ),
      ownerName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_name'],
      ),
      houseName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}house_name'],
      ),
      mobileNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mobile_number'],
      ),
      consumerNo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}consumer_no'],
      ),
      section: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}section'],
      ),
      ksebPostOffice: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}kseb_post_office'],
      ),
      pinCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pin_code'],
      ),
      panchayath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}panchayath'],
      ),
      biMonthlyConsumption: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}bi_monthly_consumption'],
      ),
      biMonthlyBill: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}bi_monthly_bill'],
      ),
      memberCount: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}member_count'],
      ),
      daysUninhabited: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}days_uninhabited'],
      ),
      hasSolarPlant: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}has_solar_plant'],
      ),
      solarCapacity: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}solar_capacity'],
      ),
      tariffCategory: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tariff_category'],
      ),
      connectedLoad: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}connected_load'],
      ),
      natureOfConnection: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nature_of_connection'],
      ),
      houseBuildingType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}house_building_type'],
      ),
      ownOrRental: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}own_or_rental'],
      ),
      noOfFloors: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}no_of_floors'],
      ),
      totalBuildingArea: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}total_building_area'],
      ),
      typeOfEarthing: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type_of_earthing'],
      ),
      controlSystems: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}control_systems'],
      ),
      noOfMcbs: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}no_of_mcbs'],
      ),
      typeOfEnergyMeter: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type_of_energy_meter'],
      ),
      solarPlantType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}solar_plant_type'],
      ),
      firewood: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}firewood'],
      ),
      lpg: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}lpg'],
      ),
      biogas: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}biogas'],
      ),
      induction: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}induction'],
      ),
      otherFuel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}other_fuel'],
      ),
      tankCapacity: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tank_capacity'],
      ),
      pumpCapacity: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pump_capacity'],
      ),
      fillingTime: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}filling_time'],
      ),
      pumpCount: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pump_count'],
      ),
      waterSource: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}water_source'],
      ),
      waterUsage: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}water_usage'],
      ),
      waterBill: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}water_bill'],
      ),
      dailyPowerPump: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}daily_power_pump'],
      ),
      annualPowerPump: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}annual_power_pump'],
      ),
      appliances: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}appliances'],
      )!,
      heavyAppliances: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}heavy_appliances'],
      )!,
      vehicles: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}vehicles'],
      )!,
      supabaseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}supabase_id'],
      ),
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      ),
      isUploaded: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_uploaded'],
      )!,
      isUploading: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_uploading'],
      )!,
      completionTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}completion_time'],
      ),
    );
  }

  @override
  $AuditsTable createAlias(String alias) {
    return $AuditsTable(attachedDatabase, alias);
  }
}

class Audit extends drift.DataClass implements drift.Insertable<Audit> {
  final int id;
  final String? reportId;
  final String? ownerName;
  final String? houseName;
  final String? mobileNumber;
  final String? consumerNo;
  final String? section;
  final String? ksebPostOffice;
  final String? pinCode;
  final String? panchayath;
  final String? biMonthlyConsumption;
  final String? biMonthlyBill;
  final String? memberCount;
  final String? daysUninhabited;
  final bool? hasSolarPlant;
  final String? solarCapacity;
  final String? tariffCategory;
  final String? connectedLoad;
  final String? natureOfConnection;
  final String? houseBuildingType;
  final String? ownOrRental;
  final String? noOfFloors;
  final String? totalBuildingArea;
  final String? typeOfEarthing;
  final String? controlSystems;
  final String? noOfMcbs;
  final String? typeOfEnergyMeter;
  final String? solarPlantType;
  final String? firewood;
  final String? lpg;
  final String? biogas;
  final String? induction;
  final String? otherFuel;
  final String? tankCapacity;
  final String? pumpCapacity;
  final String? fillingTime;
  final String? pumpCount;
  final String? waterSource;
  final String? waterUsage;
  final String? waterBill;
  final double? dailyPowerPump;
  final double? annualPowerPump;
  final String appliances;
  final String heavyAppliances;
  final String vehicles;
  final String? supabaseId;
  final String? userId;
  final bool isUploaded;
  final bool isUploading;
  final DateTime? completionTime;
  const Audit({
    required this.id,
    this.reportId,
    this.ownerName,
    this.houseName,
    this.mobileNumber,
    this.consumerNo,
    this.section,
    this.ksebPostOffice,
    this.pinCode,
    this.panchayath,
    this.biMonthlyConsumption,
    this.biMonthlyBill,
    this.memberCount,
    this.daysUninhabited,
    this.hasSolarPlant,
    this.solarCapacity,
    this.tariffCategory,
    this.connectedLoad,
    this.natureOfConnection,
    this.houseBuildingType,
    this.ownOrRental,
    this.noOfFloors,
    this.totalBuildingArea,
    this.typeOfEarthing,
    this.controlSystems,
    this.noOfMcbs,
    this.typeOfEnergyMeter,
    this.solarPlantType,
    this.firewood,
    this.lpg,
    this.biogas,
    this.induction,
    this.otherFuel,
    this.tankCapacity,
    this.pumpCapacity,
    this.fillingTime,
    this.pumpCount,
    this.waterSource,
    this.waterUsage,
    this.waterBill,
    this.dailyPowerPump,
    this.annualPowerPump,
    required this.appliances,
    required this.heavyAppliances,
    required this.vehicles,
    this.supabaseId,
    this.userId,
    required this.isUploaded,
    required this.isUploading,
    this.completionTime,
  });
  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    map['id'] = drift.Variable<int>(id);
    if (!nullToAbsent || reportId != null) {
      map['report_id'] = drift.Variable<String>(reportId);
    }
    if (!nullToAbsent || ownerName != null) {
      map['owner_name'] = drift.Variable<String>(ownerName);
    }
    if (!nullToAbsent || houseName != null) {
      map['house_name'] = drift.Variable<String>(houseName);
    }
    if (!nullToAbsent || mobileNumber != null) {
      map['mobile_number'] = drift.Variable<String>(mobileNumber);
    }
    if (!nullToAbsent || consumerNo != null) {
      map['consumer_no'] = drift.Variable<String>(consumerNo);
    }
    if (!nullToAbsent || section != null) {
      map['section'] = drift.Variable<String>(section);
    }
    if (!nullToAbsent || ksebPostOffice != null) {
      map['kseb_post_office'] = drift.Variable<String>(ksebPostOffice);
    }
    if (!nullToAbsent || pinCode != null) {
      map['pin_code'] = drift.Variable<String>(pinCode);
    }
    if (!nullToAbsent || panchayath != null) {
      map['panchayath'] = drift.Variable<String>(panchayath);
    }
    if (!nullToAbsent || biMonthlyConsumption != null) {
      map['bi_monthly_consumption'] = drift.Variable<String>(
        biMonthlyConsumption,
      );
    }
    if (!nullToAbsent || biMonthlyBill != null) {
      map['bi_monthly_bill'] = drift.Variable<String>(biMonthlyBill);
    }
    if (!nullToAbsent || memberCount != null) {
      map['member_count'] = drift.Variable<String>(memberCount);
    }
    if (!nullToAbsent || daysUninhabited != null) {
      map['days_uninhabited'] = drift.Variable<String>(daysUninhabited);
    }
    if (!nullToAbsent || hasSolarPlant != null) {
      map['has_solar_plant'] = drift.Variable<bool>(hasSolarPlant);
    }
    if (!nullToAbsent || solarCapacity != null) {
      map['solar_capacity'] = drift.Variable<String>(solarCapacity);
    }
    if (!nullToAbsent || tariffCategory != null) {
      map['tariff_category'] = drift.Variable<String>(tariffCategory);
    }
    if (!nullToAbsent || connectedLoad != null) {
      map['connected_load'] = drift.Variable<String>(connectedLoad);
    }
    if (!nullToAbsent || natureOfConnection != null) {
      map['nature_of_connection'] = drift.Variable<String>(natureOfConnection);
    }
    if (!nullToAbsent || houseBuildingType != null) {
      map['house_building_type'] = drift.Variable<String>(houseBuildingType);
    }
    if (!nullToAbsent || ownOrRental != null) {
      map['own_or_rental'] = drift.Variable<String>(ownOrRental);
    }
    if (!nullToAbsent || noOfFloors != null) {
      map['no_of_floors'] = drift.Variable<String>(noOfFloors);
    }
    if (!nullToAbsent || totalBuildingArea != null) {
      map['total_building_area'] = drift.Variable<String>(totalBuildingArea);
    }
    if (!nullToAbsent || typeOfEarthing != null) {
      map['type_of_earthing'] = drift.Variable<String>(typeOfEarthing);
    }
    if (!nullToAbsent || controlSystems != null) {
      map['control_systems'] = drift.Variable<String>(controlSystems);
    }
    if (!nullToAbsent || noOfMcbs != null) {
      map['no_of_mcbs'] = drift.Variable<String>(noOfMcbs);
    }
    if (!nullToAbsent || typeOfEnergyMeter != null) {
      map['type_of_energy_meter'] = drift.Variable<String>(typeOfEnergyMeter);
    }
    if (!nullToAbsent || solarPlantType != null) {
      map['solar_plant_type'] = drift.Variable<String>(solarPlantType);
    }
    if (!nullToAbsent || firewood != null) {
      map['firewood'] = drift.Variable<String>(firewood);
    }
    if (!nullToAbsent || lpg != null) {
      map['lpg'] = drift.Variable<String>(lpg);
    }
    if (!nullToAbsent || biogas != null) {
      map['biogas'] = drift.Variable<String>(biogas);
    }
    if (!nullToAbsent || induction != null) {
      map['induction'] = drift.Variable<String>(induction);
    }
    if (!nullToAbsent || otherFuel != null) {
      map['other_fuel'] = drift.Variable<String>(otherFuel);
    }
    if (!nullToAbsent || tankCapacity != null) {
      map['tank_capacity'] = drift.Variable<String>(tankCapacity);
    }
    if (!nullToAbsent || pumpCapacity != null) {
      map['pump_capacity'] = drift.Variable<String>(pumpCapacity);
    }
    if (!nullToAbsent || fillingTime != null) {
      map['filling_time'] = drift.Variable<String>(fillingTime);
    }
    if (!nullToAbsent || pumpCount != null) {
      map['pump_count'] = drift.Variable<String>(pumpCount);
    }
    if (!nullToAbsent || waterSource != null) {
      map['water_source'] = drift.Variable<String>(waterSource);
    }
    if (!nullToAbsent || waterUsage != null) {
      map['water_usage'] = drift.Variable<String>(waterUsage);
    }
    if (!nullToAbsent || waterBill != null) {
      map['water_bill'] = drift.Variable<String>(waterBill);
    }
    if (!nullToAbsent || dailyPowerPump != null) {
      map['daily_power_pump'] = drift.Variable<double>(dailyPowerPump);
    }
    if (!nullToAbsent || annualPowerPump != null) {
      map['annual_power_pump'] = drift.Variable<double>(annualPowerPump);
    }
    map['appliances'] = drift.Variable<String>(appliances);
    map['heavy_appliances'] = drift.Variable<String>(heavyAppliances);
    map['vehicles'] = drift.Variable<String>(vehicles);
    if (!nullToAbsent || supabaseId != null) {
      map['supabase_id'] = drift.Variable<String>(supabaseId);
    }
    if (!nullToAbsent || userId != null) {
      map['user_id'] = drift.Variable<String>(userId);
    }
    map['is_uploaded'] = drift.Variable<bool>(isUploaded);
    map['is_uploading'] = drift.Variable<bool>(isUploading);
    if (!nullToAbsent || completionTime != null) {
      map['completion_time'] = drift.Variable<DateTime>(completionTime);
    }
    return map;
  }

  AuditsCompanion toCompanion(bool nullToAbsent) {
    return AuditsCompanion(
      id: drift.Value(id),
      reportId: reportId == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(reportId),
      ownerName: ownerName == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(ownerName),
      houseName: houseName == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(houseName),
      mobileNumber: mobileNumber == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(mobileNumber),
      consumerNo: consumerNo == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(consumerNo),
      section: section == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(section),
      ksebPostOffice: ksebPostOffice == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(ksebPostOffice),
      pinCode: pinCode == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(pinCode),
      panchayath: panchayath == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(panchayath),
      biMonthlyConsumption: biMonthlyConsumption == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(biMonthlyConsumption),
      biMonthlyBill: biMonthlyBill == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(biMonthlyBill),
      memberCount: memberCount == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(memberCount),
      daysUninhabited: daysUninhabited == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(daysUninhabited),
      hasSolarPlant: hasSolarPlant == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(hasSolarPlant),
      solarCapacity: solarCapacity == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(solarCapacity),
      tariffCategory: tariffCategory == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(tariffCategory),
      connectedLoad: connectedLoad == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(connectedLoad),
      natureOfConnection: natureOfConnection == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(natureOfConnection),
      houseBuildingType: houseBuildingType == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(houseBuildingType),
      ownOrRental: ownOrRental == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(ownOrRental),
      noOfFloors: noOfFloors == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(noOfFloors),
      totalBuildingArea: totalBuildingArea == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(totalBuildingArea),
      typeOfEarthing: typeOfEarthing == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(typeOfEarthing),
      controlSystems: controlSystems == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(controlSystems),
      noOfMcbs: noOfMcbs == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(noOfMcbs),
      typeOfEnergyMeter: typeOfEnergyMeter == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(typeOfEnergyMeter),
      solarPlantType: solarPlantType == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(solarPlantType),
      firewood: firewood == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(firewood),
      lpg: lpg == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(lpg),
      biogas: biogas == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(biogas),
      induction: induction == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(induction),
      otherFuel: otherFuel == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(otherFuel),
      tankCapacity: tankCapacity == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(tankCapacity),
      pumpCapacity: pumpCapacity == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(pumpCapacity),
      fillingTime: fillingTime == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(fillingTime),
      pumpCount: pumpCount == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(pumpCount),
      waterSource: waterSource == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(waterSource),
      waterUsage: waterUsage == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(waterUsage),
      waterBill: waterBill == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(waterBill),
      dailyPowerPump: dailyPowerPump == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(dailyPowerPump),
      annualPowerPump: annualPowerPump == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(annualPowerPump),
      appliances: drift.Value(appliances),
      heavyAppliances: drift.Value(heavyAppliances),
      vehicles: drift.Value(vehicles),
      supabaseId: supabaseId == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(supabaseId),
      userId: userId == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(userId),
      isUploaded: drift.Value(isUploaded),
      isUploading: drift.Value(isUploading),
      completionTime: completionTime == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(completionTime),
    );
  }

  factory Audit.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return Audit(
      id: serializer.fromJson<int>(json['id']),
      reportId: serializer.fromJson<String?>(json['reportId']),
      ownerName: serializer.fromJson<String?>(json['ownerName']),
      houseName: serializer.fromJson<String?>(json['houseName']),
      mobileNumber: serializer.fromJson<String?>(json['mobileNumber']),
      consumerNo: serializer.fromJson<String?>(json['consumerNo']),
      section: serializer.fromJson<String?>(json['section']),
      ksebPostOffice: serializer.fromJson<String?>(json['ksebPostOffice']),
      pinCode: serializer.fromJson<String?>(json['pinCode']),
      panchayath: serializer.fromJson<String?>(json['panchayath']),
      biMonthlyConsumption: serializer.fromJson<String?>(
        json['biMonthlyConsumption'],
      ),
      biMonthlyBill: serializer.fromJson<String?>(json['biMonthlyBill']),
      memberCount: serializer.fromJson<String?>(json['memberCount']),
      daysUninhabited: serializer.fromJson<String?>(json['daysUninhabited']),
      hasSolarPlant: serializer.fromJson<bool?>(json['hasSolarPlant']),
      solarCapacity: serializer.fromJson<String?>(json['solarCapacity']),
      tariffCategory: serializer.fromJson<String?>(json['tariffCategory']),
      connectedLoad: serializer.fromJson<String?>(json['connectedLoad']),
      natureOfConnection: serializer.fromJson<String?>(
        json['natureOfConnection'],
      ),
      houseBuildingType: serializer.fromJson<String?>(
        json['houseBuildingType'],
      ),
      ownOrRental: serializer.fromJson<String?>(json['ownOrRental']),
      noOfFloors: serializer.fromJson<String?>(json['noOfFloors']),
      totalBuildingArea: serializer.fromJson<String?>(
        json['totalBuildingArea'],
      ),
      typeOfEarthing: serializer.fromJson<String?>(json['typeOfEarthing']),
      controlSystems: serializer.fromJson<String?>(json['controlSystems']),
      noOfMcbs: serializer.fromJson<String?>(json['noOfMcbs']),
      typeOfEnergyMeter: serializer.fromJson<String?>(
        json['typeOfEnergyMeter'],
      ),
      solarPlantType: serializer.fromJson<String?>(json['solarPlantType']),
      firewood: serializer.fromJson<String?>(json['firewood']),
      lpg: serializer.fromJson<String?>(json['lpg']),
      biogas: serializer.fromJson<String?>(json['biogas']),
      induction: serializer.fromJson<String?>(json['induction']),
      otherFuel: serializer.fromJson<String?>(json['otherFuel']),
      tankCapacity: serializer.fromJson<String?>(json['tankCapacity']),
      pumpCapacity: serializer.fromJson<String?>(json['pumpCapacity']),
      fillingTime: serializer.fromJson<String?>(json['fillingTime']),
      pumpCount: serializer.fromJson<String?>(json['pumpCount']),
      waterSource: serializer.fromJson<String?>(json['waterSource']),
      waterUsage: serializer.fromJson<String?>(json['waterUsage']),
      waterBill: serializer.fromJson<String?>(json['waterBill']),
      dailyPowerPump: serializer.fromJson<double?>(json['dailyPowerPump']),
      annualPowerPump: serializer.fromJson<double?>(json['annualPowerPump']),
      appliances: serializer.fromJson<String>(json['appliances']),
      heavyAppliances: serializer.fromJson<String>(json['heavyAppliances']),
      vehicles: serializer.fromJson<String>(json['vehicles']),
      supabaseId: serializer.fromJson<String?>(json['supabaseId']),
      userId: serializer.fromJson<String?>(json['userId']),
      isUploaded: serializer.fromJson<bool>(json['isUploaded']),
      isUploading: serializer.fromJson<bool>(json['isUploading']),
      completionTime: serializer.fromJson<DateTime?>(json['completionTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'reportId': serializer.toJson<String?>(reportId),
      'ownerName': serializer.toJson<String?>(ownerName),
      'houseName': serializer.toJson<String?>(houseName),
      'mobileNumber': serializer.toJson<String?>(mobileNumber),
      'consumerNo': serializer.toJson<String?>(consumerNo),
      'section': serializer.toJson<String?>(section),
      'ksebPostOffice': serializer.toJson<String?>(ksebPostOffice),
      'pinCode': serializer.toJson<String?>(pinCode),
      'panchayath': serializer.toJson<String?>(panchayath),
      'biMonthlyConsumption': serializer.toJson<String?>(biMonthlyConsumption),
      'biMonthlyBill': serializer.toJson<String?>(biMonthlyBill),
      'memberCount': serializer.toJson<String?>(memberCount),
      'daysUninhabited': serializer.toJson<String?>(daysUninhabited),
      'hasSolarPlant': serializer.toJson<bool?>(hasSolarPlant),
      'solarCapacity': serializer.toJson<String?>(solarCapacity),
      'tariffCategory': serializer.toJson<String?>(tariffCategory),
      'connectedLoad': serializer.toJson<String?>(connectedLoad),
      'natureOfConnection': serializer.toJson<String?>(natureOfConnection),
      'houseBuildingType': serializer.toJson<String?>(houseBuildingType),
      'ownOrRental': serializer.toJson<String?>(ownOrRental),
      'noOfFloors': serializer.toJson<String?>(noOfFloors),
      'totalBuildingArea': serializer.toJson<String?>(totalBuildingArea),
      'typeOfEarthing': serializer.toJson<String?>(typeOfEarthing),
      'controlSystems': serializer.toJson<String?>(controlSystems),
      'noOfMcbs': serializer.toJson<String?>(noOfMcbs),
      'typeOfEnergyMeter': serializer.toJson<String?>(typeOfEnergyMeter),
      'solarPlantType': serializer.toJson<String?>(solarPlantType),
      'firewood': serializer.toJson<String?>(firewood),
      'lpg': serializer.toJson<String?>(lpg),
      'biogas': serializer.toJson<String?>(biogas),
      'induction': serializer.toJson<String?>(induction),
      'otherFuel': serializer.toJson<String?>(otherFuel),
      'tankCapacity': serializer.toJson<String?>(tankCapacity),
      'pumpCapacity': serializer.toJson<String?>(pumpCapacity),
      'fillingTime': serializer.toJson<String?>(fillingTime),
      'pumpCount': serializer.toJson<String?>(pumpCount),
      'waterSource': serializer.toJson<String?>(waterSource),
      'waterUsage': serializer.toJson<String?>(waterUsage),
      'waterBill': serializer.toJson<String?>(waterBill),
      'dailyPowerPump': serializer.toJson<double?>(dailyPowerPump),
      'annualPowerPump': serializer.toJson<double?>(annualPowerPump),
      'appliances': serializer.toJson<String>(appliances),
      'heavyAppliances': serializer.toJson<String>(heavyAppliances),
      'vehicles': serializer.toJson<String>(vehicles),
      'supabaseId': serializer.toJson<String?>(supabaseId),
      'userId': serializer.toJson<String?>(userId),
      'isUploaded': serializer.toJson<bool>(isUploaded),
      'isUploading': serializer.toJson<bool>(isUploading),
      'completionTime': serializer.toJson<DateTime?>(completionTime),
    };
  }

  Audit copyWith({
    int? id,
    drift.Value<String?> reportId = const drift.Value.absent(),
    drift.Value<String?> ownerName = const drift.Value.absent(),
    drift.Value<String?> houseName = const drift.Value.absent(),
    drift.Value<String?> mobileNumber = const drift.Value.absent(),
    drift.Value<String?> consumerNo = const drift.Value.absent(),
    drift.Value<String?> section = const drift.Value.absent(),
    drift.Value<String?> ksebPostOffice = const drift.Value.absent(),
    drift.Value<String?> pinCode = const drift.Value.absent(),
    drift.Value<String?> panchayath = const drift.Value.absent(),
    drift.Value<String?> biMonthlyConsumption = const drift.Value.absent(),
    drift.Value<String?> biMonthlyBill = const drift.Value.absent(),
    drift.Value<String?> memberCount = const drift.Value.absent(),
    drift.Value<String?> daysUninhabited = const drift.Value.absent(),
    drift.Value<bool?> hasSolarPlant = const drift.Value.absent(),
    drift.Value<String?> solarCapacity = const drift.Value.absent(),
    drift.Value<String?> tariffCategory = const drift.Value.absent(),
    drift.Value<String?> connectedLoad = const drift.Value.absent(),
    drift.Value<String?> natureOfConnection = const drift.Value.absent(),
    drift.Value<String?> houseBuildingType = const drift.Value.absent(),
    drift.Value<String?> ownOrRental = const drift.Value.absent(),
    drift.Value<String?> noOfFloors = const drift.Value.absent(),
    drift.Value<String?> totalBuildingArea = const drift.Value.absent(),
    drift.Value<String?> typeOfEarthing = const drift.Value.absent(),
    drift.Value<String?> controlSystems = const drift.Value.absent(),
    drift.Value<String?> noOfMcbs = const drift.Value.absent(),
    drift.Value<String?> typeOfEnergyMeter = const drift.Value.absent(),
    drift.Value<String?> solarPlantType = const drift.Value.absent(),
    drift.Value<String?> firewood = const drift.Value.absent(),
    drift.Value<String?> lpg = const drift.Value.absent(),
    drift.Value<String?> biogas = const drift.Value.absent(),
    drift.Value<String?> induction = const drift.Value.absent(),
    drift.Value<String?> otherFuel = const drift.Value.absent(),
    drift.Value<String?> tankCapacity = const drift.Value.absent(),
    drift.Value<String?> pumpCapacity = const drift.Value.absent(),
    drift.Value<String?> fillingTime = const drift.Value.absent(),
    drift.Value<String?> pumpCount = const drift.Value.absent(),
    drift.Value<String?> waterSource = const drift.Value.absent(),
    drift.Value<String?> waterUsage = const drift.Value.absent(),
    drift.Value<String?> waterBill = const drift.Value.absent(),
    drift.Value<double?> dailyPowerPump = const drift.Value.absent(),
    drift.Value<double?> annualPowerPump = const drift.Value.absent(),
    String? appliances,
    String? heavyAppliances,
    String? vehicles,
    drift.Value<String?> supabaseId = const drift.Value.absent(),
    drift.Value<String?> userId = const drift.Value.absent(),
    bool? isUploaded,
    bool? isUploading,
    drift.Value<DateTime?> completionTime = const drift.Value.absent(),
  }) => Audit(
    id: id ?? this.id,
    reportId: reportId.present ? reportId.value : this.reportId,
    ownerName: ownerName.present ? ownerName.value : this.ownerName,
    houseName: houseName.present ? houseName.value : this.houseName,
    mobileNumber: mobileNumber.present ? mobileNumber.value : this.mobileNumber,
    consumerNo: consumerNo.present ? consumerNo.value : this.consumerNo,
    section: section.present ? section.value : this.section,
    ksebPostOffice: ksebPostOffice.present
        ? ksebPostOffice.value
        : this.ksebPostOffice,
    pinCode: pinCode.present ? pinCode.value : this.pinCode,
    panchayath: panchayath.present ? panchayath.value : this.panchayath,
    biMonthlyConsumption: biMonthlyConsumption.present
        ? biMonthlyConsumption.value
        : this.biMonthlyConsumption,
    biMonthlyBill: biMonthlyBill.present
        ? biMonthlyBill.value
        : this.biMonthlyBill,
    memberCount: memberCount.present ? memberCount.value : this.memberCount,
    daysUninhabited: daysUninhabited.present
        ? daysUninhabited.value
        : this.daysUninhabited,
    hasSolarPlant: hasSolarPlant.present
        ? hasSolarPlant.value
        : this.hasSolarPlant,
    solarCapacity: solarCapacity.present
        ? solarCapacity.value
        : this.solarCapacity,
    tariffCategory: tariffCategory.present
        ? tariffCategory.value
        : this.tariffCategory,
    connectedLoad: connectedLoad.present
        ? connectedLoad.value
        : this.connectedLoad,
    natureOfConnection: natureOfConnection.present
        ? natureOfConnection.value
        : this.natureOfConnection,
    houseBuildingType: houseBuildingType.present
        ? houseBuildingType.value
        : this.houseBuildingType,
    ownOrRental: ownOrRental.present ? ownOrRental.value : this.ownOrRental,
    noOfFloors: noOfFloors.present ? noOfFloors.value : this.noOfFloors,
    totalBuildingArea: totalBuildingArea.present
        ? totalBuildingArea.value
        : this.totalBuildingArea,
    typeOfEarthing: typeOfEarthing.present
        ? typeOfEarthing.value
        : this.typeOfEarthing,
    controlSystems: controlSystems.present
        ? controlSystems.value
        : this.controlSystems,
    noOfMcbs: noOfMcbs.present ? noOfMcbs.value : this.noOfMcbs,
    typeOfEnergyMeter: typeOfEnergyMeter.present
        ? typeOfEnergyMeter.value
        : this.typeOfEnergyMeter,
    solarPlantType: solarPlantType.present
        ? solarPlantType.value
        : this.solarPlantType,
    firewood: firewood.present ? firewood.value : this.firewood,
    lpg: lpg.present ? lpg.value : this.lpg,
    biogas: biogas.present ? biogas.value : this.biogas,
    induction: induction.present ? induction.value : this.induction,
    otherFuel: otherFuel.present ? otherFuel.value : this.otherFuel,
    tankCapacity: tankCapacity.present ? tankCapacity.value : this.tankCapacity,
    pumpCapacity: pumpCapacity.present ? pumpCapacity.value : this.pumpCapacity,
    fillingTime: fillingTime.present ? fillingTime.value : this.fillingTime,
    pumpCount: pumpCount.present ? pumpCount.value : this.pumpCount,
    waterSource: waterSource.present ? waterSource.value : this.waterSource,
    waterUsage: waterUsage.present ? waterUsage.value : this.waterUsage,
    waterBill: waterBill.present ? waterBill.value : this.waterBill,
    dailyPowerPump: dailyPowerPump.present
        ? dailyPowerPump.value
        : this.dailyPowerPump,
    annualPowerPump: annualPowerPump.present
        ? annualPowerPump.value
        : this.annualPowerPump,
    appliances: appliances ?? this.appliances,
    heavyAppliances: heavyAppliances ?? this.heavyAppliances,
    vehicles: vehicles ?? this.vehicles,
    supabaseId: supabaseId.present ? supabaseId.value : this.supabaseId,
    userId: userId.present ? userId.value : this.userId,
    isUploaded: isUploaded ?? this.isUploaded,
    isUploading: isUploading ?? this.isUploading,
    completionTime: completionTime.present
        ? completionTime.value
        : this.completionTime,
  );
  Audit copyWithCompanion(AuditsCompanion data) {
    return Audit(
      id: data.id.present ? data.id.value : this.id,
      reportId: data.reportId.present ? data.reportId.value : this.reportId,
      ownerName: data.ownerName.present ? data.ownerName.value : this.ownerName,
      houseName: data.houseName.present ? data.houseName.value : this.houseName,
      mobileNumber: data.mobileNumber.present
          ? data.mobileNumber.value
          : this.mobileNumber,
      consumerNo: data.consumerNo.present
          ? data.consumerNo.value
          : this.consumerNo,
      section: data.section.present ? data.section.value : this.section,
      ksebPostOffice: data.ksebPostOffice.present
          ? data.ksebPostOffice.value
          : this.ksebPostOffice,
      pinCode: data.pinCode.present ? data.pinCode.value : this.pinCode,
      panchayath: data.panchayath.present
          ? data.panchayath.value
          : this.panchayath,
      biMonthlyConsumption: data.biMonthlyConsumption.present
          ? data.biMonthlyConsumption.value
          : this.biMonthlyConsumption,
      biMonthlyBill: data.biMonthlyBill.present
          ? data.biMonthlyBill.value
          : this.biMonthlyBill,
      memberCount: data.memberCount.present
          ? data.memberCount.value
          : this.memberCount,
      daysUninhabited: data.daysUninhabited.present
          ? data.daysUninhabited.value
          : this.daysUninhabited,
      hasSolarPlant: data.hasSolarPlant.present
          ? data.hasSolarPlant.value
          : this.hasSolarPlant,
      solarCapacity: data.solarCapacity.present
          ? data.solarCapacity.value
          : this.solarCapacity,
      tariffCategory: data.tariffCategory.present
          ? data.tariffCategory.value
          : this.tariffCategory,
      connectedLoad: data.connectedLoad.present
          ? data.connectedLoad.value
          : this.connectedLoad,
      natureOfConnection: data.natureOfConnection.present
          ? data.natureOfConnection.value
          : this.natureOfConnection,
      houseBuildingType: data.houseBuildingType.present
          ? data.houseBuildingType.value
          : this.houseBuildingType,
      ownOrRental: data.ownOrRental.present
          ? data.ownOrRental.value
          : this.ownOrRental,
      noOfFloors: data.noOfFloors.present
          ? data.noOfFloors.value
          : this.noOfFloors,
      totalBuildingArea: data.totalBuildingArea.present
          ? data.totalBuildingArea.value
          : this.totalBuildingArea,
      typeOfEarthing: data.typeOfEarthing.present
          ? data.typeOfEarthing.value
          : this.typeOfEarthing,
      controlSystems: data.controlSystems.present
          ? data.controlSystems.value
          : this.controlSystems,
      noOfMcbs: data.noOfMcbs.present ? data.noOfMcbs.value : this.noOfMcbs,
      typeOfEnergyMeter: data.typeOfEnergyMeter.present
          ? data.typeOfEnergyMeter.value
          : this.typeOfEnergyMeter,
      solarPlantType: data.solarPlantType.present
          ? data.solarPlantType.value
          : this.solarPlantType,
      firewood: data.firewood.present ? data.firewood.value : this.firewood,
      lpg: data.lpg.present ? data.lpg.value : this.lpg,
      biogas: data.biogas.present ? data.biogas.value : this.biogas,
      induction: data.induction.present ? data.induction.value : this.induction,
      otherFuel: data.otherFuel.present ? data.otherFuel.value : this.otherFuel,
      tankCapacity: data.tankCapacity.present
          ? data.tankCapacity.value
          : this.tankCapacity,
      pumpCapacity: data.pumpCapacity.present
          ? data.pumpCapacity.value
          : this.pumpCapacity,
      fillingTime: data.fillingTime.present
          ? data.fillingTime.value
          : this.fillingTime,
      pumpCount: data.pumpCount.present ? data.pumpCount.value : this.pumpCount,
      waterSource: data.waterSource.present
          ? data.waterSource.value
          : this.waterSource,
      waterUsage: data.waterUsage.present
          ? data.waterUsage.value
          : this.waterUsage,
      waterBill: data.waterBill.present ? data.waterBill.value : this.waterBill,
      dailyPowerPump: data.dailyPowerPump.present
          ? data.dailyPowerPump.value
          : this.dailyPowerPump,
      annualPowerPump: data.annualPowerPump.present
          ? data.annualPowerPump.value
          : this.annualPowerPump,
      appliances: data.appliances.present
          ? data.appliances.value
          : this.appliances,
      heavyAppliances: data.heavyAppliances.present
          ? data.heavyAppliances.value
          : this.heavyAppliances,
      vehicles: data.vehicles.present ? data.vehicles.value : this.vehicles,
      supabaseId: data.supabaseId.present
          ? data.supabaseId.value
          : this.supabaseId,
      userId: data.userId.present ? data.userId.value : this.userId,
      isUploaded: data.isUploaded.present
          ? data.isUploaded.value
          : this.isUploaded,
      isUploading: data.isUploading.present
          ? data.isUploading.value
          : this.isUploading,
      completionTime: data.completionTime.present
          ? data.completionTime.value
          : this.completionTime,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Audit(')
          ..write('id: $id, ')
          ..write('reportId: $reportId, ')
          ..write('ownerName: $ownerName, ')
          ..write('houseName: $houseName, ')
          ..write('mobileNumber: $mobileNumber, ')
          ..write('consumerNo: $consumerNo, ')
          ..write('section: $section, ')
          ..write('ksebPostOffice: $ksebPostOffice, ')
          ..write('pinCode: $pinCode, ')
          ..write('panchayath: $panchayath, ')
          ..write('biMonthlyConsumption: $biMonthlyConsumption, ')
          ..write('biMonthlyBill: $biMonthlyBill, ')
          ..write('memberCount: $memberCount, ')
          ..write('daysUninhabited: $daysUninhabited, ')
          ..write('hasSolarPlant: $hasSolarPlant, ')
          ..write('solarCapacity: $solarCapacity, ')
          ..write('tariffCategory: $tariffCategory, ')
          ..write('connectedLoad: $connectedLoad, ')
          ..write('natureOfConnection: $natureOfConnection, ')
          ..write('houseBuildingType: $houseBuildingType, ')
          ..write('ownOrRental: $ownOrRental, ')
          ..write('noOfFloors: $noOfFloors, ')
          ..write('totalBuildingArea: $totalBuildingArea, ')
          ..write('typeOfEarthing: $typeOfEarthing, ')
          ..write('controlSystems: $controlSystems, ')
          ..write('noOfMcbs: $noOfMcbs, ')
          ..write('typeOfEnergyMeter: $typeOfEnergyMeter, ')
          ..write('solarPlantType: $solarPlantType, ')
          ..write('firewood: $firewood, ')
          ..write('lpg: $lpg, ')
          ..write('biogas: $biogas, ')
          ..write('induction: $induction, ')
          ..write('otherFuel: $otherFuel, ')
          ..write('tankCapacity: $tankCapacity, ')
          ..write('pumpCapacity: $pumpCapacity, ')
          ..write('fillingTime: $fillingTime, ')
          ..write('pumpCount: $pumpCount, ')
          ..write('waterSource: $waterSource, ')
          ..write('waterUsage: $waterUsage, ')
          ..write('waterBill: $waterBill, ')
          ..write('dailyPowerPump: $dailyPowerPump, ')
          ..write('annualPowerPump: $annualPowerPump, ')
          ..write('appliances: $appliances, ')
          ..write('heavyAppliances: $heavyAppliances, ')
          ..write('vehicles: $vehicles, ')
          ..write('supabaseId: $supabaseId, ')
          ..write('userId: $userId, ')
          ..write('isUploaded: $isUploaded, ')
          ..write('isUploading: $isUploading, ')
          ..write('completionTime: $completionTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    reportId,
    ownerName,
    houseName,
    mobileNumber,
    consumerNo,
    section,
    ksebPostOffice,
    pinCode,
    panchayath,
    biMonthlyConsumption,
    biMonthlyBill,
    memberCount,
    daysUninhabited,
    hasSolarPlant,
    solarCapacity,
    tariffCategory,
    connectedLoad,
    natureOfConnection,
    houseBuildingType,
    ownOrRental,
    noOfFloors,
    totalBuildingArea,
    typeOfEarthing,
    controlSystems,
    noOfMcbs,
    typeOfEnergyMeter,
    solarPlantType,
    firewood,
    lpg,
    biogas,
    induction,
    otherFuel,
    tankCapacity,
    pumpCapacity,
    fillingTime,
    pumpCount,
    waterSource,
    waterUsage,
    waterBill,
    dailyPowerPump,
    annualPowerPump,
    appliances,
    heavyAppliances,
    vehicles,
    supabaseId,
    userId,
    isUploaded,
    isUploading,
    completionTime,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Audit &&
          other.id == this.id &&
          other.reportId == this.reportId &&
          other.ownerName == this.ownerName &&
          other.houseName == this.houseName &&
          other.mobileNumber == this.mobileNumber &&
          other.consumerNo == this.consumerNo &&
          other.section == this.section &&
          other.ksebPostOffice == this.ksebPostOffice &&
          other.pinCode == this.pinCode &&
          other.panchayath == this.panchayath &&
          other.biMonthlyConsumption == this.biMonthlyConsumption &&
          other.biMonthlyBill == this.biMonthlyBill &&
          other.memberCount == this.memberCount &&
          other.daysUninhabited == this.daysUninhabited &&
          other.hasSolarPlant == this.hasSolarPlant &&
          other.solarCapacity == this.solarCapacity &&
          other.tariffCategory == this.tariffCategory &&
          other.connectedLoad == this.connectedLoad &&
          other.natureOfConnection == this.natureOfConnection &&
          other.houseBuildingType == this.houseBuildingType &&
          other.ownOrRental == this.ownOrRental &&
          other.noOfFloors == this.noOfFloors &&
          other.totalBuildingArea == this.totalBuildingArea &&
          other.typeOfEarthing == this.typeOfEarthing &&
          other.controlSystems == this.controlSystems &&
          other.noOfMcbs == this.noOfMcbs &&
          other.typeOfEnergyMeter == this.typeOfEnergyMeter &&
          other.solarPlantType == this.solarPlantType &&
          other.firewood == this.firewood &&
          other.lpg == this.lpg &&
          other.biogas == this.biogas &&
          other.induction == this.induction &&
          other.otherFuel == this.otherFuel &&
          other.tankCapacity == this.tankCapacity &&
          other.pumpCapacity == this.pumpCapacity &&
          other.fillingTime == this.fillingTime &&
          other.pumpCount == this.pumpCount &&
          other.waterSource == this.waterSource &&
          other.waterUsage == this.waterUsage &&
          other.waterBill == this.waterBill &&
          other.dailyPowerPump == this.dailyPowerPump &&
          other.annualPowerPump == this.annualPowerPump &&
          other.appliances == this.appliances &&
          other.heavyAppliances == this.heavyAppliances &&
          other.vehicles == this.vehicles &&
          other.supabaseId == this.supabaseId &&
          other.userId == this.userId &&
          other.isUploaded == this.isUploaded &&
          other.isUploading == this.isUploading &&
          other.completionTime == this.completionTime);
}

class AuditsCompanion extends drift.UpdateCompanion<Audit> {
  final drift.Value<int> id;
  final drift.Value<String?> reportId;
  final drift.Value<String?> ownerName;
  final drift.Value<String?> houseName;
  final drift.Value<String?> mobileNumber;
  final drift.Value<String?> consumerNo;
  final drift.Value<String?> section;
  final drift.Value<String?> ksebPostOffice;
  final drift.Value<String?> pinCode;
  final drift.Value<String?> panchayath;
  final drift.Value<String?> biMonthlyConsumption;
  final drift.Value<String?> biMonthlyBill;
  final drift.Value<String?> memberCount;
  final drift.Value<String?> daysUninhabited;
  final drift.Value<bool?> hasSolarPlant;
  final drift.Value<String?> solarCapacity;
  final drift.Value<String?> tariffCategory;
  final drift.Value<String?> connectedLoad;
  final drift.Value<String?> natureOfConnection;
  final drift.Value<String?> houseBuildingType;
  final drift.Value<String?> ownOrRental;
  final drift.Value<String?> noOfFloors;
  final drift.Value<String?> totalBuildingArea;
  final drift.Value<String?> typeOfEarthing;
  final drift.Value<String?> controlSystems;
  final drift.Value<String?> noOfMcbs;
  final drift.Value<String?> typeOfEnergyMeter;
  final drift.Value<String?> solarPlantType;
  final drift.Value<String?> firewood;
  final drift.Value<String?> lpg;
  final drift.Value<String?> biogas;
  final drift.Value<String?> induction;
  final drift.Value<String?> otherFuel;
  final drift.Value<String?> tankCapacity;
  final drift.Value<String?> pumpCapacity;
  final drift.Value<String?> fillingTime;
  final drift.Value<String?> pumpCount;
  final drift.Value<String?> waterSource;
  final drift.Value<String?> waterUsage;
  final drift.Value<String?> waterBill;
  final drift.Value<double?> dailyPowerPump;
  final drift.Value<double?> annualPowerPump;
  final drift.Value<String> appliances;
  final drift.Value<String> heavyAppliances;
  final drift.Value<String> vehicles;
  final drift.Value<String?> supabaseId;
  final drift.Value<String?> userId;
  final drift.Value<bool> isUploaded;
  final drift.Value<bool> isUploading;
  final drift.Value<DateTime?> completionTime;
  const AuditsCompanion({
    this.id = const drift.Value.absent(),
    this.reportId = const drift.Value.absent(),
    this.ownerName = const drift.Value.absent(),
    this.houseName = const drift.Value.absent(),
    this.mobileNumber = const drift.Value.absent(),
    this.consumerNo = const drift.Value.absent(),
    this.section = const drift.Value.absent(),
    this.ksebPostOffice = const drift.Value.absent(),
    this.pinCode = const drift.Value.absent(),
    this.panchayath = const drift.Value.absent(),
    this.biMonthlyConsumption = const drift.Value.absent(),
    this.biMonthlyBill = const drift.Value.absent(),
    this.memberCount = const drift.Value.absent(),
    this.daysUninhabited = const drift.Value.absent(),
    this.hasSolarPlant = const drift.Value.absent(),
    this.solarCapacity = const drift.Value.absent(),
    this.tariffCategory = const drift.Value.absent(),
    this.connectedLoad = const drift.Value.absent(),
    this.natureOfConnection = const drift.Value.absent(),
    this.houseBuildingType = const drift.Value.absent(),
    this.ownOrRental = const drift.Value.absent(),
    this.noOfFloors = const drift.Value.absent(),
    this.totalBuildingArea = const drift.Value.absent(),
    this.typeOfEarthing = const drift.Value.absent(),
    this.controlSystems = const drift.Value.absent(),
    this.noOfMcbs = const drift.Value.absent(),
    this.typeOfEnergyMeter = const drift.Value.absent(),
    this.solarPlantType = const drift.Value.absent(),
    this.firewood = const drift.Value.absent(),
    this.lpg = const drift.Value.absent(),
    this.biogas = const drift.Value.absent(),
    this.induction = const drift.Value.absent(),
    this.otherFuel = const drift.Value.absent(),
    this.tankCapacity = const drift.Value.absent(),
    this.pumpCapacity = const drift.Value.absent(),
    this.fillingTime = const drift.Value.absent(),
    this.pumpCount = const drift.Value.absent(),
    this.waterSource = const drift.Value.absent(),
    this.waterUsage = const drift.Value.absent(),
    this.waterBill = const drift.Value.absent(),
    this.dailyPowerPump = const drift.Value.absent(),
    this.annualPowerPump = const drift.Value.absent(),
    this.appliances = const drift.Value.absent(),
    this.heavyAppliances = const drift.Value.absent(),
    this.vehicles = const drift.Value.absent(),
    this.supabaseId = const drift.Value.absent(),
    this.userId = const drift.Value.absent(),
    this.isUploaded = const drift.Value.absent(),
    this.isUploading = const drift.Value.absent(),
    this.completionTime = const drift.Value.absent(),
  });
  AuditsCompanion.insert({
    this.id = const drift.Value.absent(),
    this.reportId = const drift.Value.absent(),
    this.ownerName = const drift.Value.absent(),
    this.houseName = const drift.Value.absent(),
    this.mobileNumber = const drift.Value.absent(),
    this.consumerNo = const drift.Value.absent(),
    this.section = const drift.Value.absent(),
    this.ksebPostOffice = const drift.Value.absent(),
    this.pinCode = const drift.Value.absent(),
    this.panchayath = const drift.Value.absent(),
    this.biMonthlyConsumption = const drift.Value.absent(),
    this.biMonthlyBill = const drift.Value.absent(),
    this.memberCount = const drift.Value.absent(),
    this.daysUninhabited = const drift.Value.absent(),
    this.hasSolarPlant = const drift.Value.absent(),
    this.solarCapacity = const drift.Value.absent(),
    this.tariffCategory = const drift.Value.absent(),
    this.connectedLoad = const drift.Value.absent(),
    this.natureOfConnection = const drift.Value.absent(),
    this.houseBuildingType = const drift.Value.absent(),
    this.ownOrRental = const drift.Value.absent(),
    this.noOfFloors = const drift.Value.absent(),
    this.totalBuildingArea = const drift.Value.absent(),
    this.typeOfEarthing = const drift.Value.absent(),
    this.controlSystems = const drift.Value.absent(),
    this.noOfMcbs = const drift.Value.absent(),
    this.typeOfEnergyMeter = const drift.Value.absent(),
    this.solarPlantType = const drift.Value.absent(),
    this.firewood = const drift.Value.absent(),
    this.lpg = const drift.Value.absent(),
    this.biogas = const drift.Value.absent(),
    this.induction = const drift.Value.absent(),
    this.otherFuel = const drift.Value.absent(),
    this.tankCapacity = const drift.Value.absent(),
    this.pumpCapacity = const drift.Value.absent(),
    this.fillingTime = const drift.Value.absent(),
    this.pumpCount = const drift.Value.absent(),
    this.waterSource = const drift.Value.absent(),
    this.waterUsage = const drift.Value.absent(),
    this.waterBill = const drift.Value.absent(),
    this.dailyPowerPump = const drift.Value.absent(),
    this.annualPowerPump = const drift.Value.absent(),
    required String appliances,
    required String heavyAppliances,
    required String vehicles,
    this.supabaseId = const drift.Value.absent(),
    this.userId = const drift.Value.absent(),
    this.isUploaded = const drift.Value.absent(),
    this.isUploading = const drift.Value.absent(),
    this.completionTime = const drift.Value.absent(),
  }) : appliances = drift.Value(appliances),
       heavyAppliances = drift.Value(heavyAppliances),
       vehicles = drift.Value(vehicles);
  static drift.Insertable<Audit> custom({
    drift.Expression<int>? id,
    drift.Expression<String>? reportId,
    drift.Expression<String>? ownerName,
    drift.Expression<String>? houseName,
    drift.Expression<String>? mobileNumber,
    drift.Expression<String>? consumerNo,
    drift.Expression<String>? section,
    drift.Expression<String>? ksebPostOffice,
    drift.Expression<String>? pinCode,
    drift.Expression<String>? panchayath,
    drift.Expression<String>? biMonthlyConsumption,
    drift.Expression<String>? biMonthlyBill,
    drift.Expression<String>? memberCount,
    drift.Expression<String>? daysUninhabited,
    drift.Expression<bool>? hasSolarPlant,
    drift.Expression<String>? solarCapacity,
    drift.Expression<String>? tariffCategory,
    drift.Expression<String>? connectedLoad,
    drift.Expression<String>? natureOfConnection,
    drift.Expression<String>? houseBuildingType,
    drift.Expression<String>? ownOrRental,
    drift.Expression<String>? noOfFloors,
    drift.Expression<String>? totalBuildingArea,
    drift.Expression<String>? typeOfEarthing,
    drift.Expression<String>? controlSystems,
    drift.Expression<String>? noOfMcbs,
    drift.Expression<String>? typeOfEnergyMeter,
    drift.Expression<String>? solarPlantType,
    drift.Expression<String>? firewood,
    drift.Expression<String>? lpg,
    drift.Expression<String>? biogas,
    drift.Expression<String>? induction,
    drift.Expression<String>? otherFuel,
    drift.Expression<String>? tankCapacity,
    drift.Expression<String>? pumpCapacity,
    drift.Expression<String>? fillingTime,
    drift.Expression<String>? pumpCount,
    drift.Expression<String>? waterSource,
    drift.Expression<String>? waterUsage,
    drift.Expression<String>? waterBill,
    drift.Expression<double>? dailyPowerPump,
    drift.Expression<double>? annualPowerPump,
    drift.Expression<String>? appliances,
    drift.Expression<String>? heavyAppliances,
    drift.Expression<String>? vehicles,
    drift.Expression<String>? supabaseId,
    drift.Expression<String>? userId,
    drift.Expression<bool>? isUploaded,
    drift.Expression<bool>? isUploading,
    drift.Expression<DateTime>? completionTime,
  }) {
    return drift.RawValuesInsertable({
      if (id != null) 'id': id,
      if (reportId != null) 'report_id': reportId,
      if (ownerName != null) 'owner_name': ownerName,
      if (houseName != null) 'house_name': houseName,
      if (mobileNumber != null) 'mobile_number': mobileNumber,
      if (consumerNo != null) 'consumer_no': consumerNo,
      if (section != null) 'section': section,
      if (ksebPostOffice != null) 'kseb_post_office': ksebPostOffice,
      if (pinCode != null) 'pin_code': pinCode,
      if (panchayath != null) 'panchayath': panchayath,
      if (biMonthlyConsumption != null)
        'bi_monthly_consumption': biMonthlyConsumption,
      if (biMonthlyBill != null) 'bi_monthly_bill': biMonthlyBill,
      if (memberCount != null) 'member_count': memberCount,
      if (daysUninhabited != null) 'days_uninhabited': daysUninhabited,
      if (hasSolarPlant != null) 'has_solar_plant': hasSolarPlant,
      if (solarCapacity != null) 'solar_capacity': solarCapacity,
      if (tariffCategory != null) 'tariff_category': tariffCategory,
      if (connectedLoad != null) 'connected_load': connectedLoad,
      if (natureOfConnection != null)
        'nature_of_connection': natureOfConnection,
      if (houseBuildingType != null) 'house_building_type': houseBuildingType,
      if (ownOrRental != null) 'own_or_rental': ownOrRental,
      if (noOfFloors != null) 'no_of_floors': noOfFloors,
      if (totalBuildingArea != null) 'total_building_area': totalBuildingArea,
      if (typeOfEarthing != null) 'type_of_earthing': typeOfEarthing,
      if (controlSystems != null) 'control_systems': controlSystems,
      if (noOfMcbs != null) 'no_of_mcbs': noOfMcbs,
      if (typeOfEnergyMeter != null) 'type_of_energy_meter': typeOfEnergyMeter,
      if (solarPlantType != null) 'solar_plant_type': solarPlantType,
      if (firewood != null) 'firewood': firewood,
      if (lpg != null) 'lpg': lpg,
      if (biogas != null) 'biogas': biogas,
      if (induction != null) 'induction': induction,
      if (otherFuel != null) 'other_fuel': otherFuel,
      if (tankCapacity != null) 'tank_capacity': tankCapacity,
      if (pumpCapacity != null) 'pump_capacity': pumpCapacity,
      if (fillingTime != null) 'filling_time': fillingTime,
      if (pumpCount != null) 'pump_count': pumpCount,
      if (waterSource != null) 'water_source': waterSource,
      if (waterUsage != null) 'water_usage': waterUsage,
      if (waterBill != null) 'water_bill': waterBill,
      if (dailyPowerPump != null) 'daily_power_pump': dailyPowerPump,
      if (annualPowerPump != null) 'annual_power_pump': annualPowerPump,
      if (appliances != null) 'appliances': appliances,
      if (heavyAppliances != null) 'heavy_appliances': heavyAppliances,
      if (vehicles != null) 'vehicles': vehicles,
      if (supabaseId != null) 'supabase_id': supabaseId,
      if (userId != null) 'user_id': userId,
      if (isUploaded != null) 'is_uploaded': isUploaded,
      if (isUploading != null) 'is_uploading': isUploading,
      if (completionTime != null) 'completion_time': completionTime,
    });
  }

  AuditsCompanion copyWith({
    drift.Value<int>? id,
    drift.Value<String?>? reportId,
    drift.Value<String?>? ownerName,
    drift.Value<String?>? houseName,
    drift.Value<String?>? mobileNumber,
    drift.Value<String?>? consumerNo,
    drift.Value<String?>? section,
    drift.Value<String?>? ksebPostOffice,
    drift.Value<String?>? pinCode,
    drift.Value<String?>? panchayath,
    drift.Value<String?>? biMonthlyConsumption,
    drift.Value<String?>? biMonthlyBill,
    drift.Value<String?>? memberCount,
    drift.Value<String?>? daysUninhabited,
    drift.Value<bool?>? hasSolarPlant,
    drift.Value<String?>? solarCapacity,
    drift.Value<String?>? tariffCategory,
    drift.Value<String?>? connectedLoad,
    drift.Value<String?>? natureOfConnection,
    drift.Value<String?>? houseBuildingType,
    drift.Value<String?>? ownOrRental,
    drift.Value<String?>? noOfFloors,
    drift.Value<String?>? totalBuildingArea,
    drift.Value<String?>? typeOfEarthing,
    drift.Value<String?>? controlSystems,
    drift.Value<String?>? noOfMcbs,
    drift.Value<String?>? typeOfEnergyMeter,
    drift.Value<String?>? solarPlantType,
    drift.Value<String?>? firewood,
    drift.Value<String?>? lpg,
    drift.Value<String?>? biogas,
    drift.Value<String?>? induction,
    drift.Value<String?>? otherFuel,
    drift.Value<String?>? tankCapacity,
    drift.Value<String?>? pumpCapacity,
    drift.Value<String?>? fillingTime,
    drift.Value<String?>? pumpCount,
    drift.Value<String?>? waterSource,
    drift.Value<String?>? waterUsage,
    drift.Value<String?>? waterBill,
    drift.Value<double?>? dailyPowerPump,
    drift.Value<double?>? annualPowerPump,
    drift.Value<String>? appliances,
    drift.Value<String>? heavyAppliances,
    drift.Value<String>? vehicles,
    drift.Value<String?>? supabaseId,
    drift.Value<String?>? userId,
    drift.Value<bool>? isUploaded,
    drift.Value<bool>? isUploading,
    drift.Value<DateTime?>? completionTime,
  }) {
    return AuditsCompanion(
      id: id ?? this.id,
      reportId: reportId ?? this.reportId,
      ownerName: ownerName ?? this.ownerName,
      houseName: houseName ?? this.houseName,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      consumerNo: consumerNo ?? this.consumerNo,
      section: section ?? this.section,
      ksebPostOffice: ksebPostOffice ?? this.ksebPostOffice,
      pinCode: pinCode ?? this.pinCode,
      panchayath: panchayath ?? this.panchayath,
      biMonthlyConsumption: biMonthlyConsumption ?? this.biMonthlyConsumption,
      biMonthlyBill: biMonthlyBill ?? this.biMonthlyBill,
      memberCount: memberCount ?? this.memberCount,
      daysUninhabited: daysUninhabited ?? this.daysUninhabited,
      hasSolarPlant: hasSolarPlant ?? this.hasSolarPlant,
      solarCapacity: solarCapacity ?? this.solarCapacity,
      tariffCategory: tariffCategory ?? this.tariffCategory,
      connectedLoad: connectedLoad ?? this.connectedLoad,
      natureOfConnection: natureOfConnection ?? this.natureOfConnection,
      houseBuildingType: houseBuildingType ?? this.houseBuildingType,
      ownOrRental: ownOrRental ?? this.ownOrRental,
      noOfFloors: noOfFloors ?? this.noOfFloors,
      totalBuildingArea: totalBuildingArea ?? this.totalBuildingArea,
      typeOfEarthing: typeOfEarthing ?? this.typeOfEarthing,
      controlSystems: controlSystems ?? this.controlSystems,
      noOfMcbs: noOfMcbs ?? this.noOfMcbs,
      typeOfEnergyMeter: typeOfEnergyMeter ?? this.typeOfEnergyMeter,
      solarPlantType: solarPlantType ?? this.solarPlantType,
      firewood: firewood ?? this.firewood,
      lpg: lpg ?? this.lpg,
      biogas: biogas ?? this.biogas,
      induction: induction ?? this.induction,
      otherFuel: otherFuel ?? this.otherFuel,
      tankCapacity: tankCapacity ?? this.tankCapacity,
      pumpCapacity: pumpCapacity ?? this.pumpCapacity,
      fillingTime: fillingTime ?? this.fillingTime,
      pumpCount: pumpCount ?? this.pumpCount,
      waterSource: waterSource ?? this.waterSource,
      waterUsage: waterUsage ?? this.waterUsage,
      waterBill: waterBill ?? this.waterBill,
      dailyPowerPump: dailyPowerPump ?? this.dailyPowerPump,
      annualPowerPump: annualPowerPump ?? this.annualPowerPump,
      appliances: appliances ?? this.appliances,
      heavyAppliances: heavyAppliances ?? this.heavyAppliances,
      vehicles: vehicles ?? this.vehicles,
      supabaseId: supabaseId ?? this.supabaseId,
      userId: userId ?? this.userId,
      isUploaded: isUploaded ?? this.isUploaded,
      isUploading: isUploading ?? this.isUploading,
      completionTime: completionTime ?? this.completionTime,
    );
  }

  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    if (id.present) {
      map['id'] = drift.Variable<int>(id.value);
    }
    if (reportId.present) {
      map['report_id'] = drift.Variable<String>(reportId.value);
    }
    if (ownerName.present) {
      map['owner_name'] = drift.Variable<String>(ownerName.value);
    }
    if (houseName.present) {
      map['house_name'] = drift.Variable<String>(houseName.value);
    }
    if (mobileNumber.present) {
      map['mobile_number'] = drift.Variable<String>(mobileNumber.value);
    }
    if (consumerNo.present) {
      map['consumer_no'] = drift.Variable<String>(consumerNo.value);
    }
    if (section.present) {
      map['section'] = drift.Variable<String>(section.value);
    }
    if (ksebPostOffice.present) {
      map['kseb_post_office'] = drift.Variable<String>(ksebPostOffice.value);
    }
    if (pinCode.present) {
      map['pin_code'] = drift.Variable<String>(pinCode.value);
    }
    if (panchayath.present) {
      map['panchayath'] = drift.Variable<String>(panchayath.value);
    }
    if (biMonthlyConsumption.present) {
      map['bi_monthly_consumption'] = drift.Variable<String>(
        biMonthlyConsumption.value,
      );
    }
    if (biMonthlyBill.present) {
      map['bi_monthly_bill'] = drift.Variable<String>(biMonthlyBill.value);
    }
    if (memberCount.present) {
      map['member_count'] = drift.Variable<String>(memberCount.value);
    }
    if (daysUninhabited.present) {
      map['days_uninhabited'] = drift.Variable<String>(daysUninhabited.value);
    }
    if (hasSolarPlant.present) {
      map['has_solar_plant'] = drift.Variable<bool>(hasSolarPlant.value);
    }
    if (solarCapacity.present) {
      map['solar_capacity'] = drift.Variable<String>(solarCapacity.value);
    }
    if (tariffCategory.present) {
      map['tariff_category'] = drift.Variable<String>(tariffCategory.value);
    }
    if (connectedLoad.present) {
      map['connected_load'] = drift.Variable<String>(connectedLoad.value);
    }
    if (natureOfConnection.present) {
      map['nature_of_connection'] = drift.Variable<String>(
        natureOfConnection.value,
      );
    }
    if (houseBuildingType.present) {
      map['house_building_type'] = drift.Variable<String>(
        houseBuildingType.value,
      );
    }
    if (ownOrRental.present) {
      map['own_or_rental'] = drift.Variable<String>(ownOrRental.value);
    }
    if (noOfFloors.present) {
      map['no_of_floors'] = drift.Variable<String>(noOfFloors.value);
    }
    if (totalBuildingArea.present) {
      map['total_building_area'] = drift.Variable<String>(
        totalBuildingArea.value,
      );
    }
    if (typeOfEarthing.present) {
      map['type_of_earthing'] = drift.Variable<String>(typeOfEarthing.value);
    }
    if (controlSystems.present) {
      map['control_systems'] = drift.Variable<String>(controlSystems.value);
    }
    if (noOfMcbs.present) {
      map['no_of_mcbs'] = drift.Variable<String>(noOfMcbs.value);
    }
    if (typeOfEnergyMeter.present) {
      map['type_of_energy_meter'] = drift.Variable<String>(
        typeOfEnergyMeter.value,
      );
    }
    if (solarPlantType.present) {
      map['solar_plant_type'] = drift.Variable<String>(solarPlantType.value);
    }
    if (firewood.present) {
      map['firewood'] = drift.Variable<String>(firewood.value);
    }
    if (lpg.present) {
      map['lpg'] = drift.Variable<String>(lpg.value);
    }
    if (biogas.present) {
      map['biogas'] = drift.Variable<String>(biogas.value);
    }
    if (induction.present) {
      map['induction'] = drift.Variable<String>(induction.value);
    }
    if (otherFuel.present) {
      map['other_fuel'] = drift.Variable<String>(otherFuel.value);
    }
    if (tankCapacity.present) {
      map['tank_capacity'] = drift.Variable<String>(tankCapacity.value);
    }
    if (pumpCapacity.present) {
      map['pump_capacity'] = drift.Variable<String>(pumpCapacity.value);
    }
    if (fillingTime.present) {
      map['filling_time'] = drift.Variable<String>(fillingTime.value);
    }
    if (pumpCount.present) {
      map['pump_count'] = drift.Variable<String>(pumpCount.value);
    }
    if (waterSource.present) {
      map['water_source'] = drift.Variable<String>(waterSource.value);
    }
    if (waterUsage.present) {
      map['water_usage'] = drift.Variable<String>(waterUsage.value);
    }
    if (waterBill.present) {
      map['water_bill'] = drift.Variable<String>(waterBill.value);
    }
    if (dailyPowerPump.present) {
      map['daily_power_pump'] = drift.Variable<double>(dailyPowerPump.value);
    }
    if (annualPowerPump.present) {
      map['annual_power_pump'] = drift.Variable<double>(annualPowerPump.value);
    }
    if (appliances.present) {
      map['appliances'] = drift.Variable<String>(appliances.value);
    }
    if (heavyAppliances.present) {
      map['heavy_appliances'] = drift.Variable<String>(heavyAppliances.value);
    }
    if (vehicles.present) {
      map['vehicles'] = drift.Variable<String>(vehicles.value);
    }
    if (supabaseId.present) {
      map['supabase_id'] = drift.Variable<String>(supabaseId.value);
    }
    if (userId.present) {
      map['user_id'] = drift.Variable<String>(userId.value);
    }
    if (isUploaded.present) {
      map['is_uploaded'] = drift.Variable<bool>(isUploaded.value);
    }
    if (isUploading.present) {
      map['is_uploading'] = drift.Variable<bool>(isUploading.value);
    }
    if (completionTime.present) {
      map['completion_time'] = drift.Variable<DateTime>(completionTime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AuditsCompanion(')
          ..write('id: $id, ')
          ..write('reportId: $reportId, ')
          ..write('ownerName: $ownerName, ')
          ..write('houseName: $houseName, ')
          ..write('mobileNumber: $mobileNumber, ')
          ..write('consumerNo: $consumerNo, ')
          ..write('section: $section, ')
          ..write('ksebPostOffice: $ksebPostOffice, ')
          ..write('pinCode: $pinCode, ')
          ..write('panchayath: $panchayath, ')
          ..write('biMonthlyConsumption: $biMonthlyConsumption, ')
          ..write('biMonthlyBill: $biMonthlyBill, ')
          ..write('memberCount: $memberCount, ')
          ..write('daysUninhabited: $daysUninhabited, ')
          ..write('hasSolarPlant: $hasSolarPlant, ')
          ..write('solarCapacity: $solarCapacity, ')
          ..write('tariffCategory: $tariffCategory, ')
          ..write('connectedLoad: $connectedLoad, ')
          ..write('natureOfConnection: $natureOfConnection, ')
          ..write('houseBuildingType: $houseBuildingType, ')
          ..write('ownOrRental: $ownOrRental, ')
          ..write('noOfFloors: $noOfFloors, ')
          ..write('totalBuildingArea: $totalBuildingArea, ')
          ..write('typeOfEarthing: $typeOfEarthing, ')
          ..write('controlSystems: $controlSystems, ')
          ..write('noOfMcbs: $noOfMcbs, ')
          ..write('typeOfEnergyMeter: $typeOfEnergyMeter, ')
          ..write('solarPlantType: $solarPlantType, ')
          ..write('firewood: $firewood, ')
          ..write('lpg: $lpg, ')
          ..write('biogas: $biogas, ')
          ..write('induction: $induction, ')
          ..write('otherFuel: $otherFuel, ')
          ..write('tankCapacity: $tankCapacity, ')
          ..write('pumpCapacity: $pumpCapacity, ')
          ..write('fillingTime: $fillingTime, ')
          ..write('pumpCount: $pumpCount, ')
          ..write('waterSource: $waterSource, ')
          ..write('waterUsage: $waterUsage, ')
          ..write('waterBill: $waterBill, ')
          ..write('dailyPowerPump: $dailyPowerPump, ')
          ..write('annualPowerPump: $annualPowerPump, ')
          ..write('appliances: $appliances, ')
          ..write('heavyAppliances: $heavyAppliances, ')
          ..write('vehicles: $vehicles, ')
          ..write('supabaseId: $supabaseId, ')
          ..write('userId: $userId, ')
          ..write('isUploaded: $isUploaded, ')
          ..write('isUploading: $isUploading, ')
          ..write('completionTime: $completionTime')
          ..write(')'))
        .toString();
  }
}

abstract class _$MyDatabase extends drift.GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(e);
  $MyDatabaseManager get managers => $MyDatabaseManager(this);
  late final $AuditReportsTable auditReports = $AuditReportsTable(this);
  late final $AuditsTable audits = $AuditsTable(this);
  @override
  Iterable<drift.TableInfo<drift.Table, Object?>> get allTables =>
      allSchemaEntities.whereType<drift.TableInfo<drift.Table, Object?>>();
  @override
  List<drift.DatabaseSchemaEntity> get allSchemaEntities => [
    auditReports,
    audits,
  ];
}

typedef $$AuditReportsTableCreateCompanionBuilder =
    AuditReportsCompanion Function({
      required String id,
      required String userId,
      drift.Value<double?> totalCarbonFootprint,
      drift.Value<double?> electricityConsumption,
      drift.Value<double?> vehicleUsage,
      drift.Value<double?> gasAndOtherFuels,
      drift.Value<double?> wasteAndRecycling,
      drift.Value<double?> applianceCarbonFootprint,
      drift.Value<double?> heavyApplianceCarbonFootprint,
      drift.Value<double?> vehicleCarbonFootprint,
      drift.Value<String?> energySavingSuggestions,
      drift.Value<String?> energyEfficiencyImprovements,
      drift.Value<String?> renewableEnergyOpportunities,
      drift.Value<String?> estimatedAnnualSavings,
      drift.Value<String?> potentialInvestmentCost,
      drift.Value<String?> paybackPeriod,
      required DateTime createdAt,
      drift.Value<int> rowid,
    });
typedef $$AuditReportsTableUpdateCompanionBuilder =
    AuditReportsCompanion Function({
      drift.Value<String> id,
      drift.Value<String> userId,
      drift.Value<double?> totalCarbonFootprint,
      drift.Value<double?> electricityConsumption,
      drift.Value<double?> vehicleUsage,
      drift.Value<double?> gasAndOtherFuels,
      drift.Value<double?> wasteAndRecycling,
      drift.Value<double?> applianceCarbonFootprint,
      drift.Value<double?> heavyApplianceCarbonFootprint,
      drift.Value<double?> vehicleCarbonFootprint,
      drift.Value<String?> energySavingSuggestions,
      drift.Value<String?> energyEfficiencyImprovements,
      drift.Value<String?> renewableEnergyOpportunities,
      drift.Value<String?> estimatedAnnualSavings,
      drift.Value<String?> potentialInvestmentCost,
      drift.Value<String?> paybackPeriod,
      drift.Value<DateTime> createdAt,
      drift.Value<int> rowid,
    });

final class $$AuditReportsTableReferences
    extends
        drift.BaseReferences<_$MyDatabase, $AuditReportsTable, AuditReport> {
  $$AuditReportsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static drift.MultiTypedResultKey<$AuditsTable, List<Audit>> _auditsRefsTable(
    _$MyDatabase db,
  ) => drift.MultiTypedResultKey.fromTable(
    db.audits,
    aliasName: drift.$_aliasNameGenerator(
      db.auditReports.id,
      db.audits.reportId,
    ),
  );

  $$AuditsTableProcessedTableManager get auditsRefs {
    final manager = $$AuditsTableTableManager(
      $_db,
      $_db.audits,
    ).filter((f) => f.reportId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_auditsRefsTable($_db));
    return drift.ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$AuditReportsTableFilterComposer
    extends drift.Composer<_$MyDatabase, $AuditReportsTable> {
  $$AuditReportsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<double> get totalCarbonFootprint => $composableBuilder(
    column: $table.totalCarbonFootprint,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<double> get electricityConsumption => $composableBuilder(
    column: $table.electricityConsumption,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<double> get vehicleUsage => $composableBuilder(
    column: $table.vehicleUsage,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<double> get gasAndOtherFuels => $composableBuilder(
    column: $table.gasAndOtherFuels,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<double> get wasteAndRecycling => $composableBuilder(
    column: $table.wasteAndRecycling,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<double> get applianceCarbonFootprint =>
      $composableBuilder(
        column: $table.applianceCarbonFootprint,
        builder: (column) => drift.ColumnFilters(column),
      );

  drift.ColumnFilters<double> get heavyApplianceCarbonFootprint =>
      $composableBuilder(
        column: $table.heavyApplianceCarbonFootprint,
        builder: (column) => drift.ColumnFilters(column),
      );

  drift.ColumnFilters<double> get vehicleCarbonFootprint => $composableBuilder(
    column: $table.vehicleCarbonFootprint,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<String> get energySavingSuggestions => $composableBuilder(
    column: $table.energySavingSuggestions,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<String> get energyEfficiencyImprovements =>
      $composableBuilder(
        column: $table.energyEfficiencyImprovements,
        builder: (column) => drift.ColumnFilters(column),
      );

  drift.ColumnFilters<String> get renewableEnergyOpportunities =>
      $composableBuilder(
        column: $table.renewableEnergyOpportunities,
        builder: (column) => drift.ColumnFilters(column),
      );

  drift.ColumnFilters<String> get estimatedAnnualSavings => $composableBuilder(
    column: $table.estimatedAnnualSavings,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<String> get potentialInvestmentCost => $composableBuilder(
    column: $table.potentialInvestmentCost,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<String> get paybackPeriod => $composableBuilder(
    column: $table.paybackPeriod,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.Expression<bool> auditsRefs(
    drift.Expression<bool> Function($$AuditsTableFilterComposer f) f,
  ) {
    final $$AuditsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.audits,
      getReferencedColumn: (t) => t.reportId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AuditsTableFilterComposer(
            $db: $db,
            $table: $db.audits,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AuditReportsTableOrderingComposer
    extends drift.Composer<_$MyDatabase, $AuditReportsTable> {
  $$AuditReportsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<double> get totalCarbonFootprint => $composableBuilder(
    column: $table.totalCarbonFootprint,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<double> get electricityConsumption =>
      $composableBuilder(
        column: $table.electricityConsumption,
        builder: (column) => drift.ColumnOrderings(column),
      );

  drift.ColumnOrderings<double> get vehicleUsage => $composableBuilder(
    column: $table.vehicleUsage,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<double> get gasAndOtherFuels => $composableBuilder(
    column: $table.gasAndOtherFuels,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<double> get wasteAndRecycling => $composableBuilder(
    column: $table.wasteAndRecycling,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<double> get applianceCarbonFootprint =>
      $composableBuilder(
        column: $table.applianceCarbonFootprint,
        builder: (column) => drift.ColumnOrderings(column),
      );

  drift.ColumnOrderings<double> get heavyApplianceCarbonFootprint =>
      $composableBuilder(
        column: $table.heavyApplianceCarbonFootprint,
        builder: (column) => drift.ColumnOrderings(column),
      );

  drift.ColumnOrderings<double> get vehicleCarbonFootprint =>
      $composableBuilder(
        column: $table.vehicleCarbonFootprint,
        builder: (column) => drift.ColumnOrderings(column),
      );

  drift.ColumnOrderings<String> get energySavingSuggestions =>
      $composableBuilder(
        column: $table.energySavingSuggestions,
        builder: (column) => drift.ColumnOrderings(column),
      );

  drift.ColumnOrderings<String> get energyEfficiencyImprovements =>
      $composableBuilder(
        column: $table.energyEfficiencyImprovements,
        builder: (column) => drift.ColumnOrderings(column),
      );

  drift.ColumnOrderings<String> get renewableEnergyOpportunities =>
      $composableBuilder(
        column: $table.renewableEnergyOpportunities,
        builder: (column) => drift.ColumnOrderings(column),
      );

  drift.ColumnOrderings<String> get estimatedAnnualSavings =>
      $composableBuilder(
        column: $table.estimatedAnnualSavings,
        builder: (column) => drift.ColumnOrderings(column),
      );

  drift.ColumnOrderings<String> get potentialInvestmentCost =>
      $composableBuilder(
        column: $table.potentialInvestmentCost,
        builder: (column) => drift.ColumnOrderings(column),
      );

  drift.ColumnOrderings<String> get paybackPeriod => $composableBuilder(
    column: $table.paybackPeriod,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => drift.ColumnOrderings(column),
  );
}

class $$AuditReportsTableAnnotationComposer
    extends drift.Composer<_$MyDatabase, $AuditReportsTable> {
  $$AuditReportsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  drift.GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  drift.GeneratedColumn<double> get totalCarbonFootprint => $composableBuilder(
    column: $table.totalCarbonFootprint,
    builder: (column) => column,
  );

  drift.GeneratedColumn<double> get electricityConsumption =>
      $composableBuilder(
        column: $table.electricityConsumption,
        builder: (column) => column,
      );

  drift.GeneratedColumn<double> get vehicleUsage => $composableBuilder(
    column: $table.vehicleUsage,
    builder: (column) => column,
  );

  drift.GeneratedColumn<double> get gasAndOtherFuels => $composableBuilder(
    column: $table.gasAndOtherFuels,
    builder: (column) => column,
  );

  drift.GeneratedColumn<double> get wasteAndRecycling => $composableBuilder(
    column: $table.wasteAndRecycling,
    builder: (column) => column,
  );

  drift.GeneratedColumn<double> get applianceCarbonFootprint =>
      $composableBuilder(
        column: $table.applianceCarbonFootprint,
        builder: (column) => column,
      );

  drift.GeneratedColumn<double> get heavyApplianceCarbonFootprint =>
      $composableBuilder(
        column: $table.heavyApplianceCarbonFootprint,
        builder: (column) => column,
      );

  drift.GeneratedColumn<double> get vehicleCarbonFootprint =>
      $composableBuilder(
        column: $table.vehicleCarbonFootprint,
        builder: (column) => column,
      );

  drift.GeneratedColumn<String> get energySavingSuggestions =>
      $composableBuilder(
        column: $table.energySavingSuggestions,
        builder: (column) => column,
      );

  drift.GeneratedColumn<String> get energyEfficiencyImprovements =>
      $composableBuilder(
        column: $table.energyEfficiencyImprovements,
        builder: (column) => column,
      );

  drift.GeneratedColumn<String> get renewableEnergyOpportunities =>
      $composableBuilder(
        column: $table.renewableEnergyOpportunities,
        builder: (column) => column,
      );

  drift.GeneratedColumn<String> get estimatedAnnualSavings =>
      $composableBuilder(
        column: $table.estimatedAnnualSavings,
        builder: (column) => column,
      );

  drift.GeneratedColumn<String> get potentialInvestmentCost =>
      $composableBuilder(
        column: $table.potentialInvestmentCost,
        builder: (column) => column,
      );

  drift.GeneratedColumn<String> get paybackPeriod => $composableBuilder(
    column: $table.paybackPeriod,
    builder: (column) => column,
  );

  drift.GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  drift.Expression<T> auditsRefs<T extends Object>(
    drift.Expression<T> Function($$AuditsTableAnnotationComposer a) f,
  ) {
    final $$AuditsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.audits,
      getReferencedColumn: (t) => t.reportId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AuditsTableAnnotationComposer(
            $db: $db,
            $table: $db.audits,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AuditReportsTableTableManager
    extends
        drift.RootTableManager<
          _$MyDatabase,
          $AuditReportsTable,
          AuditReport,
          $$AuditReportsTableFilterComposer,
          $$AuditReportsTableOrderingComposer,
          $$AuditReportsTableAnnotationComposer,
          $$AuditReportsTableCreateCompanionBuilder,
          $$AuditReportsTableUpdateCompanionBuilder,
          (AuditReport, $$AuditReportsTableReferences),
          AuditReport,
          drift.PrefetchHooks Function({bool auditsRefs})
        > {
  $$AuditReportsTableTableManager(_$MyDatabase db, $AuditReportsTable table)
    : super(
        drift.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AuditReportsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AuditReportsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AuditReportsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                drift.Value<String> id = const drift.Value.absent(),
                drift.Value<String> userId = const drift.Value.absent(),
                drift.Value<double?> totalCarbonFootprint =
                    const drift.Value.absent(),
                drift.Value<double?> electricityConsumption =
                    const drift.Value.absent(),
                drift.Value<double?> vehicleUsage = const drift.Value.absent(),
                drift.Value<double?> gasAndOtherFuels =
                    const drift.Value.absent(),
                drift.Value<double?> wasteAndRecycling =
                    const drift.Value.absent(),
                drift.Value<double?> applianceCarbonFootprint =
                    const drift.Value.absent(),
                drift.Value<double?> heavyApplianceCarbonFootprint =
                    const drift.Value.absent(),
                drift.Value<double?> vehicleCarbonFootprint =
                    const drift.Value.absent(),
                drift.Value<String?> energySavingSuggestions =
                    const drift.Value.absent(),
                drift.Value<String?> energyEfficiencyImprovements =
                    const drift.Value.absent(),
                drift.Value<String?> renewableEnergyOpportunities =
                    const drift.Value.absent(),
                drift.Value<String?> estimatedAnnualSavings =
                    const drift.Value.absent(),
                drift.Value<String?> potentialInvestmentCost =
                    const drift.Value.absent(),
                drift.Value<String?> paybackPeriod = const drift.Value.absent(),
                drift.Value<DateTime> createdAt = const drift.Value.absent(),
                drift.Value<int> rowid = const drift.Value.absent(),
              }) => AuditReportsCompanion(
                id: id,
                userId: userId,
                totalCarbonFootprint: totalCarbonFootprint,
                electricityConsumption: electricityConsumption,
                vehicleUsage: vehicleUsage,
                gasAndOtherFuels: gasAndOtherFuels,
                wasteAndRecycling: wasteAndRecycling,
                applianceCarbonFootprint: applianceCarbonFootprint,
                heavyApplianceCarbonFootprint: heavyApplianceCarbonFootprint,
                vehicleCarbonFootprint: vehicleCarbonFootprint,
                energySavingSuggestions: energySavingSuggestions,
                energyEfficiencyImprovements: energyEfficiencyImprovements,
                renewableEnergyOpportunities: renewableEnergyOpportunities,
                estimatedAnnualSavings: estimatedAnnualSavings,
                potentialInvestmentCost: potentialInvestmentCost,
                paybackPeriod: paybackPeriod,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String userId,
                drift.Value<double?> totalCarbonFootprint =
                    const drift.Value.absent(),
                drift.Value<double?> electricityConsumption =
                    const drift.Value.absent(),
                drift.Value<double?> vehicleUsage = const drift.Value.absent(),
                drift.Value<double?> gasAndOtherFuels =
                    const drift.Value.absent(),
                drift.Value<double?> wasteAndRecycling =
                    const drift.Value.absent(),
                drift.Value<double?> applianceCarbonFootprint =
                    const drift.Value.absent(),
                drift.Value<double?> heavyApplianceCarbonFootprint =
                    const drift.Value.absent(),
                drift.Value<double?> vehicleCarbonFootprint =
                    const drift.Value.absent(),
                drift.Value<String?> energySavingSuggestions =
                    const drift.Value.absent(),
                drift.Value<String?> energyEfficiencyImprovements =
                    const drift.Value.absent(),
                drift.Value<String?> renewableEnergyOpportunities =
                    const drift.Value.absent(),
                drift.Value<String?> estimatedAnnualSavings =
                    const drift.Value.absent(),
                drift.Value<String?> potentialInvestmentCost =
                    const drift.Value.absent(),
                drift.Value<String?> paybackPeriod = const drift.Value.absent(),
                required DateTime createdAt,
                drift.Value<int> rowid = const drift.Value.absent(),
              }) => AuditReportsCompanion.insert(
                id: id,
                userId: userId,
                totalCarbonFootprint: totalCarbonFootprint,
                electricityConsumption: electricityConsumption,
                vehicleUsage: vehicleUsage,
                gasAndOtherFuels: gasAndOtherFuels,
                wasteAndRecycling: wasteAndRecycling,
                applianceCarbonFootprint: applianceCarbonFootprint,
                heavyApplianceCarbonFootprint: heavyApplianceCarbonFootprint,
                vehicleCarbonFootprint: vehicleCarbonFootprint,
                energySavingSuggestions: energySavingSuggestions,
                energyEfficiencyImprovements: energyEfficiencyImprovements,
                renewableEnergyOpportunities: renewableEnergyOpportunities,
                estimatedAnnualSavings: estimatedAnnualSavings,
                potentialInvestmentCost: potentialInvestmentCost,
                paybackPeriod: paybackPeriod,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AuditReportsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({auditsRefs = false}) {
            return drift.PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (auditsRefs) db.audits],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (auditsRefs)
                    await drift.$_getPrefetchedData<
                      AuditReport,
                      $AuditReportsTable,
                      Audit
                    >(
                      currentTable: table,
                      referencedTable: $$AuditReportsTableReferences
                          ._auditsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$AuditReportsTableReferences(
                            db,
                            table,
                            p0,
                          ).auditsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.reportId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$AuditReportsTableProcessedTableManager =
    drift.ProcessedTableManager<
      _$MyDatabase,
      $AuditReportsTable,
      AuditReport,
      $$AuditReportsTableFilterComposer,
      $$AuditReportsTableOrderingComposer,
      $$AuditReportsTableAnnotationComposer,
      $$AuditReportsTableCreateCompanionBuilder,
      $$AuditReportsTableUpdateCompanionBuilder,
      (AuditReport, $$AuditReportsTableReferences),
      AuditReport,
      drift.PrefetchHooks Function({bool auditsRefs})
    >;
typedef $$AuditsTableCreateCompanionBuilder =
    AuditsCompanion Function({
      drift.Value<int> id,
      drift.Value<String?> reportId,
      drift.Value<String?> ownerName,
      drift.Value<String?> houseName,
      drift.Value<String?> mobileNumber,
      drift.Value<String?> consumerNo,
      drift.Value<String?> section,
      drift.Value<String?> ksebPostOffice,
      drift.Value<String?> pinCode,
      drift.Value<String?> panchayath,
      drift.Value<String?> biMonthlyConsumption,
      drift.Value<String?> biMonthlyBill,
      drift.Value<String?> memberCount,
      drift.Value<String?> daysUninhabited,
      drift.Value<bool?> hasSolarPlant,
      drift.Value<String?> solarCapacity,
      drift.Value<String?> tariffCategory,
      drift.Value<String?> connectedLoad,
      drift.Value<String?> natureOfConnection,
      drift.Value<String?> houseBuildingType,
      drift.Value<String?> ownOrRental,
      drift.Value<String?> noOfFloors,
      drift.Value<String?> totalBuildingArea,
      drift.Value<String?> typeOfEarthing,
      drift.Value<String?> controlSystems,
      drift.Value<String?> noOfMcbs,
      drift.Value<String?> typeOfEnergyMeter,
      drift.Value<String?> solarPlantType,
      drift.Value<String?> firewood,
      drift.Value<String?> lpg,
      drift.Value<String?> biogas,
      drift.Value<String?> induction,
      drift.Value<String?> otherFuel,
      drift.Value<String?> tankCapacity,
      drift.Value<String?> pumpCapacity,
      drift.Value<String?> fillingTime,
      drift.Value<String?> pumpCount,
      drift.Value<String?> waterSource,
      drift.Value<String?> waterUsage,
      drift.Value<String?> waterBill,
      drift.Value<double?> dailyPowerPump,
      drift.Value<double?> annualPowerPump,
      required String appliances,
      required String heavyAppliances,
      required String vehicles,
      drift.Value<String?> supabaseId,
      drift.Value<String?> userId,
      drift.Value<bool> isUploaded,
      drift.Value<bool> isUploading,
      drift.Value<DateTime?> completionTime,
    });
typedef $$AuditsTableUpdateCompanionBuilder =
    AuditsCompanion Function({
      drift.Value<int> id,
      drift.Value<String?> reportId,
      drift.Value<String?> ownerName,
      drift.Value<String?> houseName,
      drift.Value<String?> mobileNumber,
      drift.Value<String?> consumerNo,
      drift.Value<String?> section,
      drift.Value<String?> ksebPostOffice,
      drift.Value<String?> pinCode,
      drift.Value<String?> panchayath,
      drift.Value<String?> biMonthlyConsumption,
      drift.Value<String?> biMonthlyBill,
      drift.Value<String?> memberCount,
      drift.Value<String?> daysUninhabited,
      drift.Value<bool?> hasSolarPlant,
      drift.Value<String?> solarCapacity,
      drift.Value<String?> tariffCategory,
      drift.Value<String?> connectedLoad,
      drift.Value<String?> natureOfConnection,
      drift.Value<String?> houseBuildingType,
      drift.Value<String?> ownOrRental,
      drift.Value<String?> noOfFloors,
      drift.Value<String?> totalBuildingArea,
      drift.Value<String?> typeOfEarthing,
      drift.Value<String?> controlSystems,
      drift.Value<String?> noOfMcbs,
      drift.Value<String?> typeOfEnergyMeter,
      drift.Value<String?> solarPlantType,
      drift.Value<String?> firewood,
      drift.Value<String?> lpg,
      drift.Value<String?> biogas,
      drift.Value<String?> induction,
      drift.Value<String?> otherFuel,
      drift.Value<String?> tankCapacity,
      drift.Value<String?> pumpCapacity,
      drift.Value<String?> fillingTime,
      drift.Value<String?> pumpCount,
      drift.Value<String?> waterSource,
      drift.Value<String?> waterUsage,
      drift.Value<String?> waterBill,
      drift.Value<double?> dailyPowerPump,
      drift.Value<double?> annualPowerPump,
      drift.Value<String> appliances,
      drift.Value<String> heavyAppliances,
      drift.Value<String> vehicles,
      drift.Value<String?> supabaseId,
      drift.Value<String?> userId,
      drift.Value<bool> isUploaded,
      drift.Value<bool> isUploading,
      drift.Value<DateTime?> completionTime,
    });

final class $$AuditsTableReferences
    extends drift.BaseReferences<_$MyDatabase, $AuditsTable, Audit> {
  $$AuditsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $AuditReportsTable _reportIdTable(_$MyDatabase db) =>
      db.auditReports.createAlias(
        drift.$_aliasNameGenerator(db.audits.reportId, db.auditReports.id),
      );

  $$AuditReportsTableProcessedTableManager? get reportId {
    final $_column = $_itemColumn<String>('report_id');
    if ($_column == null) return null;
    final manager = $$AuditReportsTableTableManager(
      $_db,
      $_db.auditReports,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_reportIdTable($_db));
    if (item == null) return manager;
    return drift.ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$AuditsTableFilterComposer
    extends drift.Composer<_$MyDatabase, $AuditsTable> {
  $$AuditsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<String> get ownerName => $composableBuilder(
    column: $table.ownerName,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<String> get houseName => $composableBuilder(
    column: $table.houseName,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<String> get mobileNumber => $composableBuilder(
    column: $table.mobileNumber,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<String> get consumerNo => $composableBuilder(
    column: $table.consumerNo,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<String> get section => $composableBuilder(
    column: $table.section,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<String> get ksebPostOffice => $composableBuilder(
    column: $table.ksebPostOffice,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<String> get pinCode => $composableBuilder(
    column: $table.pinCode,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<String> get panchayath => $composableBuilder(
    column: $table.panchayath,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<String> get biMonthlyConsumption => $composableBuilder(
    column: $table.biMonthlyConsumption,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<String> get biMonthlyBill => $composableBuilder(
    column: $table.biMonthlyBill,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<String> get memberCount => $composableBuilder(
    column: $table.memberCount,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<String> get daysUninhabited => $composableBuilder(
    column: $table.daysUninhabited,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<bool> get hasSolarPlant => $composableBuilder(
    column: $table.hasSolarPlant,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<String> get solarCapacity => $composableBuilder(
    column: $table.solarCapacity,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<String> get tariffCategory => $composableBuilder(
    column: $table.tariffCategory,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<String> get connectedLoad => $composableBuilder(
    column: $table.connectedLoad,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<String> get natureOfConnection => $composableBuilder(
    column: $table.natureOfConnection,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<String> get houseBuildingType => $composableBuilder(
    column: $table.houseBuildingType,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<String> get ownOrRental => $composableBuilder(
    column: $table.ownOrRental,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<String> get noOfFloors => $composableBuilder(
    column: $table.noOfFloors,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<String> get totalBuildingArea => $composableBuilder(
    column: $table.totalBuildingArea,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<String> get typeOfEarthing => $composableBuilder(
    column: $table.typeOfEarthing,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<String> get controlSystems => $composableBuilder(
    column: $table.controlSystems,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<String> get noOfMcbs => $composableBuilder(
    column: $table.noOfMcbs,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<String> get typeOfEnergyMeter => $composableBuilder(
    column: $table.typeOfEnergyMeter,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<String> get solarPlantType => $composableBuilder(
    column: $table.solarPlantType,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<String> get firewood => $composableBuilder(
    column: $table.firewood,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<String> get lpg => $composableBuilder(
    column: $table.lpg,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<String> get biogas => $composableBuilder(
    column: $table.biogas,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<String> get induction => $composableBuilder(
    column: $table.induction,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<String> get otherFuel => $composableBuilder(
    column: $table.otherFuel,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<String> get tankCapacity => $composableBuilder(
    column: $table.tankCapacity,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<String> get pumpCapacity => $composableBuilder(
    column: $table.pumpCapacity,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<String> get fillingTime => $composableBuilder(
    column: $table.fillingTime,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<String> get pumpCount => $composableBuilder(
    column: $table.pumpCount,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<String> get waterSource => $composableBuilder(
    column: $table.waterSource,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<String> get waterUsage => $composableBuilder(
    column: $table.waterUsage,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<String> get waterBill => $composableBuilder(
    column: $table.waterBill,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<double> get dailyPowerPump => $composableBuilder(
    column: $table.dailyPowerPump,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<double> get annualPowerPump => $composableBuilder(
    column: $table.annualPowerPump,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<String> get appliances => $composableBuilder(
    column: $table.appliances,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<String> get heavyAppliances => $composableBuilder(
    column: $table.heavyAppliances,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<String> get vehicles => $composableBuilder(
    column: $table.vehicles,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<String> get supabaseId => $composableBuilder(
    column: $table.supabaseId,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<bool> get isUploaded => $composableBuilder(
    column: $table.isUploaded,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<bool> get isUploading => $composableBuilder(
    column: $table.isUploading,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<DateTime> get completionTime => $composableBuilder(
    column: $table.completionTime,
    builder: (column) => drift.ColumnFilters(column),
  );

  $$AuditReportsTableFilterComposer get reportId {
    final $$AuditReportsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.reportId,
      referencedTable: $db.auditReports,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AuditReportsTableFilterComposer(
            $db: $db,
            $table: $db.auditReports,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AuditsTableOrderingComposer
    extends drift.Composer<_$MyDatabase, $AuditsTable> {
  $$AuditsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<String> get ownerName => $composableBuilder(
    column: $table.ownerName,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<String> get houseName => $composableBuilder(
    column: $table.houseName,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<String> get mobileNumber => $composableBuilder(
    column: $table.mobileNumber,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<String> get consumerNo => $composableBuilder(
    column: $table.consumerNo,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<String> get section => $composableBuilder(
    column: $table.section,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<String> get ksebPostOffice => $composableBuilder(
    column: $table.ksebPostOffice,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<String> get pinCode => $composableBuilder(
    column: $table.pinCode,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<String> get panchayath => $composableBuilder(
    column: $table.panchayath,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<String> get biMonthlyConsumption => $composableBuilder(
    column: $table.biMonthlyConsumption,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<String> get biMonthlyBill => $composableBuilder(
    column: $table.biMonthlyBill,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<String> get memberCount => $composableBuilder(
    column: $table.memberCount,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<String> get daysUninhabited => $composableBuilder(
    column: $table.daysUninhabited,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<bool> get hasSolarPlant => $composableBuilder(
    column: $table.hasSolarPlant,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<String> get solarCapacity => $composableBuilder(
    column: $table.solarCapacity,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<String> get tariffCategory => $composableBuilder(
    column: $table.tariffCategory,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<String> get connectedLoad => $composableBuilder(
    column: $table.connectedLoad,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<String> get natureOfConnection => $composableBuilder(
    column: $table.natureOfConnection,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<String> get houseBuildingType => $composableBuilder(
    column: $table.houseBuildingType,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<String> get ownOrRental => $composableBuilder(
    column: $table.ownOrRental,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<String> get noOfFloors => $composableBuilder(
    column: $table.noOfFloors,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<String> get totalBuildingArea => $composableBuilder(
    column: $table.totalBuildingArea,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<String> get typeOfEarthing => $composableBuilder(
    column: $table.typeOfEarthing,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<String> get controlSystems => $composableBuilder(
    column: $table.controlSystems,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<String> get noOfMcbs => $composableBuilder(
    column: $table.noOfMcbs,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<String> get typeOfEnergyMeter => $composableBuilder(
    column: $table.typeOfEnergyMeter,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<String> get solarPlantType => $composableBuilder(
    column: $table.solarPlantType,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<String> get firewood => $composableBuilder(
    column: $table.firewood,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<String> get lpg => $composableBuilder(
    column: $table.lpg,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<String> get biogas => $composableBuilder(
    column: $table.biogas,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<String> get induction => $composableBuilder(
    column: $table.induction,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<String> get otherFuel => $composableBuilder(
    column: $table.otherFuel,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<String> get tankCapacity => $composableBuilder(
    column: $table.tankCapacity,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<String> get pumpCapacity => $composableBuilder(
    column: $table.pumpCapacity,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<String> get fillingTime => $composableBuilder(
    column: $table.fillingTime,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<String> get pumpCount => $composableBuilder(
    column: $table.pumpCount,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<String> get waterSource => $composableBuilder(
    column: $table.waterSource,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<String> get waterUsage => $composableBuilder(
    column: $table.waterUsage,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<String> get waterBill => $composableBuilder(
    column: $table.waterBill,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<double> get dailyPowerPump => $composableBuilder(
    column: $table.dailyPowerPump,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<double> get annualPowerPump => $composableBuilder(
    column: $table.annualPowerPump,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<String> get appliances => $composableBuilder(
    column: $table.appliances,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<String> get heavyAppliances => $composableBuilder(
    column: $table.heavyAppliances,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<String> get vehicles => $composableBuilder(
    column: $table.vehicles,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<String> get supabaseId => $composableBuilder(
    column: $table.supabaseId,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<bool> get isUploaded => $composableBuilder(
    column: $table.isUploaded,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<bool> get isUploading => $composableBuilder(
    column: $table.isUploading,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<DateTime> get completionTime => $composableBuilder(
    column: $table.completionTime,
    builder: (column) => drift.ColumnOrderings(column),
  );

  $$AuditReportsTableOrderingComposer get reportId {
    final $$AuditReportsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.reportId,
      referencedTable: $db.auditReports,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AuditReportsTableOrderingComposer(
            $db: $db,
            $table: $db.auditReports,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AuditsTableAnnotationComposer
    extends drift.Composer<_$MyDatabase, $AuditsTable> {
  $$AuditsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  drift.GeneratedColumn<String> get ownerName =>
      $composableBuilder(column: $table.ownerName, builder: (column) => column);

  drift.GeneratedColumn<String> get houseName =>
      $composableBuilder(column: $table.houseName, builder: (column) => column);

  drift.GeneratedColumn<String> get mobileNumber => $composableBuilder(
    column: $table.mobileNumber,
    builder: (column) => column,
  );

  drift.GeneratedColumn<String> get consumerNo => $composableBuilder(
    column: $table.consumerNo,
    builder: (column) => column,
  );

  drift.GeneratedColumn<String> get section =>
      $composableBuilder(column: $table.section, builder: (column) => column);

  drift.GeneratedColumn<String> get ksebPostOffice => $composableBuilder(
    column: $table.ksebPostOffice,
    builder: (column) => column,
  );

  drift.GeneratedColumn<String> get pinCode =>
      $composableBuilder(column: $table.pinCode, builder: (column) => column);

  drift.GeneratedColumn<String> get panchayath => $composableBuilder(
    column: $table.panchayath,
    builder: (column) => column,
  );

  drift.GeneratedColumn<String> get biMonthlyConsumption => $composableBuilder(
    column: $table.biMonthlyConsumption,
    builder: (column) => column,
  );

  drift.GeneratedColumn<String> get biMonthlyBill => $composableBuilder(
    column: $table.biMonthlyBill,
    builder: (column) => column,
  );

  drift.GeneratedColumn<String> get memberCount => $composableBuilder(
    column: $table.memberCount,
    builder: (column) => column,
  );

  drift.GeneratedColumn<String> get daysUninhabited => $composableBuilder(
    column: $table.daysUninhabited,
    builder: (column) => column,
  );

  drift.GeneratedColumn<bool> get hasSolarPlant => $composableBuilder(
    column: $table.hasSolarPlant,
    builder: (column) => column,
  );

  drift.GeneratedColumn<String> get solarCapacity => $composableBuilder(
    column: $table.solarCapacity,
    builder: (column) => column,
  );

  drift.GeneratedColumn<String> get tariffCategory => $composableBuilder(
    column: $table.tariffCategory,
    builder: (column) => column,
  );

  drift.GeneratedColumn<String> get connectedLoad => $composableBuilder(
    column: $table.connectedLoad,
    builder: (column) => column,
  );

  drift.GeneratedColumn<String> get natureOfConnection => $composableBuilder(
    column: $table.natureOfConnection,
    builder: (column) => column,
  );

  drift.GeneratedColumn<String> get houseBuildingType => $composableBuilder(
    column: $table.houseBuildingType,
    builder: (column) => column,
  );

  drift.GeneratedColumn<String> get ownOrRental => $composableBuilder(
    column: $table.ownOrRental,
    builder: (column) => column,
  );

  drift.GeneratedColumn<String> get noOfFloors => $composableBuilder(
    column: $table.noOfFloors,
    builder: (column) => column,
  );

  drift.GeneratedColumn<String> get totalBuildingArea => $composableBuilder(
    column: $table.totalBuildingArea,
    builder: (column) => column,
  );

  drift.GeneratedColumn<String> get typeOfEarthing => $composableBuilder(
    column: $table.typeOfEarthing,
    builder: (column) => column,
  );

  drift.GeneratedColumn<String> get controlSystems => $composableBuilder(
    column: $table.controlSystems,
    builder: (column) => column,
  );

  drift.GeneratedColumn<String> get noOfMcbs =>
      $composableBuilder(column: $table.noOfMcbs, builder: (column) => column);

  drift.GeneratedColumn<String> get typeOfEnergyMeter => $composableBuilder(
    column: $table.typeOfEnergyMeter,
    builder: (column) => column,
  );

  drift.GeneratedColumn<String> get solarPlantType => $composableBuilder(
    column: $table.solarPlantType,
    builder: (column) => column,
  );

  drift.GeneratedColumn<String> get firewood =>
      $composableBuilder(column: $table.firewood, builder: (column) => column);

  drift.GeneratedColumn<String> get lpg =>
      $composableBuilder(column: $table.lpg, builder: (column) => column);

  drift.GeneratedColumn<String> get biogas =>
      $composableBuilder(column: $table.biogas, builder: (column) => column);

  drift.GeneratedColumn<String> get induction =>
      $composableBuilder(column: $table.induction, builder: (column) => column);

  drift.GeneratedColumn<String> get otherFuel =>
      $composableBuilder(column: $table.otherFuel, builder: (column) => column);

  drift.GeneratedColumn<String> get tankCapacity => $composableBuilder(
    column: $table.tankCapacity,
    builder: (column) => column,
  );

  drift.GeneratedColumn<String> get pumpCapacity => $composableBuilder(
    column: $table.pumpCapacity,
    builder: (column) => column,
  );

  drift.GeneratedColumn<String> get fillingTime => $composableBuilder(
    column: $table.fillingTime,
    builder: (column) => column,
  );

  drift.GeneratedColumn<String> get pumpCount =>
      $composableBuilder(column: $table.pumpCount, builder: (column) => column);

  drift.GeneratedColumn<String> get waterSource => $composableBuilder(
    column: $table.waterSource,
    builder: (column) => column,
  );

  drift.GeneratedColumn<String> get waterUsage => $composableBuilder(
    column: $table.waterUsage,
    builder: (column) => column,
  );

  drift.GeneratedColumn<String> get waterBill =>
      $composableBuilder(column: $table.waterBill, builder: (column) => column);

  drift.GeneratedColumn<double> get dailyPowerPump => $composableBuilder(
    column: $table.dailyPowerPump,
    builder: (column) => column,
  );

  drift.GeneratedColumn<double> get annualPowerPump => $composableBuilder(
    column: $table.annualPowerPump,
    builder: (column) => column,
  );

  drift.GeneratedColumn<String> get appliances => $composableBuilder(
    column: $table.appliances,
    builder: (column) => column,
  );

  drift.GeneratedColumn<String> get heavyAppliances => $composableBuilder(
    column: $table.heavyAppliances,
    builder: (column) => column,
  );

  drift.GeneratedColumn<String> get vehicles =>
      $composableBuilder(column: $table.vehicles, builder: (column) => column);

  drift.GeneratedColumn<String> get supabaseId => $composableBuilder(
    column: $table.supabaseId,
    builder: (column) => column,
  );

  drift.GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  drift.GeneratedColumn<bool> get isUploaded => $composableBuilder(
    column: $table.isUploaded,
    builder: (column) => column,
  );

  drift.GeneratedColumn<bool> get isUploading => $composableBuilder(
    column: $table.isUploading,
    builder: (column) => column,
  );

  drift.GeneratedColumn<DateTime> get completionTime => $composableBuilder(
    column: $table.completionTime,
    builder: (column) => column,
  );

  $$AuditReportsTableAnnotationComposer get reportId {
    final $$AuditReportsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.reportId,
      referencedTable: $db.auditReports,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AuditReportsTableAnnotationComposer(
            $db: $db,
            $table: $db.auditReports,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AuditsTableTableManager
    extends
        drift.RootTableManager<
          _$MyDatabase,
          $AuditsTable,
          Audit,
          $$AuditsTableFilterComposer,
          $$AuditsTableOrderingComposer,
          $$AuditsTableAnnotationComposer,
          $$AuditsTableCreateCompanionBuilder,
          $$AuditsTableUpdateCompanionBuilder,
          (Audit, $$AuditsTableReferences),
          Audit,
          drift.PrefetchHooks Function({bool reportId})
        > {
  $$AuditsTableTableManager(_$MyDatabase db, $AuditsTable table)
    : super(
        drift.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AuditsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AuditsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AuditsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                drift.Value<int> id = const drift.Value.absent(),
                drift.Value<String?> reportId = const drift.Value.absent(),
                drift.Value<String?> ownerName = const drift.Value.absent(),
                drift.Value<String?> houseName = const drift.Value.absent(),
                drift.Value<String?> mobileNumber = const drift.Value.absent(),
                drift.Value<String?> consumerNo = const drift.Value.absent(),
                drift.Value<String?> section = const drift.Value.absent(),
                drift.Value<String?> ksebPostOffice =
                    const drift.Value.absent(),
                drift.Value<String?> pinCode = const drift.Value.absent(),
                drift.Value<String?> panchayath = const drift.Value.absent(),
                drift.Value<String?> biMonthlyConsumption =
                    const drift.Value.absent(),
                drift.Value<String?> biMonthlyBill = const drift.Value.absent(),
                drift.Value<String?> memberCount = const drift.Value.absent(),
                drift.Value<String?> daysUninhabited =
                    const drift.Value.absent(),
                drift.Value<bool?> hasSolarPlant = const drift.Value.absent(),
                drift.Value<String?> solarCapacity = const drift.Value.absent(),
                drift.Value<String?> tariffCategory =
                    const drift.Value.absent(),
                drift.Value<String?> connectedLoad = const drift.Value.absent(),
                drift.Value<String?> natureOfConnection =
                    const drift.Value.absent(),
                drift.Value<String?> houseBuildingType =
                    const drift.Value.absent(),
                drift.Value<String?> ownOrRental = const drift.Value.absent(),
                drift.Value<String?> noOfFloors = const drift.Value.absent(),
                drift.Value<String?> totalBuildingArea =
                    const drift.Value.absent(),
                drift.Value<String?> typeOfEarthing =
                    const drift.Value.absent(),
                drift.Value<String?> controlSystems =
                    const drift.Value.absent(),
                drift.Value<String?> noOfMcbs = const drift.Value.absent(),
                drift.Value<String?> typeOfEnergyMeter =
                    const drift.Value.absent(),
                drift.Value<String?> solarPlantType =
                    const drift.Value.absent(),
                drift.Value<String?> firewood = const drift.Value.absent(),
                drift.Value<String?> lpg = const drift.Value.absent(),
                drift.Value<String?> biogas = const drift.Value.absent(),
                drift.Value<String?> induction = const drift.Value.absent(),
                drift.Value<String?> otherFuel = const drift.Value.absent(),
                drift.Value<String?> tankCapacity = const drift.Value.absent(),
                drift.Value<String?> pumpCapacity = const drift.Value.absent(),
                drift.Value<String?> fillingTime = const drift.Value.absent(),
                drift.Value<String?> pumpCount = const drift.Value.absent(),
                drift.Value<String?> waterSource = const drift.Value.absent(),
                drift.Value<String?> waterUsage = const drift.Value.absent(),
                drift.Value<String?> waterBill = const drift.Value.absent(),
                drift.Value<double?> dailyPowerPump =
                    const drift.Value.absent(),
                drift.Value<double?> annualPowerPump =
                    const drift.Value.absent(),
                drift.Value<String> appliances = const drift.Value.absent(),
                drift.Value<String> heavyAppliances =
                    const drift.Value.absent(),
                drift.Value<String> vehicles = const drift.Value.absent(),
                drift.Value<String?> supabaseId = const drift.Value.absent(),
                drift.Value<String?> userId = const drift.Value.absent(),
                drift.Value<bool> isUploaded = const drift.Value.absent(),
                drift.Value<bool> isUploading = const drift.Value.absent(),
                drift.Value<DateTime?> completionTime =
                    const drift.Value.absent(),
              }) => AuditsCompanion(
                id: id,
                reportId: reportId,
                ownerName: ownerName,
                houseName: houseName,
                mobileNumber: mobileNumber,
                consumerNo: consumerNo,
                section: section,
                ksebPostOffice: ksebPostOffice,
                pinCode: pinCode,
                panchayath: panchayath,
                biMonthlyConsumption: biMonthlyConsumption,
                biMonthlyBill: biMonthlyBill,
                memberCount: memberCount,
                daysUninhabited: daysUninhabited,
                hasSolarPlant: hasSolarPlant,
                solarCapacity: solarCapacity,
                tariffCategory: tariffCategory,
                connectedLoad: connectedLoad,
                natureOfConnection: natureOfConnection,
                houseBuildingType: houseBuildingType,
                ownOrRental: ownOrRental,
                noOfFloors: noOfFloors,
                totalBuildingArea: totalBuildingArea,
                typeOfEarthing: typeOfEarthing,
                controlSystems: controlSystems,
                noOfMcbs: noOfMcbs,
                typeOfEnergyMeter: typeOfEnergyMeter,
                solarPlantType: solarPlantType,
                firewood: firewood,
                lpg: lpg,
                biogas: biogas,
                induction: induction,
                otherFuel: otherFuel,
                tankCapacity: tankCapacity,
                pumpCapacity: pumpCapacity,
                fillingTime: fillingTime,
                pumpCount: pumpCount,
                waterSource: waterSource,
                waterUsage: waterUsage,
                waterBill: waterBill,
                dailyPowerPump: dailyPowerPump,
                annualPowerPump: annualPowerPump,
                appliances: appliances,
                heavyAppliances: heavyAppliances,
                vehicles: vehicles,
                supabaseId: supabaseId,
                userId: userId,
                isUploaded: isUploaded,
                isUploading: isUploading,
                completionTime: completionTime,
              ),
          createCompanionCallback:
              ({
                drift.Value<int> id = const drift.Value.absent(),
                drift.Value<String?> reportId = const drift.Value.absent(),
                drift.Value<String?> ownerName = const drift.Value.absent(),
                drift.Value<String?> houseName = const drift.Value.absent(),
                drift.Value<String?> mobileNumber = const drift.Value.absent(),
                drift.Value<String?> consumerNo = const drift.Value.absent(),
                drift.Value<String?> section = const drift.Value.absent(),
                drift.Value<String?> ksebPostOffice =
                    const drift.Value.absent(),
                drift.Value<String?> pinCode = const drift.Value.absent(),
                drift.Value<String?> panchayath = const drift.Value.absent(),
                drift.Value<String?> biMonthlyConsumption =
                    const drift.Value.absent(),
                drift.Value<String?> biMonthlyBill = const drift.Value.absent(),
                drift.Value<String?> memberCount = const drift.Value.absent(),
                drift.Value<String?> daysUninhabited =
                    const drift.Value.absent(),
                drift.Value<bool?> hasSolarPlant = const drift.Value.absent(),
                drift.Value<String?> solarCapacity = const drift.Value.absent(),
                drift.Value<String?> tariffCategory =
                    const drift.Value.absent(),
                drift.Value<String?> connectedLoad = const drift.Value.absent(),
                drift.Value<String?> natureOfConnection =
                    const drift.Value.absent(),
                drift.Value<String?> houseBuildingType =
                    const drift.Value.absent(),
                drift.Value<String?> ownOrRental = const drift.Value.absent(),
                drift.Value<String?> noOfFloors = const drift.Value.absent(),
                drift.Value<String?> totalBuildingArea =
                    const drift.Value.absent(),
                drift.Value<String?> typeOfEarthing =
                    const drift.Value.absent(),
                drift.Value<String?> controlSystems =
                    const drift.Value.absent(),
                drift.Value<String?> noOfMcbs = const drift.Value.absent(),
                drift.Value<String?> typeOfEnergyMeter =
                    const drift.Value.absent(),
                drift.Value<String?> solarPlantType =
                    const drift.Value.absent(),
                drift.Value<String?> firewood = const drift.Value.absent(),
                drift.Value<String?> lpg = const drift.Value.absent(),
                drift.Value<String?> biogas = const drift.Value.absent(),
                drift.Value<String?> induction = const drift.Value.absent(),
                drift.Value<String?> otherFuel = const drift.Value.absent(),
                drift.Value<String?> tankCapacity = const drift.Value.absent(),
                drift.Value<String?> pumpCapacity = const drift.Value.absent(),
                drift.Value<String?> fillingTime = const drift.Value.absent(),
                drift.Value<String?> pumpCount = const drift.Value.absent(),
                drift.Value<String?> waterSource = const drift.Value.absent(),
                drift.Value<String?> waterUsage = const drift.Value.absent(),
                drift.Value<String?> waterBill = const drift.Value.absent(),
                drift.Value<double?> dailyPowerPump =
                    const drift.Value.absent(),
                drift.Value<double?> annualPowerPump =
                    const drift.Value.absent(),
                required String appliances,
                required String heavyAppliances,
                required String vehicles,
                drift.Value<String?> supabaseId = const drift.Value.absent(),
                drift.Value<String?> userId = const drift.Value.absent(),
                drift.Value<bool> isUploaded = const drift.Value.absent(),
                drift.Value<bool> isUploading = const drift.Value.absent(),
                drift.Value<DateTime?> completionTime =
                    const drift.Value.absent(),
              }) => AuditsCompanion.insert(
                id: id,
                reportId: reportId,
                ownerName: ownerName,
                houseName: houseName,
                mobileNumber: mobileNumber,
                consumerNo: consumerNo,
                section: section,
                ksebPostOffice: ksebPostOffice,
                pinCode: pinCode,
                panchayath: panchayath,
                biMonthlyConsumption: biMonthlyConsumption,
                biMonthlyBill: biMonthlyBill,
                memberCount: memberCount,
                daysUninhabited: daysUninhabited,
                hasSolarPlant: hasSolarPlant,
                solarCapacity: solarCapacity,
                tariffCategory: tariffCategory,
                connectedLoad: connectedLoad,
                natureOfConnection: natureOfConnection,
                houseBuildingType: houseBuildingType,
                ownOrRental: ownOrRental,
                noOfFloors: noOfFloors,
                totalBuildingArea: totalBuildingArea,
                typeOfEarthing: typeOfEarthing,
                controlSystems: controlSystems,
                noOfMcbs: noOfMcbs,
                typeOfEnergyMeter: typeOfEnergyMeter,
                solarPlantType: solarPlantType,
                firewood: firewood,
                lpg: lpg,
                biogas: biogas,
                induction: induction,
                otherFuel: otherFuel,
                tankCapacity: tankCapacity,
                pumpCapacity: pumpCapacity,
                fillingTime: fillingTime,
                pumpCount: pumpCount,
                waterSource: waterSource,
                waterUsage: waterUsage,
                waterBill: waterBill,
                dailyPowerPump: dailyPowerPump,
                annualPowerPump: annualPowerPump,
                appliances: appliances,
                heavyAppliances: heavyAppliances,
                vehicles: vehicles,
                supabaseId: supabaseId,
                userId: userId,
                isUploaded: isUploaded,
                isUploading: isUploading,
                completionTime: completionTime,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$AuditsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({reportId = false}) {
            return drift.PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends drift.TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (reportId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.reportId,
                                referencedTable: $$AuditsTableReferences
                                    ._reportIdTable(db),
                                referencedColumn: $$AuditsTableReferences
                                    ._reportIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$AuditsTableProcessedTableManager =
    drift.ProcessedTableManager<
      _$MyDatabase,
      $AuditsTable,
      Audit,
      $$AuditsTableFilterComposer,
      $$AuditsTableOrderingComposer,
      $$AuditsTableAnnotationComposer,
      $$AuditsTableCreateCompanionBuilder,
      $$AuditsTableUpdateCompanionBuilder,
      (Audit, $$AuditsTableReferences),
      Audit,
      drift.PrefetchHooks Function({bool reportId})
    >;

class $MyDatabaseManager {
  final _$MyDatabase _db;
  $MyDatabaseManager(this._db);
  $$AuditReportsTableTableManager get auditReports =>
      $$AuditReportsTableTableManager(_db, _db.auditReports);
  $$AuditsTableTableManager get audits =>
      $$AuditsTableTableManager(_db, _db.audits);
}
