import 'package:flutter/material.dart';
import 'package:sig/src/utils/app_theme.dart';
import 'package:sig/src/view/body_app.dart';
import '../../src/view/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
      theme: AppThemeData.lightTheme,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/map':
            return MaterialPageRoute(builder: (context) => BodyApp());
          default:
            return MaterialPageRoute(builder: (context) => HomeScreen());
        }
      },
    );
  }
}
