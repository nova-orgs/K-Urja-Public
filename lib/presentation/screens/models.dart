// lib/presentation/screens/models.dart

class AuditData {
  // Home & billing
  String ownerName = '';
  String postOffice = '';
  String panchayat = '';
  String ksebSection = '';
  String pinCode = '';
  String ksebConsNo = '';
  String noOfPeople = '';
  String biMonthlyUsage = ''; // stored as string; parsed later
  String daysHomeVacant = '';
  String biMonthlyBill = '';
  bool solarAvailable = false;

  // Cooking & fuel
  String fuelType = 'Firewood';
  List<String> appliances = [];

  // Water & vehicle
  String tankCapacity = '';
  String pumpCapacity = '';
  String usedPerDay = '';
  String waterSource = '';
  String fillingTime = '';
  String vehicleType = 'None';
  String vehicleCount = '';
  String vehicleMonthlyUse = ''; // stored as string; parsed later
}

class CalculationResult {
  final double electricity;
  final double appliances;
  final double cooking;
  final double transport;
  final double annualKwh;
  final double energySavedKwh;
  final double carbonSavedKg;

  CalculationResult({
    required this.electricity,
    required this.appliances,
    required this.cooking,
    required this.transport,
    required this.annualKwh,
    required this.energySavedKwh,
    required this.carbonSavedKg,
  });

  double get total => electricity + appliances + cooking + transport;
}
