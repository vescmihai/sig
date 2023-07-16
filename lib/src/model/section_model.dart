export 'marker_model.dart';
import 'dart:core';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class Section {
  final int code;
  final int? codEdificio;
  final String? edificio;
  final String descripcion;
  final String? tipo;
  final double longitud;
  final double latitud;
  final String? recursos;

  Section({
    required this.code,
    this.codEdificio,
    this.edificio,
    required this.descripcion,
    this.tipo,
    required this.longitud,
    required this.latitud,
    this.recursos,
  });
}

class SeccionList {
  static Future<List<Section>> getSections() async {
    final sectionJsonString =
        await rootBundle.loadString('assets/data/secciones.json');
    final edificiosJsonString =
        await rootBundle.loadString('assets/data/edificios.json');

    List<dynamic> sectionsJson = json.decode(sectionJsonString);
    List<dynamic> edificiosJson = json.decode(edificiosJsonString);

    List<Section> locations = [];

    for (var item in sectionsJson) {
      var edificio = edificiosJson
          .firstWhere((record) => record['code'].toString() == item['cod_edificio'].toString());

        Section seccion = Section(
          code: item['code'],
          longitud: item['longitud'],
          latitud: item['latitud'],
          descripcion: item['descripcion'].toString(),
          codEdificio: int.parse(item['cod_edificio'].toString()),
          edificio: edificio['descripcion'].toString(),
          recursos: item['recursos'].toString(),
          tipo: item['tipo'].toString(),
        );
        locations.add(seccion);
      
    }
    return locations;
  }
}
