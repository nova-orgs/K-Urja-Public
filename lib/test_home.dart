import 'package:flutter/material.dart';
import 'presentation/audit/audit_entry_page.dart'; // <-- adjust if your path is different

void main() {
  runApp(
    MaterialApp(
      title: 'Test Home Screen',
      debugShowCheckedModeBanner: false,
      home: const AuditEntryPage(), // your HomeScreen
    ),
  );
}
