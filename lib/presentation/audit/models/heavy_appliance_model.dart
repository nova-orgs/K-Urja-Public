class HeavyApplianceModel {
  String capacity;
  String starRating;
  String daysUsed;
  String hoursUsed;
  String count;
  String wattage;

  // NEW FIELDS
  String tips;
  String savingWatts;
  String investmentCost;

  HeavyApplianceModel({
    this.capacity = '',
    this.starRating = '3',
    this.daysUsed = '365',
    this.hoursUsed = '0',
    this.count = '1',
    this.wattage = '',
    this.tips = '',
    this.savingWatts = '',
    this.investmentCost = '',
  });

  Map<String, dynamic> toJson() {
    return {
      'capacity': capacity,
      'starRating': starRating,
      'daysUsed': daysUsed,
      'hoursUsed': hoursUsed,
      'count': count,
      'wattage': wattage,
      'tips': tips,
      'savingWatts': savingWatts,
      'investmentCost': investmentCost,
    };
  }

  factory HeavyApplianceModel.fromJson(Map<String, dynamic> json) {
    return HeavyApplianceModel(
      capacity: json['capacity']?.toString() ?? '',
      starRating: json['starRating']?.toString() ?? '3',
      daysUsed: json['daysUsed']?.toString() ?? '365',
      hoursUsed: json['hoursUsed']?.toString() ?? '0',
      count: json['count']?.toString() ?? '1',
      wattage: json['wattage']?.toString() ?? '',
      tips: json['tips']?.toString() ?? '',
      savingWatts: json['savingWatts']?.toString() ?? '',
      investmentCost: json['investmentCost']?.toString() ?? '',
    );
  }
}
