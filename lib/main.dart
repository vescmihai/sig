import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sig/src/view/body_app.dart';
import 'dart:math' show log2;
import 'dart:math' as math;
import 'dart:async';
import './src/view/maps_screen.dart';
import './src/controller/maps_controller.dart';
import './src/model/marker_model.dart';
import '../../src/view/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
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
