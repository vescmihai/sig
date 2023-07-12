import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:math' show log2;
import 'dart:math' as math;
import 'dart:async';

//-------------------------main-------------------------------------
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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

//--------------------------view-------------------------------------------
class MapsScreen extends StatefulWidget {
  @override
  _MapsScreenState createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  GoogleMapController? _mapController;
  TextEditingController _searchController = TextEditingController();
  Set<Marker> _markers = _getMarkers();
  MarkerId? _selectedMarker;
  Map<MarkerId, BitmapDescriptor> _markerIcons = {};

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _updateMarkers();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _requestLocationPermission(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.hasData && snapshot.data == true) {
          return Column(
            //------------------------------------------------
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TypeAheadField(
                  textFieldConfiguration: TextFieldConfiguration(
                    controller: _searchController,
                    decoration: InputDecoration(
                      labelText: 'Buscar módulo',
                    ),
                  ),
                  suggestionsCallback: _getSuggestions,
                  itemBuilder: (context, suggestion) {
                    return ListTile(
                      title: Text(suggestion.title),
                      subtitle: Text(suggestion.snippet),
                    );
                  },
                  onSuggestionSelected: (suggestion) {
                    _selectMarker(suggestion.markerId);
                  },
                ),
              ),
              Expanded(
                child: GoogleMap(
                  onMapCreated: (controller) {
                    _mapController = controller;
                    _fitBounds();
                  },
                  initialCameraPosition: CameraPosition(
                    target: LatLng(-17.775615, -63.198539),
                    zoom: 14,
                  ),
                  markers: _markers,
                  onTap: (_) {
                    setState(() {
                      _selectedMarker = null;
                      _updateMarkers();
                    });
                  },
                ),
              ),
            ], //-------------------------------------------------------
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

//--------------------------model-----------------------------------------
  static Set<Marker> _getMarkers() {
    return <Marker>[
      Marker(
        markerId: MarkerId('COMEDOR UNICERSITARIO'),
        position: LatLng(-17.775615, -63.198539),
        infoWindow: InfoWindow(
          title: 'COMEDOR UNICERSITARIO',
          snippet: '292',
        ),
      ),
      Marker(
        markerId: MarkerId('ESTACIONAMIENTO GENERAL'),
        position: LatLng(-17.776145, -63.197362),
        infoWindow: InfoWindow(
          title: 'ESTACIONAMIENTO GENERAL',
          snippet: 'ESTACIO GENERAL',
        ),
      ),
      Marker(
        markerId: MarkerId('CANCHA 1'),
        position: LatLng(-17.776376, -63.197387),
        infoWindow: InfoWindow(
          title: 'CANCHA 1',
          snippet: 'CANCHA 1',
        ),
      ),
      Marker(
        markerId: MarkerId('CANCHA 2'),
        position: LatLng(-17.776511, -63.19741),
        infoWindow: InfoWindow(
          title: 'CANCHA 2',
          snippet: 'CANCHA 2',
        ),
      ),
      Marker(
        markerId: MarkerId(
            'DEPARTAMENTO DE EDUCACION A DISTANCIA Y TECNOLOGIA EDUCATIVA DEDTE'),
        position: LatLng(-17.778044, -63.191087),
        infoWindow: InfoWindow(
          title:
              'DEPARTAMENTO DE EDUCACION A DISTANCIA Y TECNOLOGIA EDUCATIVA DEDTE',
          snippet: 'DEDTE',
        ),
      ),
      Marker(
        markerId: MarkerId('DEFENSOR UNIVERSITARIO'),
        position: LatLng(-17.778208, -63.191071),
        infoWindow: InfoWindow(
          title: 'DEFENSOR UNIVERSITARIO',
          snippet: 'DEFENSOR UNIVERSITAR',
        ),
      ),
      Marker(
        markerId: MarkerId('INFORMACION CUP-PSA'),
        position: LatLng(-17.778685, -63.190615),
        infoWindow: InfoWindow(
          title: 'INFORMACION CUP-PSA',
          snippet: 'SECCION NF. CUP-PSA',
        ),
      ),
      Marker(
        markerId: MarkerId('VICERRECTORADO'),
        position: LatLng(-17.778333, -63.191472),
        infoWindow: InfoWindow(
          title: 'VICERRECTORADO',
          snippet: 'VICERRECTORADO',
        ),
      ),
      Marker(
        markerId: MarkerId('CLINICA ODONTOLOGICA'),
        position: LatLng(-17.777989, -63.190801),
        infoWindow: InfoWindow(
          title: 'CLINICA ODONTOLOGICA',
          snippet: 'CLINICA ODONTOLOGICA',
        ),
      ),
      Marker(
        markerId:
            MarkerId('UNIDAD DE POSTGRADO DE CIENCIAS EXACTAS Y TECNOLOGÍA'),
        position: LatLng(-17.778037, -63.190458),
        infoWindow: InfoWindow(
          title: 'UNIDAD DE POSTGRADO DE CIENCIAS EXACTAS Y TECNOLOGÍA',
          snippet: 'PTGRDO FAC. TEC.',
        ),
      ),
      Marker(
        markerId: MarkerId('ESTACIONAMIENTO DE LA FCET'),
        position: LatLng(-17.778404, -63.191101),
        infoWindow: InfoWindow(
          title: 'ESTACIONAMIENTO DE LA FCET',
          snippet: 'ESTACIO. FCET',
        ),
      ),
      Marker(
        markerId: MarkerId('UNIDAD DE POSTGRADO DE LA FACULTAD DE HUMANIDADES'),
        position: LatLng(-17.77632, -63.19096),
        infoWindow: InfoWindow(
          title: 'UNIDAD DE POSTGRADO DE LA FACULTAD DE HUMANIDADES',
          snippet: 'PTGRDO FAC. HUM',
        ),
      ),
      Marker(
        markerId: MarkerId('DIRECCION UNIVERSITARIA DE INVESTIGACION DUI'),
        position: LatLng(-17.776472, -63.190828),
        infoWindow: InfoWindow(
          title: 'DIRECCION UNIVERSITARIA DE INVESTIGACION DUI',
          snippet: 'DUI',
        ),
      ),
      Marker(
        markerId: MarkerId('DIRECCION DE INVESTIGACION DICIF'),
        position: LatLng(-17.776491, -63.190886),
        infoWindow: InfoWindow(
          title: 'DIRECCION DE INVESTIGACION DICIF',
          snippet: 'DICIT',
        ),
      ),
      Marker(
        markerId:
            MarkerId('DECANATO DE FACULTAD DE CIENCIA DE LA SALUD HUMANA'),
        position: LatLng(-17.776702, -63.190942),
        infoWindow: InfoWindow(
          title: 'DECANATO DE FACULTAD DE CIENCIA DE LA SALUD HUMANA',
          snippet: 'DECA. FACULTAD CSH',
        ),
      ),
      Marker(
        markerId: MarkerId('UNIDAD DE POSTGRADO DE LA SALUD HUMANA'),
        position: LatLng(-17.776695, -63.190845),
        infoWindow: InfoWindow(
          title: 'UNIDAD DE POSTGRADO DE LA SALUD HUMANA',
          snippet: 'PTGRO FAC. SALUD',
        ),
      ),
      Marker(
        markerId: MarkerId('DIRECCION DE CARRERA DE INGENIERIA INDUSTRIAL'),
        position: LatLng(-17.775283, -63.194561),
        infoWindow: InfoWindow(
          title: 'DIRECCION DE CARRERA DE INGENIERIA INDUSTRIAL',
          snippet: 'CARR. ING. INDUSTR',
        ),
      ),
      Marker(
        markerId:
            MarkerId('VICEDECANATO FACULTAD DE CIENCIAS EXACTAS Y TECNOLOGIA'),
        position: LatLng(-17.775519, -63.195685),
        infoWindow: InfoWindow(
          title: 'VICEDECANATO FACULTAD DE CIENCIAS EXACTAS Y TECNOLOGIA',
          snippet: 'VICEDECANATO FCET',
        ),
      ),
      Marker(
        markerId: MarkerId(
            'DIRECCION DE LA CARRERA DE INGENIERIA EN CONTROL DE PROCESOS QUIMICA INDUSTRIAL'),
        position: LatLng(-17.775511, -63.195682),
        infoWindow: InfoWindow(
          title:
              'DIRECCION DE LA CARRERA DE INGENIERIA EN CONTROL DE PROCESOS QUIMICA INDUSTRIAL',
          snippet: 'CARR: ING CTRL PROCE',
        ),
      ),
      Marker(
        markerId: MarkerId('DIRECCION DE LA CARRERA DE INGENIERIA PETROLERA'),
        position: LatLng(-17.775515, -63.195688),
        infoWindow: InfoWindow(
          title: 'DIRECCION DE LA CARRERA DE INGENIERIA PETROLERA',
          snippet: 'CARR. ING. PETROLERA',
        ),
      ),
      Marker(
        markerId: MarkerId(
            'DECANATO DE LA FACULTAD DE CIENCIAS EXACTA Y TECNOLOGIAS FGET'),
        position: LatLng(-17.775455, -63.195742),
        infoWindow: InfoWindow(
          title:
              'DECANATO DE LA FACULTAD DE CIENCIAS EXACTA Y TECNOLOGIAS FGET',
          snippet: 'DECA. FACULTAD  FCET',
        ),
      ),
      Marker(
        markerId: MarkerId('DIRECCION DE LA CARRERA DE INGENIERIA QUIMICA'),
        position: LatLng(-17.775459, -63.195744),
        infoWindow: InfoWindow(
          title: 'DIRECCION DE LA CARRERA DE INGENIERIA QUIMICA',
          snippet: 'CARR. ING. QUIMICA',
        ),
      ),
      Marker(
        markerId:
            MarkerId('DIRECCION DE LA CARRERA DE INGENIERIA EN ALIMENTOS'),
        position: LatLng(-17.775514, -63.195702),
        infoWindow: InfoWindow(
          title: 'DIRECCION DE LA CARRERA DE INGENIERIA EN ALIMENTOS',
          snippet: 'CARR. ING. ALIMENTOS',
        ),
      ),
      Marker(
        markerId: MarkerId('DIRECCION DE LA CARRERA DE INGENIERIA AMBIENTAL'),
        position: LatLng(-17.775515, -63.195705),
        infoWindow: InfoWindow(
          title: 'DIRECCION DE LA CARRERA DE INGENIERIA AMBIENTAL',
          snippet: 'CARR. ING. AMBIENTAL',
        ),
      ),
      Marker(
        markerId: MarkerId('DIRECCION DE LA CARRERA DE INGENIERIA CIVIL'),
        position: LatLng(-17.775519, -63.195708),
        infoWindow: InfoWindow(
          title: 'DIRECCION DE LA CARRERA DE INGENIERIA CIVIL',
          snippet: 'CARR. ING. CIVIL',
        ),
      ),
      Marker(
        markerId:
            MarkerId('DIRECCION DE LA CARRERA DE INGENIERIA ELECTROMECANICA'),
        position: LatLng(-17.775528, -63.195659),
        infoWindow: InfoWindow(
          title: 'DIRECCION DE LA CARRERA DE INGENIERIA ELECTROMECANICA',
          snippet: 'CARR. ING. ELECTROME',
        ),
      ),
      Marker(
        markerId: MarkerId('DIRECCION DE LA CARRERA DE COMERCIO INTERNACIONAL'),
        position: LatLng(-17.77553, -63.195601),
        infoWindow: InfoWindow(
          title: 'DIRECCION DE LA CARRERA DE COMERCIO INTERNACIONAL',
          snippet: 'CARR. COMERCION INTE',
        ),
      ),
      Marker(
        markerId: MarkerId('ESTACIONAMIENTO FCET'),
        position: LatLng(-17.775043, -63.1956),
        infoWindow: InfoWindow(
          title: 'ESTACIONAMIENTO FCET',
          snippet: 'ESTACIONA. FCET',
        ),
      ),
      Marker(
        markerId: MarkerId('DIRECCION DE LA CARRERA GESTION DEL TURISMO'),
        position: LatLng(-17.777784, -63.191545),
        infoWindow: InfoWindow(
          title: 'DIRECCION DE LA CARRERA GESTION DEL TURISMO',
          snippet: 'CARR. GESTION DE TUR',
        ),
      ),
      Marker(
        markerId: MarkerId('JEFATURA MUSEO NOEL KENF MERCADO'),
        position: LatLng(-17.777531, -63.191661),
        infoWindow: InfoWindow(
          title: 'JEFATURA MUSEO NOEL KENF MERCADO',
          snippet: 'MUSEO NOEL KENF M.',
        ),
      ),
      Marker(
        markerId: MarkerId(
            'DIRECCION DE TECNOLOGIAS DE LA INF, Y COMUNICACION. DTIC'),
        position: LatLng(-17.777146, -63.190794),
        infoWindow: InfoWindow(
          title: 'DIRECCION DE TECNOLOGIAS DE LA INF, Y COMUNICACION. DTIC',
          snippet: 'DTIC',
        ),
      ),
      Marker(
        markerId: MarkerId('DEPARTAMENTOS'),
        position: LatLng(-17.777186, -63.190777),
        infoWindow: InfoWindow(
          title: 'DEPARTAMENTOS',
          snippet: 'SECCION TITULOS',
        ),
      ),
      Marker(
        markerId: MarkerId('VENTANILLAS AUXILIARES'),
        position: LatLng(-17.777284, -63.190729),
        infoWindow: InfoWindow(
          title: 'VENTANILLAS AUXILIARES',
          snippet: 'VENTANILLAS AUXILIAR',
        ),
      ),
      Marker(
        markerId: MarkerId('INFORMACION'),
        position: LatLng(-17.777426, -63.190579),
        infoWindow: InfoWindow(
          title: 'INFORMACION',
          snippet: 'INFORMACION',
        ),
      ),
      Marker(
        markerId: MarkerId('DEPARTAMENTO DE TRAMITE REGISTRO Y TITULOS'),
        position: LatLng(-17.7775, -63.190551),
        infoWindow: InfoWindow(
          title: 'DEPARTAMENTO DE TRAMITE REGISTRO Y TITULOS',
          snippet: 'DPTO. REG. Y TITULO',
        ),
      ),
      Marker(
        markerId: MarkerId('CERTIFICADO NO DEUDOR'),
        position: LatLng(-17.777348, -63.190401),
        infoWindow: InfoWindow(
          title: 'CERTIFICADO NO DEUDOR',
          snippet: 'CERTIF. NO DEUDO',
        ),
      ),
      Marker(
        markerId:
            MarkerId('FEDERACION UNIVERSITARIA DE AUXILIARES DE DOCENCIA'),
        position: LatLng(-17.777362, -63.190439),
        infoWindow: InfoWindow(
          title: 'FEDERACION UNIVERSITARIA DE AUXILIARES DE DOCENCIA',
          snippet: 'FUAD',
        ),
      ),
      Marker(
        markerId: MarkerId('ADMINISTRACION PREDIOS DEL CAMPUS UNIVERSITARIOS'),
        position: LatLng(-17.777269, -63.190394),
        infoWindow: InfoWindow(
          title: 'ADMINISTRACION PREDIOS DEL CAMPUS UNIVERSITARIOS',
          snippet: 'ADMI. CAMPUS',
        ),
      ),
      Marker(
        markerId: MarkerId('DIRECCION DE CARRERA INGENIERIA INFORMATICA'),
        position: LatLng(-17.776183, -63.195021),
        infoWindow: InfoWindow(
          title: 'DIRECCION DE CARRERA INGENIERIA INFORMATICA',
          snippet: 'ING. INFORMATICA',
        ),
      ),
      Marker(
        markerId: MarkerId('DIRECCION DE CARRERA INGENIERIA EN SISTEMAS'),
        position: LatLng(-17.776183, -63.195021),
        infoWindow: InfoWindow(
          title: 'DIRECCION DE CARRERA INGENIERIA EN SISTEMAS',
          snippet: 'CARR. ING. DE SIST.',
        ),
      ),
      Marker(
        markerId: MarkerId(
            'DIRECCION DE CARRERA INGENIERIA EN REDES Y TELECOMUNICACIONES'),
        position: LatLng(-17.776183, -63.195021),
        infoWindow: InfoWindow(
          title:
              'DIRECCION DE CARRERA INGENIERIA EN REDES Y TELECOMUNICACIONES',
          snippet: 'CARR. ING. EN REDES',
        ),
      ),
      Marker(
        markerId: MarkerId(
            'DECANATO DE LA FACULTAD DE CIENCIAS DE LA COMPUTACION Y TELECOMUNICACIONES FICCT'),
        position: LatLng(-17.776183, -63.195021),
        infoWindow: InfoWindow(
          title:
              'DECANATO DE LA FACULTAD DE CIENCIAS DE LA COMPUTACION Y TELECOMUNICACIONES FICCT',
          snippet: 'DECANATO FICCT',
        ),
      ),
      Marker(
        markerId: MarkerId(
            'UNIDAD DE POSTGRADO E LA FACULTAD DE CIENCIAS DE LA COMPUTACION Y TELECOMUNICACIONES FICCT'),
        position: LatLng(-17.776844, -63.195632),
        infoWindow: InfoWindow(
          title:
              'UNIDAD DE POSTGRADO E LA FACULTAD DE CIENCIAS DE LA COMPUTACION Y TELECOMUNICACIONES FICCT',
          snippet: 'PTGRDO FICCT',
        ),
      ),
      Marker(
        markerId: MarkerId('Modulo 117'),
        position: LatLng(-17.777068, -63.191645),
        infoWindow: InfoWindow(
          title: 'Modulo 117',
          snippet: 'Modulo 117',
        ),
      ),
      Marker(
        markerId: MarkerId('Modulo 122'),
        position: LatLng(-17.778244, -63.190365),
        infoWindow: InfoWindow(
          title: 'Modulo 122',
          snippet: 'Modulo 122',
        ),
      ),
      Marker(
        markerId: MarkerId('Modulo 123'),
        position: LatLng(-17.778438, -63.190318),
        infoWindow: InfoWindow(
          title: 'Modulo 123',
          snippet: 'Modulo 123',
        ),
      ),
      Marker(
        markerId: MarkerId('Modulo 124'),
        position: LatLng(-17.778474, -63.190523),
        infoWindow: InfoWindow(
          title: 'Modulo 124',
          snippet: 'Modulo 124',
        ),
      ),
      Marker(
        markerId: MarkerId('Modulo 125'),
        position: LatLng(-17.778658, -63.190463),
        infoWindow: InfoWindow(
          title: 'Modulo 125',
          snippet: 'Modulo 125',
        ),
      ),
      Marker(
        markerId: MarkerId('Modulo 126'),
        position: LatLng(-17.77808, -63.19108),
        infoWindow: InfoWindow(
          title: 'Modulo 126',
          snippet: 'Modulo 126',
        ),
      ),
      Marker(
        markerId: MarkerId('Modulo 127'),
        position: LatLng(-17.778224, -63.190798),
        infoWindow: InfoWindow(
          title: 'Modulo 127',
          snippet: 'Modulo 127',
        ),
      ),
      Marker(
        markerId: MarkerId('Modulo 128'),
        position: LatLng(-17.777548, -63.190964),
        infoWindow: InfoWindow(
          title: 'Modulo 128',
          snippet: 'Modulo 128',
        ),
      ),
      Marker(
        markerId: MarkerId('Modulo 145'),
        position: LatLng(-17.778875, -63.190396),
        infoWindow: InfoWindow(
          title: 'Modulo 145',
          snippet: 'Modulo 145',
        ),
      ),
      Marker(
        markerId: MarkerId('Modulo 146'),
        position: LatLng(-17.777198, -63.191485),
        infoWindow: InfoWindow(
          title: 'Modulo 146',
          snippet: 'Modulo 146',
        ),
      ),
      Marker(
        markerId: MarkerId('Modulo 150'),
        position: LatLng(-17.776531, -63.190607),
        infoWindow: InfoWindow(
          title: 'Modulo 150',
          snippet: 'Modulo 150',
        ),
      ),
      Marker(
        markerId: MarkerId('Modulo 151'),
        position: LatLng(-17.777867, -63.19161),
        infoWindow: InfoWindow(
          title: 'Modulo 151',
          snippet: 'Modulo 151',
        ),
      ),
      Marker(
        markerId: MarkerId('Modulo 153'),
        position: LatLng(-17.777421, -63.191203),
        infoWindow: InfoWindow(
          title: 'Modulo 153',
          snippet: 'Modulo 153',
        ),
      ),
      Marker(
        markerId: MarkerId('Modulo 165'),
        position: LatLng(-17.776869, -63.191178),
        infoWindow: InfoWindow(
          title: 'Modulo 165',
          snippet: 'Modulo 165',
        ),
      ),
      Marker(
        markerId: MarkerId('Modulo 175'),
        position: LatLng(-17.775502, -63.191272),
        infoWindow: InfoWindow(
          title: 'Modulo 175',
          snippet: 'Modulo 175',
        ),
      ),
      Marker(
        markerId: MarkerId('Modulo 212'),
        position: LatLng(-17.775594, -63.193736),
        infoWindow: InfoWindow(
          title: 'Modulo 212',
          snippet: 'Modulo 212',
        ),
      ),
      Marker(
        markerId: MarkerId('Modulo 213'),
        position: LatLng(-17.776334, -63.193672),
        infoWindow: InfoWindow(
          title: 'Modulo 213',
          snippet: 'Modulo 213',
        ),
      ),
      Marker(
        markerId: MarkerId('Modulo 214'),
        position: LatLng(-17.776667, -63.193803),
        infoWindow: InfoWindow(
          title: 'Modulo 214',
          snippet: 'Modulo 214',
        ),
      ),
      Marker(
        markerId: MarkerId('Modulo 224'),
        position: LatLng(-17.775246, -63.194516),
        infoWindow: InfoWindow(
          title: 'Modulo 224',
          snippet: 'Modulo 224',
        ),
      ),
      Marker(
        markerId: MarkerId('Modulo 225'),
        position: LatLng(-17.775587, -63.194741),
        infoWindow: InfoWindow(
          title: 'Modulo 225',
          snippet: 'Modulo 225',
        ),
      ),
      Marker(
        markerId: MarkerId('Modulo 228'),
        position: LatLng(-17.776881, -63.194884),
        infoWindow: InfoWindow(
          title: 'Modulo 228',
          snippet: 'Modulo 228',
        ),
      ),
      Marker(
        markerId: MarkerId('Modulo 229'),
        position: LatLng(-17.776992, -63.194475),
        infoWindow: InfoWindow(
          title: 'Modulo 229',
          snippet: 'Modulo 229',
        ),
      ),
      Marker(
        markerId: MarkerId('Modulo 233'),
        position: LatLng(-17.774549, -63.195329),
        infoWindow: InfoWindow(
          title: 'Modulo 233',
          snippet: 'Modulo 233',
        ),
      ),
      Marker(
        markerId: MarkerId('Modulo 236'),
        position: LatLng(-17.776487, -63.195077),
        infoWindow: InfoWindow(
          title: 'Modulo 236',
          snippet: 'Modulo 236',
        ),
      ),
      Marker(
        markerId: MarkerId('Modulo 244'),
        position: LatLng(-17.77545, -63.195543),
        infoWindow: InfoWindow(
          title: 'Modulo 244',
          snippet: 'Modulo 244',
        ),
      ),
      Marker(
        markerId: MarkerId('Modulo 246'),
        position: LatLng(-17.776925, -63.195924),
        infoWindow: InfoWindow(
          title: 'Modulo 246',
          snippet: 'Modulo 246',
        ),
      ),
      Marker(
        markerId: MarkerId('Modulo 247'),
        position: LatLng(-17.777072, -63.195956),
        infoWindow: InfoWindow(
          title: 'Modulo 247',
          snippet: 'Modulo 247',
        ),
      ),
      Marker(
        markerId: MarkerId('Modulo 255'),
        position: LatLng(-17.776116, -63.196554),
        infoWindow: InfoWindow(
          title: 'Modulo 255',
          snippet: 'Modulo 255',
        ),
      ),
      Marker(
        markerId: MarkerId('Modulo 256'),
        position: LatLng(-17.776314, -63.196269),
        infoWindow: InfoWindow(
          title: 'Modulo 256',
          snippet: 'Modulo 256',
        ),
      ),
      Marker(
        markerId: MarkerId('Modulo 264'),
        position: LatLng(-17.77633, -63.196951),
        infoWindow: InfoWindow(
          title: 'Modulo 264',
          snippet: 'Modulo 264',
        ),
      ),
      Marker(
        markerId: MarkerId('Modulo 265'),
        position: LatLng(-17.776681, -63.196732),
        infoWindow: InfoWindow(
          title: 'Modulo 265',
          snippet: 'Modulo 265',
        ),
      ),
      Marker(
        markerId: MarkerId('Modulo 283'),
        position: LatLng(-17.776046, -63.198198),
        infoWindow: InfoWindow(
          title: 'Modulo 283',
          snippet: 'Modulo 283',
        ),
      ),
      Marker(
        markerId: MarkerId('Modulo 284'),
        position: LatLng(-17.77628, -63.19812),
        infoWindow: InfoWindow(
          title: 'Modulo 284',
          snippet: 'Modulo 284',
        ),
      ),
    ].toSet();
  }

//------------------------controller------------------------------------------------------
  Future<bool> _requestLocationPermission() async {
    PermissionStatus permission = await Permission.locationWhenInUse.status;

    if (permission != PermissionStatus.granted) {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.locationWhenInUse,
      ].request();

      bool permGranted = true;
      statuses.forEach((permission, permissionStatus) {
        if (permissionStatus != PermissionStatus.granted) {
          permGranted = false;
        }
      });

      return permGranted;
    } else {
      return true;
    }
  }

  List<MarkerSuggestion> _getSuggestions(String query) {
    List<MarkerSuggestion> suggestions = [];

    for (Marker marker in _getMarkers()) {
      if (marker.infoWindow != null &&
          marker.infoWindow.title != null &&
          marker.infoWindow.snippet != null &&
          marker.infoWindow.title!
              .toLowerCase()
              .contains(query.toLowerCase())) {
        suggestions.add(
          MarkerSuggestion(
            markerId: marker.markerId,
            title: marker.infoWindow.title!,
            snippet: marker.infoWindow.snippet!,
          ),
        );
      }
    }

    return suggestions;
  }

  void _selectMarker(MarkerId markerId) {
    setState(() {
      _selectedMarker = markerId;
      _updateMarkers();
    });

    if (_mapController != null) {
      Marker selectedMarker =
          _markers.firstWhere((marker) => marker.markerId == markerId);
      _mapController!.animateCamera(
        CameraUpdate.newLatLng(selectedMarker.position),
      );
    }
  }

  void _updateMarkers() {
    for (Marker marker in _markers) {
      _markerIcons[marker.markerId] = BitmapDescriptor.defaultMarkerWithHue(
        marker.markerId == _selectedMarker
            ? BitmapDescriptor.hueYellow
            : BitmapDescriptor.hueRed,
      );
    }

    setState(() {
      _markers = _markers.map((marker) {
        return marker.copyWith(
          iconParam: _markerIcons[marker.markerId],
        );
      }).toSet();
    });
  }

  void _fitBounds() {
    if (_markers.isNotEmpty && _mapController != null) {
      double minLat = double.infinity;
      double maxLat = double.negativeInfinity;
      double minLng = double.infinity;
      double maxLng = double.negativeInfinity;

      for (Marker marker in _markers) {
        final LatLng position = marker.position;

        minLat = math.min(minLat, position.latitude);
        maxLat = math.max(maxLat, position.latitude);
        minLng = math.min(minLng, position.longitude);
        maxLng = math.max(maxLng, position.longitude);
      }

      final LatLngBounds bounds = LatLngBounds(
        southwest: LatLng(minLat, minLng),
        northeast: LatLng(maxLat, maxLng),
      );

      final CameraUpdate cameraUpdate =
          CameraUpdate.newLatLngBounds(bounds, 50);
      _mapController!.animateCamera(cameraUpdate);
    }
  }
}

//---------------------model-------------------------------------
class MarkerSuggestion {
  final MarkerId markerId;
  final String title;
  final String snippet;

  MarkerSuggestion({
    required this.markerId,
    required this.title,
    required this.snippet,
  });
}
