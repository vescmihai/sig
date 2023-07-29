export 'marker_model.dart';
import 'dart:core';
import 'dart:convert';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;

class MarkerSuggestion {
  final int markerId;
  final String title;
  final String snippet;
  bool selected;

  MarkerSuggestion({
    required this.markerId,
    required this.title,
    required this.snippet,
    this.selected = false,
  });
}

class MarkerList {
  static Future<List<Marker>> getMarkers() async {
    final sectionJsonString =
        await rootBundle.loadString('assets/data/secciones.json');

    List<dynamic> sectionsJson = json.decode(sectionJsonString);

    List<Marker> markers = [];

    for (var item in sectionsJson) {
      Marker marker = Marker(
        markerId: item['code'].to,
        position: LatLng(item['latitud'], item['longitud']),
        infoWindow: InfoWindow(
          title: item['descripcion'],
          snippet: item['cod_edificio'].toString(),
        ),
        //icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed)
      );
      markers.add(marker);
    }
    return markers;
  }
}
