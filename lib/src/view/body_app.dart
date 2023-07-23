import 'package:flutter/material.dart';
import 'gerald_screen.dart';

class BodyApp extends StatelessWidget {
  const BodyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('SIG APP - FASE IV')),
        //resizeToAvoidBottomInset: false,
        body: const MapsScreen(),
    );
  }
}
