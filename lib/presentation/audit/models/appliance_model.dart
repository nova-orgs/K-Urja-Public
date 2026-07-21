class ApplianceModel {
  String name;
  String watts;
  String hours;
  String count;
  // Suggestions
  String tips;
  String savingWatts; // NEW
  String investmentCost; // NEW

  ApplianceModel({
    this.name = '',
    this.watts = '',
    this.hours = '',
    this.count = '1',
    this.tips = '',
    this.savingWatts = '', // Default empty
    this.investmentCost = '', // Default empty
  });

  factory ApplianceModel.fromJson(Map<String, dynamic> json) {
    return ApplianceModel(
      name: json['name'],
      watts: json['watts'],
      hours: json['hours'],
      count: json['count'],
      tips: json['tips']?.toString() ?? '',
      savingWatts: json['savingWatts']?.toString() ?? '',
      investmentCost: json['investmentCost']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'watts': watts,
    'hours': hours,
    'count': count,
    'tips': tips,
    'savingWatts': savingWatts,
    'investmentCost': investmentCost,
  };
}
