import 'dart:convert';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/drift.dart' as drift;
import 'package:drift/native.dart';
import 'package:k_urja/data/models/audit_report_model.dart'
    as app_model; // Alias added
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';

class Audits extends Table {
  IntColumn get id => integer().autoIncrement()();

  // Link to local report table
  TextColumn get reportId => text().nullable().references(AuditReports, #id)();

  // Basic Details
  TextColumn get ownerName => text().nullable()();
  TextColumn get houseName => text().nullable()();
  TextColumn get mobileNumber => text().nullable()();
  TextColumn get consumerNo => text().nullable()();
  TextColumn get section => text().nullable()();
  TextColumn get ksebPostOffice => text().nullable()();
  TextColumn get pinCode => text().nullable()();
  TextColumn get panchayath => text().nullable()();
  TextColumn get biMonthlyConsumption => text().nullable()();
  TextColumn get biMonthlyBill => text().nullable()();
  TextColumn get memberCount => text().nullable()();
  TextColumn get daysUninhabited => text().nullable()();
  BoolColumn get hasSolarPlant => boolean().nullable()();
  TextColumn get solarCapacity => text().nullable()();
  TextColumn get tariffCategory => text().nullable()();
  TextColumn get connectedLoad => text().nullable()();
  TextColumn get natureOfConnection => text().nullable()();
  TextColumn get houseBuildingType => text().nullable()();
  TextColumn get ownOrRental => text().nullable()();
  TextColumn get noOfFloors => text().nullable()();
  TextColumn get totalBuildingArea => text().nullable()();
  TextColumn get typeOfEarthing => text().nullable()();
  TextColumn get controlSystems => text().nullable()();
  TextColumn get noOfMcbs => text().nullable()();
  TextColumn get typeOfEnergyMeter => text().nullable()();
  TextColumn get solarPlantType => text().nullable()();

  // Cooking & Fuel
  TextColumn get firewood => text().nullable()();
  TextColumn get lpg => text().nullable()();
  TextColumn get biogas => text().nullable()();
  TextColumn get induction => text().nullable()();
  TextColumn get otherFuel => text().nullable()();

  // Water Usage
  TextColumn get tankCapacity => text().nullable()();
  TextColumn get pumpCapacity => text().nullable()();
  TextColumn get fillingTime => text().nullable()();
  TextColumn get pumpCount => text().nullable()();
  TextColumn get waterSource => text().nullable()();
  TextColumn get waterUsage => text().nullable()();
  TextColumn get waterBill => text().nullable()();
  RealColumn get dailyPowerPump => real().nullable()();
  RealColumn get annualPowerPump => real().nullable()();

  // Appliances
  TextColumn get appliances => text().named('appliances')();
  TextColumn get heavyAppliances => text().named('heavy_appliances')();
  TextColumn get vehicles => text().named('vehicles')();

  // Supabase ID
  TextColumn get supabaseId => text().nullable()();
  TextColumn get userId => text().nullable()();

  // Meta
  BoolColumn get isUploaded => boolean().withDefault(const Constant(false))();
  BoolColumn get isUploading => boolean().withDefault(const Constant(false))();
  DateTimeColumn get completionTime => dateTime().nullable()();
}

class AuditReports extends Table {
  TextColumn get id => text()();
  TextColumn get userId => text()();
  RealColumn get totalCarbonFootprint => real().nullable()();
  RealColumn get electricityConsumption => real().nullable()();
  RealColumn get vehicleUsage => real().nullable()();
  RealColumn get gasAndOtherFuels => real().nullable()();
  RealColumn get wasteAndRecycling => real().nullable()();
  RealColumn get applianceCarbonFootprint => real().nullable()();
  RealColumn get heavyApplianceCarbonFootprint => real().nullable()();
  RealColumn get vehicleCarbonFootprint => real().nullable()();
  TextColumn get energySavingSuggestions => text().nullable()();
  TextColumn get energyEfficiencyImprovements => text().nullable()();
  TextColumn get renewableEnergyOpportunities => text().nullable()();
  TextColumn get estimatedAnnualSavings => text().nullable()();
  TextColumn get potentialInvestmentCost => text().nullable()();
  TextColumn get paybackPeriod => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class FullAudit {
  final Audit audit;
  final app_model.AuditReportModel
  report; // Use app_model.AuditReportModel explicitly

  FullAudit({required this.audit, required this.report});
}

@DriftDatabase(tables: [Audits, AuditReports])
class MyDatabase extends _$MyDatabase {
  // private constructor
  MyDatabase._() : super(_openConnection());

  // the only instance of this class
  static final MyDatabase instance = MyDatabase._();

  @override
  int get schemaVersion => 7;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) => m.createAll(),
    onUpgrade: (m, from, to) async {
      if (from < 2) {
        await m.addColumn(audits, audits.supabaseId);
      }
      if (from < 3) {
        await m.addColumn(audits, audits.userId);
      }
      if (from < 4) {
        await m.createTable(auditReports);
        await m.addColumn(audits, audits.reportId);
      }
      if (from < 5) {
        await m.drop(auditReports);
        await m.createTable(auditReports);
      }
      if (from < 6) {
        await m.addColumn(audits, audits.dailyPowerPump);
        await m.addColumn(audits, audits.annualPowerPump);
      }
      if (from < 7) {
        await m.addColumn(audits, audits.isUploading);
      }
    },
  );

