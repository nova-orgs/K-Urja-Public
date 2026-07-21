import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthProvider with ChangeNotifier {
  bool _isLoggedIn = false;
  String? _userEmail;
  StreamSubscription<AuthState>? _authStateSubscription;

  bool get isLoggedIn => _isLoggedIn;
  String? get userEmail => _userEmail;

  AuthProvider() {
    // Check initial session
    final initialSession = Supabase.instance.client.auth.currentSession;
    _isLoggedIn = initialSession != null;
    _userEmail = initialSession?.user.email;

    // Listen to auth state changes
    _authStateSubscription = Supabase.instance.client.auth.onAuthStateChange
        .listen((data) {
          final AuthChangeEvent event = data.event;
          final Session? session = data.session;

          switch (event) {
            case AuthChangeEvent.signedIn:
            case AuthChangeEvent.tokenRefreshed:
            case AuthChangeEvent.userUpdated:
              _isLoggedIn = session != null;
              _userEmail = session?.user.email;
              break;
            case AuthChangeEvent.signedOut:
            case AuthChangeEvent.userDeleted:
              _isLoggedIn = false;
              _userEmail = null;
              break;
            case AuthChangeEvent.passwordRecovery:
            case AuthChangeEvent.mfaChallengeVerified:
              // No change in login status
              break;
            case AuthChangeEvent.initialSession:
              // Already handled by checking currentSession
              break;
          }
          notifyListeners();
        });
  }

  Future<void> logout() async {
    await Supabase.instance.client.auth.signOut();
  }

  @override
  void dispose() {
    _authStateSubscription?.cancel();
    super.dispose();
  }
}
