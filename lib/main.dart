import 'package:flutter/material.dart';
import 'package:flutter_push_notifications/app/pages/home/home_page.dart';
import 'package:flutter_push_notifications/app/services/onesignal_service.dart';
import 'package:flutter_push_notifications/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    OnesignalService.init(),
    // FirebaseService.init(),
  ]);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Push Notifications',
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.system,
      home: HomePage(homeNotifier: autoInjector.get()),
    );
  }
}
