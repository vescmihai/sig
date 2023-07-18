import 'package:flutter/material.dart';
import 'package:sig/src/utils/app_theme.dart';
import 'gerald_screen.dart';

class BodyApp extends StatelessWidget {
  const BodyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemeData.lightTheme,
      home: Scaffold(
        appBar: AppBar(title: const Text('SIG APP - FASE IV')),
        body: const MapsScreen(),
      ),
    );
  }
}
