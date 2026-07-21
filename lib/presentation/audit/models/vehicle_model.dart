class VehicleModel {
  String vehicleType;
  String fuelType;
  bool isEV;

  String kmUsage;
  String fuelUsage;
  String fuelCost;
  String mileage;

  VehicleModel({
    this.vehicleType = 'Car',
    this.fuelType = 'Petrol',
    this.isEV = false,
    this.kmUsage = '',
    this.fuelUsage = '',
    this.fuelCost = '',
    this.mileage = '',
  });

  Map<String, dynamic> toJson() {
    return {
      'vehicleType': vehicleType,
      'fuelType': fuelType,
      'isEV': isEV,
      'kmUsage': kmUsage,
      'fuelUsage': fuelUsage,
      'fuelCost': fuelCost,
      'mileage': mileage,
    };
  }

  factory VehicleModel.fromJson(Map<String, dynamic> json) {
    return VehicleModel(
      vehicleType: json['vehicleType']?.toString() ?? 'Car',
      fuelType: json['fuelType']?.toString() ?? 'Petrol',
      isEV: json['isEV'] == true,
      kmUsage: json['kmUsage']?.toString() ?? '',
      fuelUsage: json['fuelUsage']?.toString() ?? '',
      fuelCost: json['fuelCost']?.toString() ?? '',
      mileage: json['mileage']?.toString() ?? '',
    );
  }
}
