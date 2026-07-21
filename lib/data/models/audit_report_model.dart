class AuditReportModel {
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
  final List<Map<String, dynamic>>? energySavingSuggestions;
  final List<Map<String, dynamic>>? energyEfficiencyImprovements;
  final List<Map<String, dynamic>>? renewableEnergyOpportunities;
  final dynamic estimatedAnnualSavings;
  final dynamic potentialInvestmentCost;
  final dynamic paybackPeriod;
  final DateTime createdAt;

  AuditReportModel({
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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'total_carbon_footprint': totalCarbonFootprint,
      'electricity_consumption': electricityConsumption,
      'vehicle_usage': vehicleUsage,
      'gas_and_other_fuels': gasAndOtherFuels,
      'waste_and_recycling': wasteAndRecycling,
      'appliance_carbon_footprint': applianceCarbonFootprint,
      'heavy_appliance_carbon_footprint': heavyApplianceCarbonFootprint,
      'vehicle_carbon_footprint': vehicleCarbonFootprint,
      'energy_saving_suggestions': energySavingSuggestions,
      'energy_efficiency_improvements': energyEfficiencyImprovements,
      'renewable_energy_opportunities': renewableEnergyOpportunities,
      'estimated_annual_savings': estimatedAnnualSavings,
      'potential_investment_cost': potentialInvestmentCost,
      'payback_period': paybackPeriod,
      'created_at': createdAt.toIso8601String(),
    };
  }

  factory AuditReportModel.fromJson(Map<String, dynamic> map) {
    return AuditReportModel(
      id: map['id'],
      userId: map['user_id'],
      totalCarbonFootprint: map['total_carbon_footprint'],
      electricityConsumption: map['electricity_consumption'],
      vehicleUsage: map['vehicle_usage'],
      gasAndOtherFuels: map['gas_and_other_fuels'],
      wasteAndRecycling: map['waste_and_recycling'],
      applianceCarbonFootprint: map['appliance_carbon_footprint'],
      heavyApplianceCarbonFootprint: map['heavy_appliance_carbon_footprint'],
      vehicleCarbonFootprint: map['vehicle_carbon_footprint'],
      energySavingSuggestions: List<Map<String, dynamic>>.from(
        map['energy_saving_suggestions'] ?? [],
      ),
      energyEfficiencyImprovements: List<Map<String, dynamic>>.from(
        map['energy_efficiency_improvements'] ?? [],
      ),
      renewableEnergyOpportunities: List<Map<String, dynamic>>.from(
        map['renewable_energy_opportunities'] ?? [],
      ),
      estimatedAnnualSavings: map['estimated_annual_savings'],
      potentialInvestmentCost: map['potential_investment_cost'],
      paybackPeriod: map['payback_period'],
      createdAt: DateTime.parse(map['created_at']),
    );
  }
}