  Future<List<FullAudit>> getPendingAudits() async {
    final query =
        select(audits).join([
          innerJoin(auditReports, auditReports.id.equalsExp(audits.reportId)),
        ])..where(
          audits.isUploaded.equals(false) &
              audits.supabaseId.isNull() &
              audits.isUploading.equals(false),
        );

    final results = await query.get();

    return results.map((row) {
      final driftReport = row.readTable(auditReports);
      return FullAudit(
        audit: row.readTable(audits),
        report: app_model.AuditReportModel(
          id: driftReport.id,
          userId: driftReport.userId,
          totalCarbonFootprint: driftReport.totalCarbonFootprint,
          electricityConsumption: driftReport.electricityConsumption,
          vehicleUsage: driftReport.vehicleUsage,
          gasAndOtherFuels: driftReport.gasAndOtherFuels,
          wasteAndRecycling: driftReport.wasteAndRecycling,
          applianceCarbonFootprint: driftReport.applianceCarbonFootprint,
          heavyApplianceCarbonFootprint:
              driftReport.heavyApplianceCarbonFootprint,
          vehicleCarbonFootprint: driftReport.vehicleCarbonFootprint,
          energySavingSuggestions: List<Map<String, dynamic>>.from(
            jsonDecode(driftReport.energySavingSuggestions ?? '[]'),
          ),
          energyEfficiencyImprovements: List<Map<String, dynamic>>.from(
            jsonDecode(driftReport.energyEfficiencyImprovements ?? '[]'),
          ),
          renewableEnergyOpportunities: List<Map<String, dynamic>>.from(
            jsonDecode(driftReport.renewableEnergyOpportunities ?? '[]'),
          ),
          estimatedAnnualSavings: jsonDecode(
            driftReport.estimatedAnnualSavings ?? 'null',
          ),
          potentialInvestmentCost: jsonDecode(
            driftReport.potentialInvestmentCost ?? 'null',
          ),
          paybackPeriod: jsonDecode(driftReport.paybackPeriod ?? 'null'),
          createdAt: driftReport.createdAt,
        ),
      );
    }).toList();
  }

  Future<void> insertReportAndLinkToAudit(
    int auditId,
    app_model.AuditReportModel report,
  ) async {
    await transaction(() async {
      await into(auditReports).insert(
        AuditReportsCompanion.insert(
          id: report.id,
          userId: report.userId,
          totalCarbonFootprint: drift.Value(report.totalCarbonFootprint),
          electricityConsumption: drift.Value(report.electricityConsumption),
          vehicleUsage: drift.Value(report.vehicleUsage),
          gasAndOtherFuels: drift.Value(report.gasAndOtherFuels),
          wasteAndRecycling: drift.Value(report.wasteAndRecycling),
          applianceCarbonFootprint: drift.Value(
            report.applianceCarbonFootprint,
          ),
          heavyApplianceCarbonFootprint: drift.Value(
            report.heavyApplianceCarbonFootprint,
          ),
          vehicleCarbonFootprint: drift.Value(report.vehicleCarbonFootprint),
          energySavingSuggestions: drift.Value(
            jsonEncode(report.energySavingSuggestions),
          ),
          energyEfficiencyImprovements: drift.Value(
            jsonEncode(report.energyEfficiencyImprovements),
          ),
          renewableEnergyOpportunities: drift.Value(
            jsonEncode(report.renewableEnergyOpportunities),
          ),
          estimatedAnnualSavings: drift.Value(
            jsonEncode(report.estimatedAnnualSavings),
          ),
          potentialInvestmentCost: drift.Value(
            jsonEncode(report.potentialInvestmentCost),
          ),
          paybackPeriod: drift.Value(jsonEncode(report.paybackPeriod)),
          createdAt: report.createdAt,
        ),
        mode: InsertMode.replace,
      );
      await (update(audits)..where((a) => a.id.equals(auditId))).write(
        AuditsCompanion(reportId: drift.Value(report.id)),
      );
    });
  }

  Future<void> markAuditsAsUploading(List<int> ids) {
    return (update(audits)..where((tbl) => tbl.id.isIn(ids))).write(
      const AuditsCompanion(isUploading: drift.Value(true)),
    );
  }

  Future<void> markAuditAsUploaded(int localId, String supabaseId) {
    return (update(audits)..where((tbl) => tbl.id.equals(localId))).write(
      AuditsCompanion(
        isUploaded: const drift.Value(true),
        isUploading: const drift.Value(false),
        supabaseId: drift.Value(supabaseId),
      ),
    );
  }

  Future<void> resetUploadingStatus(List<int> ids) {
    return (update(audits)..where((tbl) => tbl.id.isIn(ids))).write(
      const AuditsCompanion(isUploading: drift.Value(false)),
    );
  }

  Future<void> resetAllUploadingStatus() {
    return update(
      audits,
    ).write(const AuditsCompanion(isUploading: drift.Value(false)));
  }
}

LazyDatabase _openConnection() {
  // the LazyDatabase utility functions to give a database connection when it's
  // needed.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
