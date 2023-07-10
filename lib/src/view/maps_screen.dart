import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import './../widget/widgets.dart';
import './../controller/maps_controller.dart';
import 'dart:async';

class MapsScreen extends StatefulWidget {
  @override
  _MapsScreenState createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  final MapsController _mapsController = MapsController();

  @override
  void dispose() {
    _mapsController.searchController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _initMap();
  }

  Future<void> _initMap() async {
    bool permissionGranted = await _mapsController.requestLocationPermission();
    if (permissionGranted) {
      setState(() {
        _mapsController.fitBounds();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _mapsController.requestLocationPermission(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.hasData && snapshot.data == true) {
          return Column(
            children: [
              SearchBarW(_mapsController),
              MapsView(_mapsController),
            ],
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
