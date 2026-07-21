// lib/presentation/screens/supabase_service.dart
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  static String? userId;
  static final _client = Supabase.instance.client;

  /// Save an audit; returns the inserted row map (single)
  static Future<Map<String, dynamic>> saveAudit(
    Map<String, dynamic> payload,
  ) async {
    final uid = userId;
    if (uid == null) throw Exception('Not authenticated: userId is null');

    final row = {...payload, 'user_id': uid};
    // Use select().limit(1).single() to return the inserted row
    final res = await _client
        .from('audits')
        .insert(row)
        .select()
        .limit(1)
        .single();
    return Map<String, dynamic>.from(res as Map);
  }

  /// Fetch last few totals for the current user.
  /// Returns an empty list when userId is null or query fails.
  static Future<List<Map<String, dynamic>>> fetchLastTotals({
    int limit = 7,
  }) async {
    final uid = userId;
    if (uid == null) return [];

    final resp = await _client
        .from('audits')
        .select('id, created_at, total_kg, owner_name')
        .eq('user_id', uid) // uid is non-null here
        .order('created_at', ascending: false)
        .limit(limit);

    return resp.map((e) => Map<String, dynamic>.from(e as Map)).toList();
  }
}
