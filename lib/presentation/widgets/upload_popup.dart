import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:k_urja/core/data_uploader.dart';
import 'package:k_urja/data/local/database.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> showUploadPopup(BuildContext context) async {
  final db = MyDatabase.instance;
  final pendingAudits = await db.getPendingAudits();

  if (pendingAudits.isNotEmpty) {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (!connectivityResult.contains(ConnectivityResult.none)) {
      try {
        final dataUploader = DataUploader(
          MyDatabase.instance,
          Supabase.instance.client,
        );
        await dataUploader.uploadPendingAudits();
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Pending audits uploaded successfully!'),
            ),
          );
        }
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to upload pending audits: $e')),
          );
        }
      }
    }
  }
}
