import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:k_urja/presentation/audit/audit_details_page.dart';
import 'package:k_urja/presentation/audit/widgets/bill_entry_section.dart';
import 'package:k_urja/presentation/widgets/custom_textfield.dart';
import 'package:k_urja/presentation/audit/models/appliance_model.dart';
import 'package:k_urja/presentation/audit/models/heavy_appliance_model.dart';
import 'package:k_urja/presentation/audit/models/vehicle_model.dart';
import 'package:k_urja/presentation/audit/widgets/appliance_section.dart';
import 'package:k_urja/presentation/audit/widgets/heavy_appliance_section.dart';
import 'package:k_urja/presentation/audit/widgets/vehicle_section.dart';
import 'package:k_urja/presentation/widgets/section_header.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuditEntryPage extends StatefulWidget {
  const AuditEntryPage({super.key});

  @override
  State<AuditEntryPage> createState() => _AuditEntryPageState();
}

class _AuditEntryPageState extends State<AuditEntryPage> {
  final _pageController = PageController();
  final _formKey = GlobalKey<FormState>();
  int _currentPage = 0;

  // ==========================
  // 1. BASIC DETAILS CONTROLLERS
  // ==========================
  final _ownerNameController = TextEditingController();
  final _houseNameController = TextEditingController();
  final _mobileNumberController = TextEditingController();
  final _consumerNoController = TextEditingController();
  final _sectionController = TextEditingController();
  final _ksebPostOfficeController = TextEditingController();
  final _pinCodeController = TextEditingController();
  final _panchayathController = TextEditingController();
  final _memberCountController = TextEditingController();
  final _daysUninhabitedController = TextEditingController();
  bool _hasSolarPlant = false;
  final _solarCapacityController = TextEditingController();

  // New fields for Electricity Connection Details
  final _tariffCategoryController = TextEditingController();
  final _connectedLoadController = TextEditingController();
  String _natureOfConnection = 'Single Phase';
  String _houseBuildingType = 'Concrete';
  String _ownOrRental = 'Own';
  final _noOfFloorsController = TextEditingController();
  final _totalBuildingAreaController = TextEditingController();
  String _typeOfEarthing = 'Pipe Earthing';
  String _controlSystems = 'ELCB';
  final _noOfMcbsController = TextEditingController();
  String _typeOfEnergyMeter = 'Digital';
  String? _solarPlantType;

  // Average from BillEntrySection
  double _calculatedAverageDailyConsumption = 0.0;
  double _averageUnitCost = 0.0;

  // ==========================
  // 2. COOKING & FUEL CONTROLLERS
  // ==========================
  final _firewoodController = TextEditingController();
  final _lpgController = TextEditingController();
  final _biogasController = TextEditingController();
  final _otherFuelController = TextEditingController();

  // ==========================
  // 3, 4, 7. APPLIANCE LISTS
  // ==========================
  List<ApplianceModel> lightSources = [ApplianceModel()];
  List<ApplianceModel> fanList = [ApplianceModel()];
  List<ApplianceModel> otherAppliances = [ApplianceModel()];

  // ==========================
  // 5, 6. HEAVY APPLIANCE LISTS
  // ==========================
  List<HeavyApplianceModel> fridgeList = [HeavyApplianceModel()];
  List<HeavyApplianceModel> acList = [HeavyApplianceModel()];

  // ==========================
  // 9. WATER USAGE CONTROLLERS
  // ==========================
  final _tankCapacityController = TextEditingController();
  final _pumpCapacityController = TextEditingController();
  final _fillingTimeController = TextEditingController();
  final _pumpCountController = TextEditingController();
  String _waterSource = 'Well';
  final _waterUsageController = TextEditingController();
  final _waterBillController = TextEditingController();

  // ==========================
  // 10. VEHICLE LIST
  // ==========================
  List<VehicleModel> vehicleList = [];

