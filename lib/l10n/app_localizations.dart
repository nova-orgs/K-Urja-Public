import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ml.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ml'),
  ];

  /// No description provided for @welcomemsg.
  ///
  /// In en, this message translates to:
  /// **'Welcome to {name}'**
  String welcomemsg(Object name);

  /// No description provided for @introface.
  ///
  /// In en, this message translates to:
  /// **'Energy Audit'**
  String get introface;

  /// No description provided for @introfaceline2.
  ///
  /// In en, this message translates to:
  /// **'Made for'**
  String get introfaceline2;

  /// No description provided for @introfaceline3.
  ///
  /// In en, this message translates to:
  /// **'Your Savings'**
  String get introfaceline3;

  /// No description provided for @introfaceline4.
  ///
  /// In en, this message translates to:
  /// **'Consume, control and save energy effectively.'**
  String get introfaceline4;

  /// No description provided for @introfacestartButton.
  ///
  /// In en, this message translates to:
  /// **'Let\'s Start'**
  String get introfacestartButton;

  /// No description provided for @signupTitle.
  ///
  /// In en, this message translates to:
  /// **'Create New Account'**
  String get signupTitle;

  /// No description provided for @labelFullName.
  ///
  /// In en, this message translates to:
  /// **'Full name'**
  String get labelFullName;

  /// No description provided for @labelEmail.
  ///
  /// In en, this message translates to:
  /// **'E-mail'**
  String get labelEmail;

  /// No description provided for @labelPassword.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get labelPassword;

  /// No description provided for @labelCollegeName.
  ///
  /// In en, this message translates to:
  /// **'College name'**
  String get labelCollegeName;

  /// No description provided for @labelNSSUnit.
  ///
  /// In en, this message translates to:
  /// **'NSS Unit No.'**
  String get labelNSSUnit;

  /// No description provided for @labelKTUNumber.
  ///
  /// In en, this message translates to:
  /// **'KTU Register Number'**
  String get labelKTUNumber;

  /// No description provided for @labelYear.
  ///
  /// In en, this message translates to:
  /// **'Year of College Admission'**
  String get labelYear;

  /// No description provided for @labelOtp.
  ///
  /// In en, this message translates to:
  /// **'OTP'**
  String get labelOtp;

  /// No description provided for @btnGetOtp.
  ///
  /// In en, this message translates to:
  /// **'Get OTP'**
  String get btnGetOtp;

  /// No description provided for @btnResendOtp.
  ///
  /// In en, this message translates to:
  /// **'Resend OTP'**
  String get btnResendOtp;

  /// No description provided for @btnResendOtpIn.
  ///
  /// In en, this message translates to:
  /// **'Resend OTP in {seconds}'**
  String btnResendOtpIn(Object seconds);

  /// No description provided for @btnSignup.
  ///
  /// In en, this message translates to:
  /// **'Signup'**
  String get btnSignup;

  /// No description provided for @btnLogin.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get btnLogin;

  /// No description provided for @appBarTitle.
  ///
  /// In en, this message translates to:
  /// **'Energy Audit Survey'**
  String get appBarTitle;

  /// No description provided for @btnPrevious.
  ///
  /// In en, this message translates to:
  /// **'Previous'**
  String get btnPrevious;

  /// No description provided for @btnNext.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get btnNext;

  /// No description provided for @btnSubmit.
  ///
  /// In en, this message translates to:
  /// **'Submit Survey'**
  String get btnSubmit;

  /// No description provided for @sectionBasicDetails.
  ///
  /// In en, this message translates to:
  /// **'1. Basic Details'**
  String get sectionBasicDetails;

  /// No description provided for @subHeaderGeneralInfo.
  ///
  /// In en, this message translates to:
  /// **'General Information'**
  String get subHeaderGeneralInfo;

  /// No description provided for @labelHouseOwnerName.
  ///
  /// In en, this message translates to:
  /// **'House Owner Name'**
  String get labelHouseOwnerName;

  /// No description provided for @labelHouseName.
  ///
  /// In en, this message translates to:
  /// **'House Name'**
  String get labelHouseName;

  /// No description provided for @labelMobileNumber.
  ///
  /// In en, this message translates to:
  /// **'Mobile Number'**
  String get labelMobileNumber;

  /// No description provided for @labelPostOffice.
  ///
  /// In en, this message translates to:
  /// **'Post Office'**
  String get labelPostOffice;

  /// No description provided for @labelPinCode.
  ///
  /// In en, this message translates to:
  /// **'Pin Code'**
  String get labelPinCode;

  /// No description provided for @labelPanchayath.
  ///
  /// In en, this message translates to:
  /// **'Panchayath'**
  String get labelPanchayath;

  /// No description provided for @subHeaderKSEBDetails.
  ///
  /// In en, this message translates to:
  /// **'KSEB Details'**
  String get subHeaderKSEBDetails;

  /// No description provided for @labelConsumerNumber.
  ///
  /// In en, this message translates to:
  /// **'Consumer Number'**
  String get labelConsumerNumber;

  /// No description provided for @labelSectionName.
  ///
  /// In en, this message translates to:
  /// **'Section Name'**
  String get labelSectionName;

  /// No description provided for @labelTariffCategory.
  ///
  /// In en, this message translates to:
  /// **'Tariff Category'**
  String get labelTariffCategory;

  /// No description provided for @labelConnectedLoad.
  ///
  /// In en, this message translates to:
  /// **'Connected Load (Watts)'**
  String get labelConnectedLoad;

  /// No description provided for @labelNatureOfConnection.
  ///
  /// In en, this message translates to:
  /// **'Nature of Connection:'**
  String get labelNatureOfConnection;

  /// No description provided for @optionThreePhase.
  ///
  /// In en, this message translates to:
  /// **'Three Phase'**
  String get optionThreePhase;

  /// No description provided for @subHeaderBuildingInfo.
  ///
  /// In en, this message translates to:
  /// **'Building Information'**
  String get subHeaderBuildingInfo;

  /// No description provided for @labelHouseBuildingType.
  ///
  /// In en, this message translates to:
  /// **'House Building Type:'**
  String get labelHouseBuildingType;

  /// No description provided for @optionConcrete.
  ///
  /// In en, this message translates to:
  /// **'Concrete'**
  String get optionConcrete;

  /// No description provided for @optionTiledRoof.
  ///
  /// In en, this message translates to:
  /// **'Tiled Roof'**
  String get optionTiledRoof;

  /// No description provided for @optionSheetRoof.
  ///
  /// In en, this message translates to:
  /// **'Sheet Roof'**
  String get optionSheetRoof;

  /// No description provided for @labelBuildingOwnership.
  ///
  /// In en, this message translates to:
  /// **'Building Ownership:'**
  String get labelBuildingOwnership;

  /// No description provided for @optionOwn.
  ///
  /// In en, this message translates to:
  /// **'Own'**
  String get optionOwn;

  /// No description provided for @optionRental.
  ///
  /// In en, this message translates to:
  /// **'Rental'**
  String get optionRental;

  /// No description provided for @labelNoOfFloors.
  ///
  /// In en, this message translates to:
  /// **'No of floors'**
  String get labelNoOfFloors;

  /// No description provided for @labelTotalBuildingArea.
  ///
  /// In en, this message translates to:
  /// **'Total Building area'**
  String get labelTotalBuildingArea;

  /// No description provided for @subHeaderElectricalSystem.
  ///
  /// In en, this message translates to:
  /// **'Electrical System'**
  String get subHeaderElectricalSystem;

  /// No description provided for @labelTypeOfEarthing.
  ///
  /// In en, this message translates to:
  /// **'Type of Earthing:'**
  String get labelTypeOfEarthing;

  /// No description provided for @optionPlateEarthing.
  ///
  /// In en, this message translates to:
  /// **'Plate Earthing'**
  String get optionPlateEarthing;

  /// No description provided for @optionPipeEarthing.
  ///
  /// In en, this message translates to:
  /// **'Pipe Earthing'**
  String get optionPipeEarthing;

  /// No description provided for @labelPowerSavings.
  ///
  /// In en, this message translates to:
  /// **'Est. Savings (Watts)'**
  String get labelPowerSavings;

  /// No description provided for @labelInvestment.
  ///
  /// In en, this message translates to:
  /// **'Investment Cost (₹)'**
  String get labelInvestment;

  /// No description provided for @labelControlSystems.
  ///
  /// In en, this message translates to:
  /// **'Control Systems:'**
  String get labelControlSystems;

  /// No description provided for @labelSavingTips.
  ///
  /// In en, this message translates to:
  /// **'Opportunity to save power'**
  String get labelSavingTips;

  /// No description provided for @optionELCB.
  ///
  /// In en, this message translates to:
  /// **'ELCB'**
  String get optionELCB;

  /// No description provided for @optionRCCB.
  ///
  /// In en, this message translates to:
  /// **'RCCB'**
  String get optionRCCB;

  /// No description provided for @labelNoOfMCBs.
  ///
  /// In en, this message translates to:
  /// **'Number of MCBs'**
  String get labelNoOfMCBs;

  /// No description provided for @labelTypeOfEnergyMeter.
  ///
  /// In en, this message translates to:
  /// **'Type of Energy Meter:'**
  String get labelTypeOfEnergyMeter;

  /// No description provided for @optionElectromechanical.
  ///
  /// In en, this message translates to:
  /// **'Electromechanical'**
  String get optionElectromechanical;

  /// No description provided for @optionDigital.
  ///
  /// In en, this message translates to:
  /// **'Digital'**
  String get optionDigital;

  /// No description provided for @optionTOD.
  ///
  /// In en, this message translates to:
  /// **'TOD'**
  String get optionTOD;

  /// No description provided for @labelBiMonthlyUnit.
  ///
  /// In en, this message translates to:
  /// **'Bi-monthly Unit (kWh)'**
  String get labelBiMonthlyUnit;

  /// No description provided for @labelBillAmount.
  ///
  /// In en, this message translates to:
  /// **'Bill Amount (₹)'**
  String get labelBillAmount;

  /// No description provided for @labelNoOfMembers.
  ///
  /// In en, this message translates to:
  /// **'No. of Members'**
  String get labelNoOfMembers;

  /// No description provided for @labelDaysUninhabited.
  ///
  /// In en, this message translates to:
  /// **'Days Uninhabited/Year'**
  String get labelDaysUninhabited;

  /// No description provided for @subHeaderSolarPlantDetails.
  ///
  /// In en, this message translates to:
  /// **'Solar Plant Details'**
  String get subHeaderSolarPlantDetails;

  /// No description provided for @labelHasSolarPlant.
  ///
  /// In en, this message translates to:
  /// **'Do you have a Solar Plant?'**
  String get labelHasSolarPlant;

  /// No description provided for @labelSolarCapacity.
  ///
  /// In en, this message translates to:
  /// **'Solar Capacity (kW)'**
  String get labelSolarCapacity;

  /// No description provided for @labelSolarPlantType.
  ///
  /// In en, this message translates to:
  /// **'Solar Plant Type:'**
  String get labelSolarPlantType;

  /// No description provided for @optionOnGrid.
  ///
  /// In en, this message translates to:
  /// **'On grid'**
  String get optionOnGrid;

  /// No description provided for @optionOffGrid.
  ///
  /// In en, this message translates to:
  /// **'Off grid'**
  String get optionOffGrid;

  /// No description provided for @optionHybrid.
  ///
  /// In en, this message translates to:
  /// **'Hybrid'**
  String get optionHybrid;

  /// No description provided for @sectionCookingFuel.
  ///
  /// In en, this message translates to:
  /// **'2. Cooking & Fuel (Monthly)'**
  String get sectionCookingFuel;

  /// No description provided for @subHeaderFuelUsage.
  ///
  /// In en, this message translates to:
  /// **'Fuel Usage Details'**
  String get subHeaderFuelUsage;

  /// No description provided for @labelFirewoodUsage.
  ///
  /// In en, this message translates to:
  /// **'Firewood Usage (kg)'**
  String get labelFirewoodUsage;

  /// No description provided for @labelLPGCylinders.
  ///
  /// In en, this message translates to:
  /// **'LPG Cylinders used'**
  String get labelLPGCylinders;

  /// No description provided for @labelBiogasUsage.
  ///
  /// In en, this message translates to:
  /// **'Biogas usage (Hours)'**
  String get labelBiogasUsage;

  /// No description provided for @labelInductionCooker.
  ///
  /// In en, this message translates to:
  /// **'Induction Cooker (Hours)'**
  String get labelInductionCooker;

  /// No description provided for @labelOtherFuel.
  ///
  /// In en, this message translates to:
  /// **'Any Other Fuel (specify)'**
  String get labelOtherFuel;

  /// No description provided for @sectionLightSources.
  ///
  /// In en, this message translates to:
  /// **'3. Light Sources'**
  String get sectionLightSources;

  /// No description provided for @sectionFans.
  ///
  /// In en, this message translates to:
  /// **'4. Ceiling/Table Fans'**
  String get sectionFans;

  /// No description provided for @sectionOtherAppliances.
  ///
  /// In en, this message translates to:
  /// **'5. Other Appliances'**
  String get sectionOtherAppliances;

  /// No description provided for @sectionRefrigerator.
  ///
  /// In en, this message translates to:
  /// **'6. Refrigerator'**
  String get sectionRefrigerator;

  /// No description provided for @sectionAirConditioner.
  ///
  /// In en, this message translates to:
  /// **'7. Air Conditioner'**
  String get sectionAirConditioner;

  /// No description provided for @sectionWaterUsage.
  ///
  /// In en, this message translates to:
  /// **'8. Water Usage'**
  String get sectionWaterUsage;

  /// No description provided for @subHeaderTankPump.
  ///
  /// In en, this message translates to:
  /// **'Tank and Pump Details'**
  String get subHeaderTankPump;

  /// No description provided for @labelTankCapacity.
  ///
  /// In en, this message translates to:
  /// **'Tank Capacity (Liters)'**
  String get labelTankCapacity;

  /// No description provided for @labelPumpCapacity.
  ///
  /// In en, this message translates to:
  /// **'Pump Capacity (HP)'**
  String get labelPumpCapacity;

  /// No description provided for @labelWaterSource.
  ///
  /// In en, this message translates to:
  /// **'Source of Water:'**
  String get labelWaterSource;

  /// No description provided for @optionWellBorewell.
  ///
  /// In en, this message translates to:
  /// **'Well / Borewell'**
  String get optionWellBorewell;

  /// No description provided for @optionMunicipalWater.
  ///
  /// In en, this message translates to:
  /// **'Municipal Water Pipeline'**
  String get optionMunicipalWater;

  /// No description provided for @subHeaderPumpingFrequency.
  ///
  /// In en, this message translates to:
  /// **'Pumping Frequency'**
  String get subHeaderPumpingFrequency;

  /// No description provided for @labelTimeToFill.
  ///
  /// In en, this message translates to:
  /// **'Time to Fill (Hours)'**
  String get labelTimeToFill;

  /// No description provided for @labelTimesPumped.
  ///
  /// In en, this message translates to:
  /// **'Times Pumped/Day'**
  String get labelTimesPumped;

  /// No description provided for @sectionVehicles.
  ///
  /// In en, this message translates to:
  /// **'9. Vehicles'**
  String get sectionVehicles;

  /// No description provided for @subHeaderMunicipalWaterUsage.
  ///
  /// In en, this message translates to:
  /// **'Municipal Water Usage'**
  String get subHeaderMunicipalWaterUsage;

  /// No description provided for @labelWaterUsageKL.
  ///
  /// In en, this message translates to:
  /// **'Bi-monthly Water Usage (KL)'**
  String get labelWaterUsageKL;

  /// No description provided for @labelWaterBill.
  ///
  /// In en, this message translates to:
  /// **'Bi-monthly Water Bill (₹)'**
  String get labelWaterBill;

  /// No description provided for @optionSinglePhase.
  ///
  /// In en, this message translates to:
  /// **'Single Phase'**
  String get optionSinglePhase;

  /// No description provided for @subHeaderPowerAndRemarks.
  ///
  /// In en, this message translates to:
  /// **'Power Consumption and Remarks'**
  String get subHeaderPowerAndRemarks;

  /// No description provided for @labelDailyPowerConsumption.
  ///
  /// In en, this message translates to:
  /// **'Daily Power Consumption (kWh)'**
  String get labelDailyPowerConsumption;

  /// No description provided for @labelAnnualPowerConsumption.
  ///
  /// In en, this message translates to:
  /// **'Annual Power Consumption (kWh)'**
  String get labelAnnualPowerConsumption;

  /// No description provided for @labelRemarks.
  ///
  /// In en, this message translates to:
  /// **'Remarks'**
  String get labelRemarks;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ml'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ml':
      return AppLocalizationsMl();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
