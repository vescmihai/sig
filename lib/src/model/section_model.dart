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
  final String? ciudad;
  final int? area;

  Section({
    required this.code,
    this.codEdificio,
    this.ciudad,
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
    final ciudadesJsonString =
        await rootBundle.loadString('assets/data/ciudades.json');

    List<dynamic> sectionsJson = json.decode(sectionJsonString);
    List<dynamic> edificiosJson = json.decode(edificiosJsonString);
    List<dynamic> ciudadesJson = json.decode(ciudadesJsonString);

    List<Section> locations = [];

    for (var item in sectionsJson) {
      String pisoString = '';
      String tipo = '';
      int? capacidadMax;

      if (item['piso'] != null) {
        switch (item['piso']) {
          case -1:
            pisoString = '';
            break;
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
            pisoString = item['piso'].toString();
            break;
        }
      }

      if (item['tipo'] != null) {
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
          case 'B':
            tipo = 'Baño';
            break;
          case 'M':
            tipo = 'Módulo';
            break;
          default:
            tipo = item['tipo'].toString();
            break;
        }
      }

      if (item['capacidad_max'] != null) {
        capacidadMax = item['capacidad_max'];
      }

      var edificio;

      if (item['cod_edificio'] != null) {
        edificio = edificiosJson.firstWhere(
          (record) =>
              record['code'].toString() == item['cod_edificio'].toString(),
          orElse: () => null,
        );
      }

      var ciudad = ciudadesJson.firstWhere(
        (record) =>
            record['IdCiudad'].toString() == item['id_ciudad'].toString(),
        orElse: () => null,
      );

      try {
        Section seccion = Section(
          code: int.parse(item['code'].toString()),
          ciudad: ciudad != null ? ciudad['descripcion'] : "",
          longitud: item['longitud'],
          latitud: item['latitud'],
          descripcion: item['descripcion'].toString(),
          codEdificio: edificio != null
              ? int.parse(item['cod_edificio'].toString())
              : null,
          edificio: edificio != null ? edificio['descripcion'] : "",
          piso: pisoString,
          recursos: item['recursos'].toString(),
          capacidadMax: capacidadMax,
          tipo: tipo,
        );
        locations.add(seccion);
      } catch (e) {
        print(e);
      }
    }

    return locations;
  }
}
