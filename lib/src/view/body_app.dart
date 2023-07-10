import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:math' show log2;
import 'dart:math' as math;
import '../view/home_screen.dart';
import '../view/maps_screen.dart';
import '../controller/maps_controller.dart';
import '../model/marker_model.dart';

class BodyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('SIG APP - FASE III')),
        body: MapsScreen(),
      ),
    );
  }
}
