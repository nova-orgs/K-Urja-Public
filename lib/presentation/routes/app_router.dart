import 'package:flutter/material.dart';
import 'package:k_urja/presentation/screens/intro_page.dart';
import 'package:k_urja/presentation/screens/login_page.dart';
import 'package:k_urja/presentation/screens/signup_page.dart';
import 'package:k_urja/presentation/screens/home.dart';
import 'package:k_urja/presentation/audit/audit_entry_page.dart';
import 'package:k_urja/presentation/audit/audit_details_page.dart';
import 'package:k_urja/core/auth_provider.dart';
import 'package:go_router/go_router.dart';

import '../../data/local/database.dart';

class AppRouter {
  final AuthProvider authProvider;

  AppRouter(this.authProvider);

  late final router = GoRouter(
    initialLocation: '/home',
    refreshListenable: authProvider,
    routes: [
      GoRoute(
        path: '/intro',
        name: 'intro',
        builder: (context, state) => const IntroPage(),
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/signup',
        name: 'signup',
        builder: (context, state) {
          final email = state.uri.queryParameters['email'];
          return SignupPage(initialEmail: email);
        },
      ),
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/audit',
        name: 'audit',
        builder: (context, state) => const AuditEntryPage(),
      ),
      GoRoute(
        path: '/audit-details',
        name: 'audit-details',
        builder: (context, state) {
          if (state.extra is AuditData) {
            final auditData = state.extra as AuditData;
            return AuditDetailsPage(
              auditData: auditData,
              showSaveButton: false,
            );
          } else if (state.extra is Map<String, dynamic>) {
            final extra = state.extra as Map<String, dynamic>;
            final auditData = extra['auditData'] as AuditData;
            final showSaveButton = extra['showSaveButton'] as bool? ?? false;
            final savedAudit = extra['savedAudit'] as Audit?;
            return AuditDetailsPage(
              auditData: auditData,
              showSaveButton: showSaveButton,
              savedAudit: savedAudit,
            );
          }
          // Fallback or error case
          return const Scaffold(
            body: Center(child: Text('Error: Invalid data for audit details')),
          );
        },
      ),
    ],
    redirect: (context, state) {
      final isLoggedIn = authProvider.isLoggedIn;
      final goingToLogin = state.fullPath == '/login';
      final goingToSignup = state.fullPath == '/signup';
      final goingToIntro = state.fullPath == '/intro';

      if (!isLoggedIn && !goingToLogin && !goingToSignup && !goingToIntro) {
        return '/intro';
      }
      if (isLoggedIn && (goingToLogin || goingToSignup || goingToIntro)) {
        return '/home';
      }
      return null;
    },
  );
}
