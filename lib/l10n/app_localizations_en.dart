// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String welcomemsg(Object name) {
    return 'Welcome to $name';
  }

  @override
  String get introface => 'Energy Audit';

  @override
  String get introfaceline2 => 'Made for';

  @override
  String get introfaceline3 => 'Your Savings';

  @override
  String get introfaceline4 => 'Consume, control and save energy effectively.';

  @override
  String get introfacestartButton => 'Let\'s Start';

  @override
  String get signupTitle => 'Create New Account';

  @override
  String get labelFullName => 'Full name';

  @override
  String get labelEmail => 'E-mail';

  @override
  String get labelPassword => 'Password';

  @override
  String get labelCollegeName => 'College name';

  @override
  String get labelNSSUnit => 'NSS Unit No.';

  @override
  String get labelKTUNumber => 'KTU Register Number';

  @override
  String get labelYear => 'Year of College Admission';

  @override
  String get labelOtp => 'OTP';

  @override
  String get btnGetOtp => 'Get OTP';

  @override
  String get btnResendOtp => 'Resend OTP';

  @override
  String btnResendOtpIn(Object seconds) {
    return 'Resend OTP in $seconds';
  }

  @override
  String get btnSignup => 'Signup';

  @override
  String get btnLogin => 'Login';

  @override
  String get appBarTitle => 'Energy Audit Survey';

  @override
  String get btnPrevious => 'Previous';

  @override
  String get btnNext => 'Next';

  @override
  String get btnSubmit => 'Submit Survey';

  @override
  String get sectionBasicDetails => '1. Basic Details';

  @override
  String get subHeaderGeneralInfo => 'General Information';

  @override
  String get labelHouseOwnerName => 'House Owner Name';

  @override
  String get labelHouseName => 'House Name';

  @override
  String get labelMobileNumber => 'Mobile Number';

  @override
  String get labelPostOffice => 'Post Office';

  @override
  String get labelPinCode => 'Pin Code';

  @override
  String get labelPanchayath => 'Panchayath';

  @override
  String get subHeaderKSEBDetails => 'KSEB Details';

  @override
  String get labelConsumerNumber => 'Consumer Number';

  @override
  String get labelSectionName => 'Section Name';

  @override
  String get labelTariffCategory => 'Tariff Category';

  @override
  String get labelConnectedLoad => 'Connected Load (Watts)';

  @override
  String get labelNatureOfConnection => 'Nature of Connection:';

  @override
  String get optionThreePhase => 'Three Phase';

  @override
  String get subHeaderBuildingInfo => 'Building Information';

  @override
  String get labelHouseBuildingType => 'House Building Type:';

  @override
  String get optionConcrete => 'Concrete';

  @override
  String get optionTiledRoof => 'Tiled Roof';

  @override
  String get optionSheetRoof => 'Sheet Roof';

  @override
  String get labelBuildingOwnership => 'Building Ownership:';

  @override
  String get optionOwn => 'Own';

  @override
  String get optionRental => 'Rental';

  @override
  String get labelNoOfFloors => 'No of floors';

  @override
  String get labelTotalBuildingArea => 'Total Building area';

  @override
  String get subHeaderElectricalSystem => 'Electrical System';

  @override
  String get labelTypeOfEarthing => 'Type of Earthing:';

  @override
  String get optionPlateEarthing => 'Plate Earthing';

  @override
  String get optionPipeEarthing => 'Pipe Earthing';

  @override
  String get labelPowerSavings => 'Est. Savings (Watts)';

  @override
  String get labelInvestment => 'Investment Cost (₹)';

  @override
  String get labelControlSystems => 'Control Systems:';

  @override
  String get labelSavingTips => 'Opportunity to save power';

  @override
  String get optionELCB => 'ELCB';

  @override
  String get optionRCCB => 'RCCB';

  @override
  String get labelNoOfMCBs => 'Number of MCBs';

  @override
  String get labelTypeOfEnergyMeter => 'Type of Energy Meter:';

  @override
  String get optionElectromechanical => 'Electromechanical';

  @override
  String get optionDigital => 'Digital';

  @override
  String get optionTOD => 'TOD';

  @override
  String get labelBiMonthlyUnit => 'Bi-monthly Unit (kWh)';

  @override
  String get labelBillAmount => 'Bill Amount (₹)';

  @override
  String get labelNoOfMembers => 'No. of Members';

  @override
  String get labelDaysUninhabited => 'Days Uninhabited/Year';

  @override
  String get subHeaderSolarPlantDetails => 'Solar Plant Details';

  @override
  String get labelHasSolarPlant => 'Do you have a Solar Plant?';

  @override
  String get labelSolarCapacity => 'Solar Capacity (kW)';

  @override
  String get labelSolarPlantType => 'Solar Plant Type:';

  @override
  String get optionOnGrid => 'On grid';

  @override
  String get optionOffGrid => 'Off grid';

  @override
  String get optionHybrid => 'Hybrid';

  @override
  String get sectionCookingFuel => '2. Cooking & Fuel (Monthly)';

  @override
  String get subHeaderFuelUsage => 'Fuel Usage Details';

  @override
  String get labelFirewoodUsage => 'Firewood Usage (kg)';

  @override
  String get labelLPGCylinders => 'LPG Cylinders used';

  @override
  String get labelBiogasUsage => 'Biogas usage (Hours)';

  @override
  String get labelInductionCooker => 'Induction Cooker (Hours)';

  @override
  String get labelOtherFuel => 'Any Other Fuel (specify)';

  @override
  String get sectionLightSources => '3. Light Sources';

  @override
  String get sectionFans => '4. Ceiling/Table Fans';

  @override
  String get sectionOtherAppliances => '5. Other Appliances';

  @override
  String get sectionRefrigerator => '6. Refrigerator';

  @override
  String get sectionAirConditioner => '7. Air Conditioner';

  @override
  String get sectionWaterUsage => '8. Water Usage';

  @override
  String get subHeaderTankPump => 'Tank and Pump Details';

  @override
  String get labelTankCapacity => 'Tank Capacity (Liters)';

  @override
  String get labelPumpCapacity => 'Pump Capacity (HP)';

  @override
  String get labelWaterSource => 'Source of Water:';

  @override
  String get optionWellBorewell => 'Well / Borewell';

  @override
  String get optionMunicipalWater => 'Municipal Water Pipeline';

  @override
  String get subHeaderPumpingFrequency => 'Pumping Frequency';

  @override
  String get labelTimeToFill => 'Time to Fill (Hours)';

  @override
  String get labelTimesPumped => 'Times Pumped/Day';

  @override
  String get sectionVehicles => '9. Vehicles';

  @override
  String get subHeaderMunicipalWaterUsage => 'Municipal Water Usage';

  @override
  String get labelWaterUsageKL => 'Bi-monthly Water Usage (KL)';

  @override
  String get labelWaterBill => 'Bi-monthly Water Bill (₹)';

  @override
  String get optionSinglePhase => 'Single Phase';

  @override
  String get subHeaderPowerAndRemarks => 'Power Consumption and Remarks';

  @override
  String get labelDailyPowerConsumption => 'Daily Power Consumption (kWh)';

  @override
  String get labelAnnualPowerConsumption => 'Annual Power Consumption (kWh)';

  @override
  String get labelRemarks => 'Remarks';
}