  List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    _loadInitialValues();
    // No listener needed for _currentPage as we update it in onPageChanged
  }

  Future<void> _loadInitialValues() async {
    final prefs = await SharedPreferences.getInstance();
    final unitCost = prefs.getDouble('averageUnitCost');
    if (unitCost != null) {
      setState(() {
        _averageUnitCost = unitCost;
      });
    }
  }

  @override
  void dispose() {
    _pageController.dispose();

    // Basic
    _ownerNameController.dispose();
    _houseNameController.dispose();
    _mobileNumberController.dispose();
    _consumerNoController.dispose();
    _sectionController.dispose();
    _ksebPostOfficeController.dispose();
    _pinCodeController.dispose();
    _panchayathController.dispose();
    _memberCountController.dispose();
    _daysUninhabitedController.dispose();
    _solarCapacityController.dispose();

    // New electricity details
    _tariffCategoryController.dispose();
    _connectedLoadController.dispose();
    _noOfFloorsController.dispose();
    _totalBuildingAreaController.dispose();
    _noOfMcbsController.dispose();

    // Cooking
    _firewoodController.dispose();
    _lpgController.dispose();
    _biogasController.dispose();
    _otherFuelController.dispose();

    // Water
    _tankCapacityController.dispose();
    _pumpCapacityController.dispose();
    _fillingTimeController.dispose();
    _pumpCountController.dispose();
    _waterUsageController.dispose();
    _waterBillController.dispose();

    super.dispose();
  }

  void _handleSubmit() {
    // 1. Validate Form (Works now because of KeepAlivePage)
    if (!_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Validation failed. Please check previous pages for errors.",
          ),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ),
      );
      return;
    }

    // 2. Calculate Total Daily Consumption from user input
    double totalConsumption = 0;

    // Appliances (lights, fans, others)
    for (var list in [lightSources, fanList, otherAppliances]) {
      for (var appliance in list) {
        totalConsumption +=
            (double.tryParse(appliance.watts) ?? 0.0) *
            (double.tryParse(appliance.hours) ?? 0.0) *
            (double.tryParse(appliance.count) ?? 1.0);
      }
    }

    // Heavy Appliances (fridge, AC)
    for (var list in [fridgeList, acList]) {
      for (var appliance in list) {
        totalConsumption +=
            (double.tryParse(appliance.wattage) ?? 0.0) *
            (double.tryParse(appliance.hoursUsed) ?? 0.0) *
            (double.tryParse(appliance.count) ?? 1.0);
      }
    }

    // Convert from Watt-hours to kWh
    totalConsumption /= 1000;

    // 3. Get Average Daily Consumption from bill
    final averageFromBill = _calculatedAverageDailyConsumption;

    // 4. Perform the check
    final lowerBound = averageFromBill * 0.88;
    final upperBound = averageFromBill * 1.12;

    if (totalConsumption < lowerBound || totalConsumption > upperBound) {
      final bool hasEV = vehicleList.any((vehicle) => vehicle.isEV);
      final bool canProceedAnyway = _hasSolarPlant || hasEV;

      // Show warning dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Consumption Mismatch'),
            content: Text(
              'The total consumption calculated from your appliances (${totalConsumption.toStringAsFixed(2)} kWh/day) is significantly different from the average consumption from your bill (${averageFromBill.toStringAsFixed(2)} kWh/day). Do you want to proceed anyway?',
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Go Back & Edit'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              if (canProceedAnyway)
                TextButton(
                  child: const Text('Proceed Anyway'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    _proceedWithSubmit();
                  },
                ),
            ],
          );
        },
      );
    } else {
      // If within tolerance, proceed directly
      _proceedWithSubmit();
    }
  }

  void _proceedWithSubmit() {
    // Calculate pump power consumption
    final pumpHP = double.tryParse(_pumpCapacityController.text) ?? 0.0;
    final fillingTimeMinutes =
        double.tryParse(_fillingTimeController.text) ?? 0.0;
    final pumpCount = double.tryParse(_pumpCountController.text) ?? 0.0;

    double dailyPowerPump = 0.0;
    if (pumpHP > 0 && fillingTimeMinutes > 0 && pumpCount > 0) {
      final pumpWatts = pumpHP * 746; // 1 HP = 746 Watts
      final pumpHours = fillingTimeMinutes / 60;
      dailyPowerPump = (pumpWatts * pumpHours * pumpCount) / 1000; // kWh
    }
    final annualPowerPump = dailyPowerPump * 365;

    final auditData = AuditData(
      ownerName: _ownerNameController.text,
      houseName: _houseNameController.text,
      mobileNumber: _mobileNumberController.text,
      consumerNo: _consumerNoController.text,
      section: _sectionController.text,
      ksebPostOffice: _ksebPostOfficeController.text,
      pinCode: _pinCodeController.text,
      panchayath: _panchayathController.text,
      memberCount: _memberCountController.text,
      daysUninhabited: _daysUninhabitedController.text,
      hasSolarPlant: _hasSolarPlant,
      solarCapacity: _solarCapacityController.text,
      tariffCategory: _tariffCategoryController.text,
      connectedLoad: _connectedLoadController.text,
      natureOfConnection: _natureOfConnection,
      houseBuildingType: _houseBuildingType,
      ownOrRental: _ownOrRental,
      noOfFloors: _noOfFloorsController.text,
      totalBuildingArea: _totalBuildingAreaController.text,
      typeOfEarthing: _typeOfEarthing,
      controlSystems: _controlSystems,
      noOfMcbs: _noOfMcbsController.text,
      typeOfEnergyMeter: _typeOfEnergyMeter,
      solarPlantType: _solarPlantType,
      calculatedAverageDailyConsumption: _calculatedAverageDailyConsumption,
      averageUnitCost: _averageUnitCost,
      firewoodUsage: _firewoodController.text,
      lpgCylinders: _lpgController.text,
      biogasUsage: _biogasController.text,
      otherFuel: _otherFuelController.text,
      lightSources: lightSources,
      fanList: fanList,
      otherAppliances: otherAppliances,
      fridgeList: fridgeList,
      acList: acList,
      vehicleList: vehicleList,
      pumpData: PumpData(
        tankCapacity: _tankCapacityController.text,
        pumpCapacity: _pumpCapacityController.text,
        fillingTime: _fillingTimeController.text,
        pumpCount: _pumpCountController.text,
      ),
      waterSource: _waterSource,
      waterUsage: _waterUsageController.text,
      waterBill: _waterBillController.text,
      dailyPowerPump: dailyPowerPump,
      annualPowerPump: annualPowerPump,
    );

    context.push(
      '/audit-details',
      extra: {'auditData': auditData, 'showSaveButton': true},
    );
  }

  // Methods to build each page
  Widget _buildBasicDetailsPage() {
    final titleStyle = Theme.of(
      context,
    ).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold);
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(title: "1. Basic Details"),
          Text("General Information", style: titleStyle),
          const SizedBox(height: 10),
          CustomTextField(
            label: "House Owner Name",
            controller: _ownerNameController,
          ),
          CustomTextField(
            label: "House Name",
            controller: _houseNameController,
          ),
          CustomTextField(
            label: "Mobile Number",
            controller: _mobileNumberController,
            keyboardType: TextInputType.phone,
          ),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  label: "Post Office",
                  controller: _ksebPostOfficeController,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: CustomTextField(
                  label: "Pin Code",
                  controller: _pinCodeController,
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          CustomTextField(
            label: "Panchayath",
            controller: _panchayathController,
          ),
          const SizedBox(height: 10),
          Text("KSEB Details", style: titleStyle),
          const SizedBox(height: 10),
          CustomTextField(
            label: "Consumer Number",
            controller: _consumerNoController,
            keyboardType: TextInputType.number,
          ),
          CustomTextField(
            label: "Section Name",
            controller: _sectionController,
          ),
          CustomTextField(
            label: "Tariff Category",
            controller: _tariffCategoryController,
          ),
          CustomTextField(
            label: "Connected Load (Watts)",
            controller: _connectedLoadController,
            keyboardType: TextInputType.number,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 8),
            child: Text("Nature of Connection:", style: titleStyle),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                RadioListTile(
                  title: const Text("Three Phase"),
                  value: "Three Phase",
                  groupValue: _natureOfConnection,
                  activeColor: const Color(0xFFCDEA66),
                  onChanged: (val) =>
                      setState(() => _natureOfConnection = val.toString()),
                ),
                RadioListTile(
                  title: const Text("Single Phase"),
                  value: "Single Phase",
                  groupValue: _natureOfConnection,
                  activeColor: const Color(0xFFCDEA66),
                  onChanged: (val) =>
                      setState(() => _natureOfConnection = val.toString()),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Text("Building Information", style: titleStyle),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 8),
            child: Text("House Building Type:", style: titleStyle),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                RadioListTile(
                  title: const Text("Concrete"),
                  value: "Concrete",
                  groupValue: _houseBuildingType,
                  activeColor: const Color(0xFFCDEA66),
                  onChanged: (val) =>
                      setState(() => _houseBuildingType = val.toString()),
                ),
                RadioListTile(
                  title: const Text("Tiled Roof"),
                  value: "Tiled Roof",
                  groupValue: _houseBuildingType,
                  activeColor: const Color(0xFFCDEA66),
                  onChanged: (val) =>
                      setState(() => _houseBuildingType = val.toString()),
                ),
                RadioListTile(
                  title: const Text("Sheet Roof"),
                  value: "Sheet Roof",
                  groupValue: _houseBuildingType,
                  activeColor: const Color(0xFFCDEA66),
                  onChanged: (val) =>
                      setState(() => _houseBuildingType = val.toString()),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 8),
            child: Text("Building Ownership:", style: titleStyle),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                RadioListTile(
                  title: const Text("Own"),
                  value: "Own",
                  groupValue: _ownOrRental,
                  activeColor: const Color(0xFFCDEA66),
                  onChanged: (val) =>
                      setState(() => _ownOrRental = val.toString()),
                ),
                RadioListTile(
                  title: const Text("Rental"),
                  value: "Rental",
                  groupValue: _ownOrRental,
                  activeColor: const Color(0xFFCDEA66),
                  onChanged: (val) =>
                      setState(() => _ownOrRental = val.toString()),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  label: "No of floors",
                  controller: _noOfFloorsController,
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: CustomTextField(
                  label: "Total Building area",
                  controller: _totalBuildingAreaController,
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text("Electrical System", style: titleStyle),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 8),
            child: Text("Type of Earthing:", style: titleStyle),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                RadioListTile(
                  title: const Text("Plate Earthing"),
                  value: "Plate Earthing",
                  groupValue: _typeOfEarthing,
                  activeColor: const Color(0xFFCDEA66),
                  onChanged: (val) =>
                      setState(() => _typeOfEarthing = val.toString()),
                ),
                RadioListTile(
                  title: const Text("Pipe Earthing"),
                  value: "Pipe Earthing",
                  groupValue: _typeOfEarthing,
                  activeColor: const Color(0xFFCDEA66),
                  onChanged: (val) =>
                      setState(() => _typeOfEarthing = val.toString()),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 8),
            child: Text("Control Systems:", style: titleStyle),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                RadioListTile(
                  title: const Text("ELCB"),
                  value: "ELCB",
                  groupValue: _controlSystems,
                  activeColor: const Color(0xFFCDEA66),
                  onChanged: (val) =>
                      setState(() => _controlSystems = val.toString()),
                ),
                RadioListTile(
                  title: const Text("RCCB"),
                  value: "RCCB",
                  groupValue: _controlSystems,
                  activeColor: const Color(0xFFCDEA66),
                  onChanged: (val) =>
                      setState(() => _controlSystems = val.toString()),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          CustomTextField(
            label: "Number of MCBs",
            controller: _noOfMcbsController,
            keyboardType: TextInputType.number,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 8),
            child: Text("Type of Energy Meter:", style: titleStyle),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                RadioListTile(
                  title: const Text("Electromechanical"),
                  value: "Electromechanical",
                  groupValue: _typeOfEnergyMeter,
                  activeColor: const Color(0xFFCDEA66),
                  onChanged: (val) =>
                      setState(() => _typeOfEnergyMeter = val.toString()),
                ),
                RadioListTile(
                  title: const Text("Digital"),
                  value: "Digital",
                  groupValue: _typeOfEnergyMeter,
                  activeColor: const Color(0xFFCDEA66),
                  onChanged: (val) =>
                      setState(() => _typeOfEnergyMeter = val.toString()),
                ),
                RadioListTile(
                  title: const Text("TOD"),
                  value: "TOD",
                  groupValue: _typeOfEnergyMeter,
                  activeColor: const Color(0xFFCDEA66),
                  onChanged: (val) =>
                      setState(() => _typeOfEnergyMeter = val.toString()),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  label: "No. of Members",
                  controller: _memberCountController,
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: CustomTextField(
                  label: "Days Uninhabited/Year",
                  controller: _daysUninhabitedController,
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text("Solar Plant Details", style: titleStyle),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(12),
            ),
            margin: const EdgeInsets.only(bottom: 16),
            child: SwitchListTile(
              title: const Text("Do you have a Solar Plant?"),
              value: _hasSolarPlant,
              activeThumbColor: const Color(0xFFCDEA66),
              onChanged: (val) {
                setState(() {
                  _hasSolarPlant = val;
                  if (_hasSolarPlant) {
                    // If turning on, and no value is selected yet, default to 'On grid'
                    _solarPlantType ??= 'On grid';
                  } else {
                    // If turning off, clear the selection
                    _solarPlantType = null;
                  }
                });
              },
            ),
          ),
          if (_hasSolarPlant)
            CustomTextField(
              label: "Solar Capacity (kW)",
              controller: _solarCapacityController,
              keyboardType: TextInputType.number,
            ),
          if (_hasSolarPlant)
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 8),
              child: Text("Solar Plant Type:", style: titleStyle),
            ),
          if (_hasSolarPlant)
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  RadioListTile(
                    title: const Text("On grid"),
                    value: "On grid",
                    groupValue: _solarPlantType,
                    activeColor: const Color(0xFFCDEA66),
                    onChanged: (val) =>
                        setState(() => _solarPlantType = val.toString()),
                  ),
                  RadioListTile(
                    title: const Text("Off grid"),
                    value: "Off grid",
                    groupValue: _solarPlantType,
                    activeColor: const Color(0xFFCDEA66),
                    onChanged: (val) =>
                        setState(() => _solarPlantType = val.toString()),
                  ),
                  RadioListTile(
                    title: const Text("Hybrid"),
                    value: "Hybrid",
                    groupValue: _solarPlantType,
                    activeColor: const Color(0xFFCDEA66),
                    onChanged: (val) =>
                        setState(() => _solarPlantType = val.toString()),
                  ),
                ],
              ),
            ),
          const SizedBox(height: 20),
          Text("Electricity Bill Analysis", style: titleStyle),
          const SizedBox(height: 10),
          BillEntrySection(
            hasSolar: _hasSolarPlant,
            solarType: _solarPlantType,
            onAverageCalculated: (average) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (mounted) {
                  setState(() {
                    _calculatedAverageDailyConsumption = average;
                  });
                }
              });
            },
            onUnitCostChanged: (cost) {
              setState(() {
                _averageUnitCost = cost;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCookingPage() {
    final titleStyle = Theme.of(
      context,
    ).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold);
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(title: "2. Cooking & Fuel (Monthly)"),
          Text("Fuel Usage Details", style: titleStyle),
          const SizedBox(height: 10),
          CustomTextField(
            label: "Firewood Usage (kg)",
            controller: _firewoodController,
            keyboardType: TextInputType.number,
          ),
          CustomTextField(
            label: "LPG Cylinders used",
            controller: _lpgController,
            keyboardType: TextInputType.number,
          ),
          CustomTextField(
            label: "Biogas usage (Hours)",
            controller: _biogasController,
            keyboardType: TextInputType.number,
          ),

          CustomTextField(
            label: "Any Other Fuel (specify)",
            controller: _otherFuelController,
          ),
        ],
      ),
    );
  }

  Widget _buildAppliancesPage() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ApplianceSection(
            title: "3. Light Sources",
            items: lightSources,
            onAdd: () => setState(() => lightSources.add(ApplianceModel())),
          ),
          ApplianceSection(
            title: "4. Ceiling/Table Fans",
            items: fanList,
            onAdd: () => setState(() => fanList.add(ApplianceModel())),
          ),
          HeavyApplianceSection(
            title: "5. Refrigerator",
            items: fridgeList,
            isAC: false,
            onAdd: () => setState(() => fridgeList.add(HeavyApplianceModel())),
          ),
          HeavyApplianceSection(
            title: "6. Air Conditioner",
            items: acList,
            isAC: true,
            onAdd: () => setState(() => acList.add(HeavyApplianceModel())),
          ),
          ApplianceSection(
            title: "7. Other Appliances",
            items: otherAppliances,
            onAdd: () => setState(() => otherAppliances.add(ApplianceModel())),
          ),
        ],
      ),
    );
  }

  Widget _buildWaterUsagePage() {
    final titleStyle = Theme.of(
      context,
    ).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold);
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(title: "8. Water Usage"),
          Text("Tank and Pump Details", style: titleStyle),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  label: "Tank Capacity (Liters)",
                  controller: _tankCapacityController,
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: CustomTextField(
                  label: "Pump Capacity (HP)",
                  controller: _pumpCapacityController,
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 8),
            child: Text("Source of Water:", style: titleStyle),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                RadioListTile(
                  title: const Text("Well / Borewell"),
                  value: "Well",
                  groupValue: _waterSource,
                  activeColor: const Color(0xFFCDEA66),
                  onChanged: (val) =>
                      setState(() => _waterSource = val.toString()),
                ),
                RadioListTile(
                  title: const Text("Municipal Water Pipeline"),
                  value: "Municipal",
                  groupValue: _waterSource,
                  activeColor: const Color(0xFFCDEA66),
                  onChanged: (val) =>
                      setState(() => _waterSource = val.toString()),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Text("Pumping Frequency", style: titleStyle),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  label: "Time to Fill (Minutes)",
                  controller: _fillingTimeController,
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: CustomTextField(
                  label: "Times Pumped/Day",
                  controller: _pumpCountController,
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          if (_waterSource == 'Municipal')
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      label: "Bi-monthly Water Usage (KL)",
                      controller: _waterUsageController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: CustomTextField(
                      label: "Bi-monthly Water Bill (₹)",
                      controller: _waterBillController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildVehiclesPage() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VehicleSection(
            title: '9. Vehicles',
            items: vehicleList,
            onAdd: () => setState(() => vehicleList.add(VehicleModel())),
            onRemove: (item) => setState(() => vehicleList.remove(item)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // WRAPPING PAGES WITH KeepAlivePage
    _pages = [
      KeepAlivePage(child: _buildBasicDetailsPage()),
      KeepAlivePage(child: _buildCookingPage()),
      KeepAlivePage(child: _buildAppliancesPage()),
      KeepAlivePage(child: _buildWaterUsagePage()),
      KeepAlivePage(child: _buildVehiclesPage()),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Energy Audit Survey"),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        titleTextStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: LinearProgressIndicator(
            value: (_currentPage + 1) / _pages.length,
            backgroundColor: Colors.grey[300],
            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFCDEA66)),
          ),
        ),
      ),
      backgroundColor: Colors.grey[50],
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: PageView(
          controller: _pageController,
          onPageChanged: (int page) {
            setState(() {
              _currentPage = page;
            });
          },
          children: _pages,
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: Colors.grey.shade300, width: 0.5),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              if (_currentPage > 0)
                ElevatedButton.icon(
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('Previous'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[200],
                    foregroundColor: Colors.black,
                    elevation: 0,
                  ),
                  onPressed: () {
                    _pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  },
                )
              else
                const SizedBox(width: 100), // Spacing placeholder

              if (_currentPage < _pages.length - 1)
                ElevatedButton.icon(
                  icon: const Icon(Icons.arrow_forward),
                  label: const Text('Next'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFCDEA66),
                    foregroundColor: Colors.black,
                    elevation: 0,
                  ),
                  onPressed: () {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  },
                )
              else
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: _handleSubmit,
                  child: const Text(
                    "Submit Survey",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================
// HELPER CLASS FOR PRESERVING PAGE STATE
// ============================================
class KeepAlivePage extends StatefulWidget {
  final Widget child;

  const KeepAlivePage({super.key, required this.child});

  @override
  State<KeepAlivePage> createState() => _KeepAlivePageState();
}

class _KeepAlivePageState extends State<KeepAlivePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }
}
