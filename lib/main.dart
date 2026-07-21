import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:provider/provider.dart'; // Import provider
// import 'package:workmanager/workmanager.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:k_urja/presentation/routes/app_router.dart';
import 'package:k_urja/presentation/screens/supabase_service.dart';
import 'package:k_urja/core/user_cache.dart';
import 'package:k_urja/l10n/app_localizations.dart';
import 'package:k_urja/core/auth_provider.dart'; // Import AuthProvider
import 'package:k_urja/data/local/database.dart';

/*
@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    await dotenv.load(fileName: "assets/.env");
    final supabaseUrl = dotenv.env['SUPABASE_URL'];
    final supabaseAnonKey = dotenv.env['SUPABASE_ANON_KEY'];

    if (supabaseUrl == null || supabaseAnonKey == null) {
      return Future.value(false);
    }

    await Supabase.initialize(url: supabaseUrl, anonKey: supabaseAnonKey);

    final dataUploader = DataUploader(MyDatabase.instance, Supabase.instance.client);
    await dataUploader.uploadPendingAudits();
    return Future.value(true);
  });
}
*/

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  await dotenv.load(fileName: "assets/.env");

  // Load from environment variables
  final supabaseUrl = dotenv.env['SUPABASE_URL']!;
  final supabaseAnonKey = dotenv.env['SUPABASE_ANON_KEY']!;

  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseAnonKey);

  // Reset all uploading status on app startup
  await MyDatabase.instance.resetAllUploadingStatus();

  // Commenting out automatic upload on app startup
  // final dataUploader = DataUploader(
  //   MyDatabase.instance,
  //   Supabase.instance.client,
  // );
  // await dataUploader.uploadPendingAudits();

  // Workmanager().initialize(callbackDispatcher);
  // Workmanager().registerPeriodicTask("1", "uploadTask", frequency: const Duration(hours: 1));

  final currentUser = Supabase.instance.client.auth.currentUser;
  SupabaseService.userId = currentUser?.id;
  if (currentUser != null) {
    // Fetch and cache username once at app launch
    try {
      final profileData = await Supabase.instance.client
          .from('profiles')
          .select('full_name')
          .eq('id', currentUser.id)
          .single();
      if (profileData['full_name'] != null) {
        UserCache().setUsername(profileData['full_name'] as String);
      }
    } catch (e) {
      // ignore, fallback to null
    }
  }
  Supabase.instance.client.auth.onAuthStateChange.listen((data) async {
    final session = data.session;
    if (session != null) {
      // User is logged in, fetch and cache username
      try {
        final profileData = await Supabase.instance.client
            .from('profiles')
            .select('full_name')
            .eq('id', session.user.id)
            .single();
        if (profileData['full_name'] != null) {
          UserCache().setUsername(profileData['full_name'] as String);
        }
      } catch (e) {
        // Fallback to empty or handle error
        UserCache().setUsername('');
      }
    } else {
      // User is logged out, clear cache
      UserCache().setUsername('');
    }
    SupabaseService.userId = session?.user.id;
  });

  runApp(
    ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final appRouter = AppRouter(authProvider);

    return MaterialApp.router(
      title: 'K-Urja',
      //locale: const Locale('ml'),
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        textTheme: GoogleFonts.notoSansTextTheme(Theme.of(context).textTheme),
      ),
      routerConfig: appRouter.router,
    );
  }
}
