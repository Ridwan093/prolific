
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:prolific/Mobile/Mobile_getStart/getSplazScreen.dart';
import 'package:prolific/Web/auth/WebAuth.dart';
import 'package:prolific/firebase_options.dart';
import 'package:prolific/webAndMobileLayout/responsiveLayout.dart';

final FirebaseMessaging messaging = FirebaseMessaging.instance;
GetIt locator = GetIt.instance;

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  await Hive.initFlutter();
  runApp(ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ScreenLayout(
        websreen: WebScreen(),
        mobilescreen: MobileSplaScre(),
      ),
    );
  }
}
