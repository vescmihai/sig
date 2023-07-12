import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:math' show log2;
import 'dart:math' as math;
import 'gerald_screen.dart';
import './../controller/maps_controller.dart';
import './../model/marker_model.dart';
import './../widget/widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SIG UAGRM')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BackgroundImage(), // Aquí puedes proporcionar una URL de imagen si deseas
            ElevatedButton(
              child: Text('Iniciar'),
              onPressed: () {
                Navigator.pushNamed(context, '/map');
              },
            ),
          ],
        ),
      ),
    );
  }
}
