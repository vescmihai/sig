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
  final String? piso;
  final int? capacidadMax;
  final int? area;

  Section({
    required this.code,
    this.codEdificio,
    this.edificio,
    required this.descripcion,
    this.tipo,
    required this.longitud,
    required this.latitud,
    this.recursos,
    this.piso,
    this.capacidadMax,
    this.area,
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
      String pisoString = '';
      String tipo = '';
      switch (item['piso']) {
        case 0:
          pisoString = 'Planta baja';
          break;
        case 1:
          pisoString = '1er piso';
          break;
        case 2:
          pisoString = '2do piso';
          break;
        case 3:
          pisoString = '3er piso';
          break;
        case 4:
          pisoString = '4to piso';
          break;
        case 5:
          pisoString = '5to piso';
          break;
        default:
      }

      switch (item['tipo'].toString().toUpperCase()) {
        case 'A':
          tipo = 'Aula';
          break;
        case 'C':
          tipo = 'Centro de cómputo';
          break;
        case 'L':
          tipo = 'Laboratorio';
          break;
        case 'O':
          tipo = 'Oficina';
          break;
        default:
          tipo = item['tipo'].toString();
          break;
      }

      var edificio = edificiosJson.firstWhere((record) =>
          record['code'].toString() == item['cod_edificio'].toString());

      Section seccion = Section(
        code: item['code'],
        longitud: item['longitud'],
        latitud: item['latitud'],
        descripcion: item['descripcion'].toString(),
        codEdificio: int.parse(item['cod_edificio'].toString()),
        edificio: edificio['descripcion'].toString(),
        piso: pisoString,
        recursos: item['recursos'].toString(),
        capacidadMax: item['capacidad_max'],
        tipo: tipo,
      );
      locations.add(seccion);
    }
    return locations;
  }
}
