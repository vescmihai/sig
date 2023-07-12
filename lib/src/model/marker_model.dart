export 'marker_model.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class MarkerSuggestion {
  final MarkerId markerId;
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
  static List<Marker> getMarkers() {
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
      
      /******************************************FASE IV **************************************/

      Marker(
        markerId: MarkerId('ADMINISTRACION PREDIOS DEL CAMPUS UNIVERSITARIOS'),
        position: LatLng(-17.777269, -63.190394),
        infoWindow: InfoWindow(
          title: 'ADMINISTRACION PREDIOS DEL CAMPUS UNIVERSITARIOS',
          snippet: 'ADMI. CAMPUS',),
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
        position: LatLng(-17.776511, -63.197410),
        infoWindow: InfoWindow(
          title: 'CANCHA 2',
          snippet: 'CANCHA 2',
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
        markerId: MarkerId('COMEDOR UNIVERSITARIO'),
        position: LatLng(-17.775615, -63.198539),
        infoWindow: InfoWindow(
          title: 'COMEDOR UNIVERSITARIO',
          snippet: 'COMEDOR UNIVERSITARIO',
        ),
      ),

      Marker(
        markerId: MarkerId('DIRECCION DE TECNOLOGIAS DE LA INF, Y COMUNICACIÓN. DTIC'),
        position: LatLng(-17.777146, -63.190794),
        infoWindow: InfoWindow(
          title: 'DIRECCION DE TECNOLOGIAS DE LA INF, Y COMUNICACIÓN. DTIC',
          snippet: 'DTIC',
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
        markerId: MarkerId('ESTACIONAMIENTO FCET'),
        position: LatLng(-17.775043, -63.195600),
        infoWindow: InfoWindow(
          title: 'ESTACIONAMIENTO FCET',
          snippet: 'ESTACIONA. FCET',
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
        markerId: MarkerId('FEDERACION UNIVERSITARIA DE AUXILIARES DE DOCENCIA'),
        position: LatLng(-17.777362, -63.190439),
        infoWindow: InfoWindow(
          title: 'FEDERACION UNIVERSITARIA DE AUXILIARES DE DOCENCIA',
          snippet: 'FUAD',
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
        position: LatLng(-17.778080, -63.191080),
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
        position: LatLng(-17.777867, -63.191610),
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
        position: LatLng(-17.775450, -63.195543),
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
        position: LatLng(-17.776330, -63.196951),
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
        position: LatLng(-17.776280, -63.198120),
        infoWindow: InfoWindow(
          title: 'Modulo 284',
          snippet: 'Modulo 284',
        ),
      ),

      Marker(
        markerId: MarkerId('VENTANILLAS AUXILIARES'),
        position: LatLng(-17.777284, -63.190729),
        infoWindow: InfoWindow(
          title: 'VENTANILLAS AUXILIARES',
          snippet: 'VENTANILLAS AUXILIARES',
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
        markerId: MarkerId('Decanatura FINOR'),
        position: LatLng(-17.338610, -63.269031),
        infoWindow: InfoWindow(
          title: 'Decanatura FINOR',
          snippet: 'Decanatura FINOR',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Ciencias de la Educación'),
        position: LatLng(-17.338454, -63.268856),
        infoWindow: InfoWindow(
          title: 'Carrera de Ciencias de la Educación',
          snippet: 'Carrera de Ciencias de la Educación',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Contaduría Pública'),
        position: LatLng(-17.338461, -63.268878),
        infoWindow: InfoWindow(
          title: 'Carrera de Contaduría Pública',
          snippet: 'Carrera de Contaduría Pública',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Derecho'),
        position: LatLng(-17.338737, -63.269214),
        infoWindow: InfoWindow(
          title: 'Carrera de Derecho',
          snippet: 'Carrera de Derecho',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Enfermería'),
        position: LatLng(-17.338250, -63.269033),
        infoWindow: InfoWindow(
          title: 'Carrera de Enfermería',
          snippet: 'Carrera de Enfermería',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Ingeniería Comercial'),
        position: LatLng(-17.352313, -63.263406),
        infoWindow: InfoWindow(
          title: 'Carrera de Ingeniería Comercial',
          snippet: 'Carrera de Ingeniería Comercial',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Ingeniería Industrial'),
        position: LatLng(-17.339023, -63.268840),
        infoWindow: InfoWindow(
          title: 'Carrera de Ingeniería Industrial',
          snippet: 'Carrera de Ingeniería Industrial',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Ingeniería Petrolera'),
        position: LatLng(-17.338388, -63.267917),
        infoWindow: InfoWindow(
          title: 'Carrera de Ingeniería Petrolera',
          snippet: 'Carrera de Ingeniería Petrolera',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Ingeniería en Sistemas'),
        position: LatLng(-17.338608, -63.268046),
        infoWindow: InfoWindow(
          title: 'Carrera de Ingeniería en Sistemas',
          snippet: 'Carrera de Ingeniería en Sistemas',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Medicina'),
        position: LatLng(-17.339115, -63.269001),
        infoWindow: InfoWindow(
          title: 'Carrera de Medicina',
          snippet: 'Carrera de Medicina',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Medicina Veterinaria y Zootecnia'),
        position: LatLng(-17.338941, -63.268679),
        infoWindow: InfoWindow(
          title: 'Carrera de Medicina Veterinaria y Zootecnia',
          snippet: 'Carrera de Medicina Veterinaria y Zootecnia',
        ),
      ),

      Marker(
        markerId: MarkerId('Decanatura Facultad Integral de los Valles Cruceños'),
        position: LatLng(-18.486226, -64.100892),
        infoWindow: InfoWindow(
          title: 'Decanatura Facultad Integral de los Valles Cruceños',
          snippet: 'Decanatura Facultad Integral de los Valles Cruceños',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Contaduría Pública (Vallegrande)'),
        position: LatLng(-18.486320, -64.100708),
        infoWindow: InfoWindow(
          title: 'Carrera de Contaduría Pública (Vallegrande)',
          snippet: 'Carrera de Contaduría Pública (Vallegrande)',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Ingeniería Agropecuaria (Vallegrande)'),
        position: LatLng(-18.486524, -64.101091),
        infoWindow: InfoWindow(
          title: 'Carrera de Ingeniería Agropecuaria (Vallegrande)',
          snippet: 'Carrera de Ingeniería Agropecuaria (Vallegrande)',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Ingeniería en Sistemas (Vallegrande)'),
        position: LatLng(-18.486430, -64.100775),
        infoWindow: InfoWindow(
          title: 'Carrera de Ingeniería en Sistemas (Vallegrande)',
          snippet: 'Carrera de Ingeniería en Sistemas (Vallegrande)',
        ),
      ),

      Marker(
        markerId: MarkerId('Decanatura Facultad Politécnica'),
        position: LatLng(-17.775377, -63.194199),
        infoWindow: InfoWindow(
          title: 'Decanatura Facultad Politécnica',
          snippet: 'Decanatura Facultad Politécnica',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Construcciones Civiles'),
        position: LatLng(-17.775442, -63.193770),
        infoWindow: InfoWindow(
          title: 'Carrera de Construcciones Civiles',
          snippet: 'Carrera de Construcciones Civiles',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Electricidad Industrial'),
        position: LatLng(-17.775148, -63.193778),
        infoWindow: InfoWindow(
          title: 'Carrera de Electricidad Industrial',
          snippet: 'Carrera de Electricidad Industrial',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Electrónica'),
        position: LatLng(-17.775702, -63.193775),
        infoWindow: InfoWindow(
          title: 'Carrera de Electrónica',
          snippet: 'Carrera de Electrónica',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Ingeniería en Agrimensura'),
        position: LatLng(-17.775624, -63.193756),
        infoWindow: InfoWindow(
          title: 'Carrera de Ingeniería en Agrimensura',
          snippet: 'Carrera de Ingeniería en Agrimensura',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Ingeniería en Materiales'),
        position: LatLng(-17.775225, -63.194125),
        infoWindow: InfoWindow(
          title: 'Carrera de Ingeniería en Materiales',
          snippet: 'Carrera de Ingeniería en Materiales',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Ingeniería en Metalurgia'),
        position: LatLng(-17.775225, -63.194125),
        infoWindow: InfoWindow(
          title: 'Carrera de Ingeniería en Metalurgia',
          snippet: 'Carrera de Ingeniería en Metalurgia',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Licenciatura en Ofimática'),
        position: LatLng(-17.775465, -63.193801),
        infoWindow: InfoWindow(
          title: 'Carrera de Licenciatura en Ofimática',
          snippet: 'Carrera de Licenciatura en Ofimática',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Mecánica General'),
        position: LatLng(-17.775509, -63.194117),
        infoWindow: InfoWindow(
          title: 'Carrera de Mecánica General',
          snippet: 'Carrera de Mecánica General',
        ),
      ),

      Marker(
        markerId: MarkerId('Unidades Académica El Torno'),
        position: LatLng(-17.981956, -63.373469),
        infoWindow: InfoWindow(
          title: 'Unidades Académica El Torno',
          snippet: 'Unidades Académica El Torno',
        ),
      ),

      Marker(
        markerId: MarkerId('Unidades Académica Puerto Suarez'),
        position: LatLng(-18.994190, -57.781132),
        infoWindow: InfoWindow(
          title: 'Unidades Académica Puerto Suarez',
          snippet: 'Unidades Académica Puerto Suarez',
        ),
      ),

      Marker(
        markerId: MarkerId('Decanatura Facultad de Ciencias Veterinarias'),
        position: LatLng(-17.776849, -63.194832),
        infoWindow: InfoWindow(
          title: 'Decanatura Facultad de Ciencias Veterinarias',
          snippet: 'Decanatura Facultad de Ciencias Veterinarias',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Medicina Veterinaria y Zootecnia (Santa Cruz)'),
        position: LatLng(-17.776849, -63.194832),
        infoWindow: InfoWindow(
          title: 'Carrera de Medicina Veterinaria y Zootecnia (Santa Cruz)',
          snippet: 'Carrera de Medicina Veterinaria y Zootecnia (Santa Cruz)',
        ),
      ),

      Marker(
        markerId: MarkerId('Decanatura Facultad de Humanidades'),
        position: LatLng(-17.774657, -63.196569),
        infoWindow: InfoWindow(
          title: 'Decanatura Facultad de Humanidades',
          snippet: 'Decanatura Facultad de Humanidades',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Actividad Física'),
        position: LatLng(-17.774743, -63.196738),
        infoWindow: InfoWindow(
          title: 'Carrera de Actividad Física',
          snippet: 'Carrera de Actividad Física',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Ciencias de la Comunicación'),
        position: LatLng(-17.774733, -63.196552),
        infoWindow: InfoWindow(
          title: 'Carrera de Ciencias de la Comunicación',
          snippet: 'Carrera de Ciencias de la Comunicación',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Ciencias de la Educación'),
        position: LatLng(-17.774749, -63.196881),
        infoWindow: InfoWindow(
          title: 'Carrera de Ciencias de la Educación',
          snippet: 'Carrera de Ciencias de la Educación',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Gestión del Turismo'),
        position: LatLng(-17.774485, -63.196777),
        infoWindow: InfoWindow(
          title: 'Carrera de Gestión del Turismo',
          snippet: 'Carrera de Gestión del Turismo',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Lenguas Modernas y Filología Hispánica'),
        position: LatLng(-17.782313, -63.179364),
        infoWindow: InfoWindow(
          title: 'Carrera de Lenguas Modernas y Filología Hispánica',
          snippet: 'Carrera de Lenguas Modernas y Filología Hispánica',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Psicología'),
        position: LatLng(-17.774738, -63.196543),
        infoWindow: InfoWindow(
          title: 'Carrera de Psicología',
          snippet: 'Carrera de Psicología',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Sociología'),
        position: LatLng(-17.775046, -63.196938),
        infoWindow: InfoWindow(
          title: 'Carrera de Sociología',
          snippet: 'Carrera de Sociología',
        ),
      ),

      Marker(
        markerId: MarkerId('Decanatura Facultad de Ciencias Agrícolas'),
        position: LatLng(-17.699148, -63.147904),
        infoWindow: InfoWindow(
          title: 'Decanatura Facultad de Ciencias Agrícolas',
          snippet: 'Decanatura Facultad de Ciencias Agrícolas',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Biología'),
        position: LatLng(-17.698152, -63.147582),
        infoWindow: InfoWindow(
          title: 'Carrera de Biología',
          snippet: 'Carrera de Biología',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Ciencias Ambientales'),
        position: LatLng(-17.698065, -63.147545),
        infoWindow: InfoWindow(
          title: 'Carrera de Ciencias Ambientales',
          snippet: 'Carrera de Ciencias Ambientales',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Ingeniería Agronómica'),
        position: LatLng(-17.698210, -63.147590),
        infoWindow: InfoWindow(
          title: 'Carrera de Ingeniería Agronómica',
          snippet: 'Carrera de Ingeniería Agronómica',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera Ingeniería Agrícola (Montero)'),
        position: LatLng(-17.319111, -63.262142),
        infoWindow: InfoWindow(
          title: 'Carrera Ingeniería Agrícola (Montero)',
          snippet: 'Carrera Ingeniería Agrícola (Montero)',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera Ingeniería Forestal'),
        position: LatLng(-17.699676, -63.148063),
        infoWindow: InfoWindow(
          title: 'Carrera Ingeniería Forestal',
          snippet: 'Carrera Ingeniería Forestal',
        ),
      ),

      Marker(
        markerId: MarkerId('Decanatura Facultad de Ciencias Contables, Auditoría, Sistemas de Control de Gestión y Finanzas'),
        position: LatLng(-17.776395, -63.194033),
        infoWindow: InfoWindow(
          title: 'Decanatura Facultad de Ciencias Contables, Auditoría, Sistemas de Control de Gestión y Finanzas',
          snippet: 'Decanatura Facultad de Ciencias Contables, Auditoría, Sistemas de Control de Gestión y Finanzas',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrea de Contaduría Pública'),
        position: LatLng(-17.776306, -63.194177),
        infoWindow: InfoWindow(
          title: 'Carrea de Contaduría Pública',
          snippet: 'Carrea de Contaduría Pública',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Información y Control de Gestión'),
        position: LatLng(-17.776704, -63.193857),
        infoWindow: InfoWindow(
          title: 'Carrera de Información y Control de Gestión',
          snippet: 'Carrera de Información y Control de Gestión',
        ),
      ),

      Marker(
        markerId: MarkerId('Decanatura Facultad de Ciencias de la Salud Humana'),
        position: LatLng(-17.774857, -63.197753),
        infoWindow: InfoWindow(
          title: 'Decanatura Facultad de Ciencias de la Salud Humana',
          snippet: 'Decanatura Facultad de Ciencias de la Salud Humana',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera Enfermería'),
        position: LatLng(-17.774909, -63.197662),
        infoWindow: InfoWindow(
          title: 'Carrera Enfermería',
          snippet: 'Carrera Enfermería',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Medicina'),
        position: LatLng(-17.775250, -63.198152),
        infoWindow: InfoWindow(
          title: 'Carrera de Medicina',
          snippet: 'Carrera de Medicina',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Odontología'),
        position: LatLng(-17.774964, -63.198322),
        infoWindow: InfoWindow(
          title: 'Carrera de Odontología',
          snippet: 'Carrera de Odontología',
        ),
      ),

      Marker(
        markerId: MarkerId('Decanatura Facultad de Ciencias del Hábitat, Diseño y Arte'),
        position: LatLng(-17.770112, -63.191995),
        infoWindow: InfoWindow(
          title: 'Decanatura Facultad de Ciencias del Hábitat, Diseño y Arte',
          snippet: 'Decanatura Facultad de Ciencias del Hábitat, Diseño y Arte',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Arquitectura'),
        position: LatLng(-17.770101, -63.192009),
        infoWindow: InfoWindow(
          title: 'Carrera de Arquitectura',
          snippet: 'Carrera de Arquitectura',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Arte'),
        position: LatLng(-17.779920, -63.183385),
        infoWindow: InfoWindow(
          title: 'Carrera de Arte',
          snippet: 'Carrera de Arte',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Diseño Integral'),
        position: LatLng(-17.769779, -63.192049),
        infoWindow: InfoWindow(
          title: 'Carrera de Diseño Integral',
          snippet: 'Carrera de Diseño Integral',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Planificación Territorial'),
        position: LatLng(-17.769777, -63.191777),
        infoWindow: InfoWindow(
          title: 'Carrera de Planificación Territorial',
          snippet: 'Carrera de Planificación Territorial',
        ),
      ),

      Marker(
        markerId: MarkerId('Decanatura Facultad Integral del Chaco (FICH)'),
        position: LatLng(-20.033085, -63.527962),
        infoWindow: InfoWindow(
          title: 'Decanatura Facultad Integral del Chaco (FICH)',
          snippet: 'Decanatura Facultad Integral del Chaco (FICH)',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Administración de Empresas'),
        position: LatLng(-20.033085, -63.527962),
        infoWindow: InfoWindow(
          title: 'Carrera de Administración de Empresas',
          snippet: 'Carrera de Administración de Empresas',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Ciencias de la Educación'),
        position: LatLng(-20.033085, -63.527962),
        infoWindow: InfoWindow(
          title: 'Carrera de Ciencias de la Educación',
          snippet: 'Carrera de Ciencias de la Educación',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Contaduría Pública'),
        position: LatLng(-20.033085, -63.527962),
        infoWindow: InfoWindow(
          title: 'Carrera de Contaduría Pública',
          snippet: 'Carrera de Contaduría Pública',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Derecho'),
        position: LatLng(-20.033085, -63.527962),
        infoWindow: InfoWindow(
          title: 'Carrera de Derecho',
          snippet: 'Carrera de Derecho',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Enfermería'),
        position: LatLng(-20.033085, -63.527962),
        infoWindow: InfoWindow(
          title: 'Carrera de Enfermería',
          snippet: 'Carrera de Enfermería',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Ingeniería Industrial'),
        position: LatLng(-20.033085, -63.527962),
        infoWindow: InfoWindow(
          title: 'Carrera de Ingeniería Industrial',
          snippet: 'Carrera de Ingeniería Industrial',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Ingeniería Informática'),
        position: LatLng(-20.033085, -63.527962),
        infoWindow: InfoWindow(
          title: 'Carrera de Ingeniería Informática',
          snippet: 'Carrera de Ingeniería Informática',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Ingeniería del Petróleo y Gas Natural'),
        position: LatLng(-20.033085, -63.527962),
        infoWindow: InfoWindow(
          title: 'Carrera de Ingeniería del Petróleo y Gas Natural',
          snippet: 'Carrera de Ingeniería del Petróleo y Gas Natural',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Ingeniería en Agropecuaria'),
        position: LatLng(-20.033085, -63.527962),
        infoWindow: InfoWindow(
          title: 'Carrera de Ingeniería en Agropecuaria',
          snippet: 'Carrera de Ingeniería en Agropecuaria',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Ingeniería en Sistemas'),
        position: LatLng(-20.033085, -63.527962),
        infoWindow: InfoWindow(
          title: 'Carrera de Ingeniería en Sistemas',
          snippet: 'Carrera de Ingeniería en Sistemas',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Monitoreo Socioambiental'),
        position: LatLng(-20.033085, -63.527962),
        infoWindow: InfoWindow(
          title: 'Carrera de Monitoreo Socioambiental',
          snippet: 'Carrera de Monitoreo Socioambiental',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Odontología'),
        position: LatLng(-20.033085, -63.527962),
        infoWindow: InfoWindow(
          title: 'Carrera de Odontología',
          snippet: 'Carrera de Odontología',
        ),
      ),

      Marker(
        markerId: MarkerId('Decanatura Facultad Integral del Noreste (FINE)'),
        position: LatLng(-16.910514, -62.621272),
        infoWindow: InfoWindow(
          title: 'Decanatura Facultad Integral del Noreste (FINE)',
          snippet: 'Decanatura Facultad Integral del Noreste (FINE)',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Ciencias de la Educación'),
        position: LatLng(-16.910514, -62.621272),
        infoWindow: InfoWindow(
          title: 'Carrera de Ciencias de la Educación',
          snippet: 'Carrera de Ciencias de la Educación',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Contaduría Pública'),
        position: LatLng(-16.910514, -62.621272),
        infoWindow: InfoWindow(
          title: 'Carrera de Contaduría Pública',
          snippet: 'Carrera de Contaduría Pública',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Enfermería'),
        position: LatLng(-16.910514, -62.621272),
        infoWindow: InfoWindow(
          title: 'Carrera de Enfermería',
          snippet: 'Carrera de Enfermería',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Ing. Agropecuaria'),
        position: LatLng(-16.910514, -62.621272),
        infoWindow: InfoWindow(
          title: 'Carrera de Ing. Agropecuaria',
          snippet: 'Carrera de Ing. Agropecuaria',
        ),
      ),

      Marker(
        markerId: MarkerId('Decanatura Facultad de Ingeniería en Ciencias de la Computación y Telecomunicaciones (FICCT)'),
        position: LatLng(-17.776130, -63.194990),
        infoWindow: InfoWindow(
          title: 'Decanatura Facultad de Ingeniería en Ciencias de la Computación y Telecomunicaciones (FICCT)',
          snippet: 'Decanatura Facultad de Ingeniería en Ciencias de la Computación y Telecomunicaciones (FICCT)',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Ingeniería Informática'),
        position: LatLng(-17.776130, -63.194960),
        infoWindow: InfoWindow(
          title: 'Carrera de Ingeniería Informática',
          snippet: 'Carrera de Ingeniería Informática',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Ingeniería en Redes y Telecomunicaciones'),
        position: LatLng(-17.776130, -63.195090),
        infoWindow: InfoWindow(
          title: 'Carrera de Ingeniería en Redes y Telecomunicaciones',
          snippet: 'Carrera de Ingeniería en Redes y Telecomunicaciones',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Ingeniería en Sistemas'),
        position: LatLng(-17.776130, -63.195100),
        infoWindow: InfoWindow(
          title: 'Carrera de Ingeniería en Sistemas',
          snippet: 'Carrera de Ingeniería en Sistemas',
        ),
      ),

      Marker(
        markerId: MarkerId('Decanatura Facultad Integral Chiquitana (FAICHI)'),
        position: LatLng(-16.384384, -60.967465),
        infoWindow: InfoWindow(
          title: 'Decanatura Facultad Integral Chiquitana (FAICHI)',
          snippet: 'Decanatura Facultad Integral Chiquitana (FAICHI)',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Contaduría Pública'),
        position: LatLng(-16.384350, -60.967710),
        infoWindow: InfoWindow(
          title: 'Carrera de Contaduría Pública',
          snippet: 'Carrera de Contaduría Pública',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Ing. Agropecuaria'),
        position: LatLng(-16.384520, -60.967770),
        infoWindow: InfoWindow(
          title: 'Carrera de Ing. Agropecuaria',
          snippet: 'Carrera de Ing. Agropecuaria',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Zootecnia'),
        position: LatLng(-16.384760, -60.967680),
        infoWindow: InfoWindow(
          title: 'Carrera de Zootecnia',
          snippet: 'Carrera de Zootecnia',
        ),
      ),

      Marker(
        markerId: MarkerId('Escalafón Docente'),
        position: LatLng(-17.777717, -63.191628),
        infoWindow: InfoWindow(
          title: 'Escalafón Docente',
          snippet: 'Escalafón Docente',
        ),
      ),

      Marker(
        markerId: MarkerId('Evaluación y Acreditación'),
        position: LatLng(-17.774557, -63.192523),
        infoWindow: InfoWindow(
          title: 'Evaluación y Acreditación',
          snippet: 'Evaluación y Acreditación',
        ),
      ),

      Marker(
        markerId: MarkerId('Trámites y Registros'),
        position: LatLng(-17.777463, -63.190315),
        infoWindow: InfoWindow(
          title: 'Trámites y Registros',
          snippet: 'Trámites y Registros',
        ),
      ),

      Marker(
        markerId: MarkerId('Títulos'),
        position: LatLng(-17.777400, -63.190319),
        infoWindow: InfoWindow(
          title: 'Títulos',
          snippet: 'Títulos',
        ),
      ),

      Marker(
        markerId: MarkerId('Dirección de Investigación Científica e Innovación Tecnológica (DICiT)'),
        position: LatLng(-17.776180, -63.190899),
        infoWindow: InfoWindow(
          title: 'Dirección de Investigación Científica e Innovación Tecnológica (DICiT)',
          snippet: 'Dirección de Investigación Científica e Innovación Tecnológica (DICiT)',
        ),
      ),

      Marker(
        markerId: MarkerId('Escuela de Postgrado'),
        position: LatLng(-17.792669, -63.181845),
        infoWindow: InfoWindow(
          title: 'Escuela de Postgrado',
          snippet: 'Escuela de Postgrado',
        ),
      ),

      Marker(
        markerId: MarkerId('Orientación Vocacional'),
        position: LatLng(-17.778778, -63.192805),
        infoWindow: InfoWindow(
          title: 'Orientación Vocacional',
          snippet: 'Orientación Vocacional',
        ),
      ),

      Marker(
        markerId: MarkerId('Corte Electoral Universitaria'),
        position: LatLng(-17.777776, -63.192049),
        infoWindow: InfoWindow(
          title: 'Corte Electoral Universitaria',
          snippet: 'Corte Electoral Universitaria',
        ),
      ),

      Marker(
        markerId: MarkerId('Defensoría Universitaria'),
        position: LatLng(-17.778565, -63.192848),
        infoWindow: InfoWindow(
          title: 'Defensoría Universitaria',
          snippet: 'Defensoría Universitaria',
        ),
      ),

      Marker(
        markerId: MarkerId('Tribunal de Justicia Universitaria'),
        position: LatLng(-17.777524, -63.192475),
        infoWindow: InfoWindow(
          title: 'Tribunal de Justicia Universitaria',
          snippet: 'Tribunal de Justicia Universitaria',
        ),
      ),

      Marker(
        markerId: MarkerId('Instituto de Capacitación Popular'),
        position: LatLng(-17.777668, -63.165449),
        infoWindow: InfoWindow(
          title: 'Instituto de Capacitación Popular',
          snippet: 'Instituto de Capacitación Popular',
        ),
      ),

      Marker(
        markerId: MarkerId('Instituto de Investigación de la Facultad de Humanidades (INIFH)'),
        position: LatLng(-17.774209, -63.196905),
        infoWindow: InfoWindow(
          title: 'Instituto de Investigación de la Facultad de Humanidades (INIFH)',
          snippet: 'Instituto de Investigación de la Facultad de Humanidades (INIFH)',
        ),
      ),

      Marker(
        markerId: MarkerId('Instituto de Investigaciones Agrícolas El Vallecito'),
        position: LatLng(-17.708482, -63.147389),
        infoWindow: InfoWindow(
          title: 'Instituto de Investigaciones Agrícolas El Vallecito',
          snippet: 'Instituto de Investigaciones Agrícolas El Vallecito',
        ),
      ),

      Marker(
        markerId: MarkerId('Instituto de Investigaciones Económicas y Sociales José Ortiz Mercado'),
        position: LatLng(-17.774241, -63.193981),
        infoWindow: InfoWindow(
          title: 'Instituto de Investigaciones Económicas y Sociales José Ortiz Mercado',
          snippet: 'Instituto de Investigaciones Económicas y Sociales José Ortiz Mercado',
        ),
      ),

      Marker(
        markerId: MarkerId('Instituto de Investigaciones Forestales'),
        position: LatLng(-17.819368, -63.181460),
        infoWindow: InfoWindow(
          title: 'Instituto de Investigaciones Forestales',
          snippet: 'Inst Inv. Forestal',
        ),
      ),

      Marker(
        markerId: MarkerId('Museo de Historia'),
        position: LatLng(-17.782958, -63.183188),
        infoWindow: InfoWindow(
          title: 'Museo de Historia',
          snippet: 'Museo Historia',
        ),
      ),

      Marker(
        markerId: MarkerId('Museo de Historia Natural Noel Kempff Mercado'),
        position: LatLng(-17.792665, -63.181890),
        infoWindow: InfoWindow(
          title: 'Museo de Historia Natural Noel Kempff Mercado',
          snippet: 'Museo Noel Kempff',
        ),
      ),

      Marker(
        markerId: MarkerId('Federación Universitaria de Profesores (FUP)'),
        position: LatLng(-17.774332, -63.192590),
        infoWindow: InfoWindow(
          title: 'Federación Universitaria de Profesores (FUP)',
          snippet: 'FUP',
        ),
      ),

      Marker(
        markerId: MarkerId('Federación Universitaria Local (FUL)'),
        position: LatLng(-17.778436, -63.192302),
        infoWindow: InfoWindow(
          title: 'Federación Universitaria Local (FUL)',
          snippet: 'FUL',
        ),
      ),

      Marker(
        markerId: MarkerId('Sindicato de Trabajadores Universitario (STU)'),
        position: LatLng(-17.779757, -63.190906),
        infoWindow: InfoWindow(
          title: 'Sindicato de Trabajadores Universitario (STU)',
          snippet: 'STU',
        ),
      ),

      Marker(
        markerId: MarkerId('Decanatura Facultad Integral de Ichilo (FINI)'),
        position: LatLng(-17.396969, -63.877942),
        infoWindow: InfoWindow(
          title: 'Decanatura Facultad Integral de Ichilo (FINI)',
          snippet: 'Deca FINI',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Administración de Empresas'),
        position: LatLng(-17.397058, -63.878022),
        infoWindow: InfoWindow(
          title: 'Carrera de Administración de Empresas',
          snippet: 'Carr Administración',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Ciencias de la Educación'),
        position: LatLng(-17.397019, -63.878004),
        infoWindow: InfoWindow(
          title: 'Carrera de Ciencias de la Educación',
          snippet: 'Carr Cs de la Educacion',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Contaduría Pública'),
        position: LatLng(-17.396911, -63.877940),
        infoWindow: InfoWindow(
          title: 'Carrera de Contaduría Pública',
          snippet: 'Carr Cont. Pública',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Derecho'),
        position: LatLng(-17.396943, -63.877957),
        infoWindow: InfoWindow(
          title: 'Carrera de Derecho',
          snippet: 'Carr Derecho',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Enfermería'),
        position: LatLng(-17.396996, -63.877983),
        infoWindow: InfoWindow(
          title: 'Carrera de Enfermería',
          snippet: 'Carr Enfermería',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Ingeniería Agropecuaria'),
        position: LatLng(-17.396933, -63.877921),
        infoWindow: InfoWindow(
          title: 'Carrera de Ingeniería Agropecuaria',
          snippet: 'Carr Ing. Agropecuaria',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Ingeniería Comercial'),
        position: LatLng(-17.397060, -63.878011),
        infoWindow: InfoWindow(
          title: 'Carrera de Ingeniería Comercial',
          snippet: 'Carr Ing. Comercial',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Ingeniería Financiera'),
        position: LatLng(-17.397010, -63.877960),
        infoWindow: InfoWindow(
          title: 'Carrera de Ingeniería Financiera',
          snippet: 'Carr Ing. Financiera',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Ingeniería Petrolera'),
        position: LatLng(-17.396920, -63.877900),
        infoWindow: InfoWindow(
          title: 'Carrera de Ingeniería Petrolera',
          snippet: 'Carr Ing. Petrolera',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Ingeniería en Sistemas'),
        position: LatLng(-17.396945, -63.877933),
        infoWindow: InfoWindow(
          title: 'Carrera de Ingeniería en Sistemas',
          snippet: 'Carr Ing. en Sistemas',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Medicina Veterinaria y Zootecnia'),
        position: LatLng(-17.396946, -63.877913),
        infoWindow: InfoWindow(
          title: 'Carrera de Medicina Veterinaria y Zootecnia',
          snippet: 'Carr Med. Veterinaria',
        ),
      ),

      Marker(
        markerId: MarkerId('Decanatura Facultad de Ciencias Económicas y Empresariales'),
        position: LatLng(-17.776131, -63.196476),
        infoWindow: InfoWindow(
          title: 'Decanatura Facultad de Ciencias Económicas y Empresariales',
          snippet: 'Deca Fac de Cs. Eco',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Administración de Empresas'),
        position: LatLng(-17.776168, -63.196507),
        infoWindow: InfoWindow(
          title: 'Carrera de Administración de Empresas',
          snippet: 'Carr Administración',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Comercio Internacional'),
        position: LatLng(-17.775530, -63.195601),
        infoWindow: InfoWindow(
          title: 'Carrera de Comercio Internacional',
          snippet: 'Carr Comercio Intern',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Economía'),
        position: LatLng(-17.776116, -63.196581),
        infoWindow: InfoWindow(
          title: 'Carrera de Economía',
          snippet: 'Carr Economía',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Ingeniería Comercial'),
        position: LatLng(-17.776414, -63.197038),
        infoWindow: InfoWindow(
          title: 'Carrera de Ingeniería Comercial',
          snippet: 'Carr Ingeniería Come',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Ingeniería Financiera'),
        position: LatLng(-17.776709, -63.196728),
        infoWindow: InfoWindow(
          title: 'Carrera de Ingeniería Financiera',
          snippet: 'Carr Ingeniería Fina',
        ),
      ),

      Marker(
        markerId: MarkerId('Decanatura Facultad de Ciencias Exactas y Tecnología'),
        position: LatLng(-17.775455, -63.195742),
        infoWindow: InfoWindow(
          title: 'Decanatura Facultad de Ciencias Exactas y Tecnología',
          snippet: 'Deca FCET',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Ingeniería Ambiental'),
        position: LatLng(-17.775515, -63.195705),
        infoWindow: InfoWindow(
          title: 'Carrera de Ingeniería Ambiental',
          snippet: 'Carr Ing. Ambiental',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Ingeniería Civil'),
        position: LatLng(-17.775519, -63.195708),
        infoWindow: InfoWindow(
          title: 'Carrera de Ingeniería Civil',
          snippet: 'Carr Ing. Civil',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Ingeniería Electromecánica'),
        position: LatLng(-17.775528, -63.195659),
        infoWindow: InfoWindow(
          title: 'Carrera de Ingeniería Electromecánica',
          snippet: 'Carr Ing. Electromecánica',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Ingeniería Industrial'),
        position: LatLng(-17.775283, -63.194561),
        infoWindow: InfoWindow(
          title: 'Carrera de Ingeniería Industrial',
          snippet: 'Carr Ing. Industrial',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Ingeniería Petrolera'),
        position: LatLng(-17.775515, -63.195688),
        infoWindow: InfoWindow(
          title: 'Carrera de Ingeniería Petrolera',
          snippet: 'Carr Ing. Petrolera',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Ingeniería Química'),
        position: LatLng(-17.775459, -63.195744),
        infoWindow: InfoWindow(
          title: 'Carrera de Ingeniería Química',
          snippet: 'Carr Ing. Química',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Ingeniería de Alimentos'),
        position: LatLng(-17.775514, -63.195702),
        infoWindow: InfoWindow(
          title: 'Carrera de Ingeniería de Alimentos',
          snippet: 'Carr Ing. de Alimentos',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Ingeniería de Control de Procesos'),
        position: LatLng(-17.775511, -63.195682),
        infoWindow: InfoWindow(
          title: 'Carrera de Ingeniería de Control de Procesos',
          snippet: 'Carr Ing. de Control Proc.',
        ),
      ),

      Marker(
        markerId: MarkerId('Decanatura Facultad de Ciencias Farmacéuticas y Bioquímicas'),
        position: LatLng(-17.774565, -63.197728),
        infoWindow: InfoWindow(
          title: 'Decanatura Facultad de Ciencias Farmacéuticas y Bioquímicas',
          snippet: 'Decanatura FBF',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Bioquímica'),
        position: LatLng(-17.774591, -63.197938),
        infoWindow: InfoWindow(
          title: 'Carrera de Bioquímica',
          snippet: 'Carr Bioquímica',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Farmacia'),
        position: LatLng(-17.774580, -63.197912),
        infoWindow: InfoWindow(
          title: 'Carrera de Farmacia',
          snippet: 'Carr Farmacia',
        ),
      ),

      Marker(
        markerId: MarkerId('Decanatura Facultad de Ciencias Jurídicas, Políticas, Sociales y Relaciones Internacionales'),
        position: LatLng(-17.775991, -63.198423),
        infoWindow: InfoWindow(
          title: 'Decanatura Facultad de Ciencias Jurídicas, Políticas, Sociales y Relaciones Internacionales',
          snippet: 'Decanatura Cs, Jurídicas',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Ciencias Políticas y Administración Pública'),
        position: LatLng(-17.775834, -63.198232),
        infoWindow: InfoWindow(
          title: 'Carrera de Ciencias Políticas y Administración Pública',
          snippet: 'Carr Cs. Política',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Derecho'),
        position: LatLng(-17.776012, -63.198332),
        infoWindow: InfoWindow(
          title: 'Carrera de Derecho',
          snippet: 'Carr Derecho',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Relaciones Internacionales'),
        position: LatLng(-17.776030, -63.198106),
        infoWindow: InfoWindow(
          title: 'Carrera de Relaciones Internacionales',
          snippet: 'Carr Relaciones Inte',
        ),
      ),

      Marker(
        markerId: MarkerId('Carrera de Trabajo Social'),
        position: LatLng(-17.775933, -63.198460),
        infoWindow: InfoWindow(
          title: 'Carrera de Trabajo Social',
          snippet: 'Carr Trabajo Social',
        ),
      ),

      Marker(
        markerId: MarkerId('Unidad de Postgrado de la Facultad de Auditoria Financiera o Contaduría Pública'),
        position: LatLng(-17.779500, -63.191200),
        infoWindow: InfoWindow(
          title: 'Unidad de Postgrado de la Facultad de Auditoria Financiera o Contaduría Pública',
          snippet: 'Postgrado Fac. Cont. Publica',
        ),
      ),

      Marker(
        markerId: MarkerId('Unidad de Postgrado de la Facultad de Ciencias Agrícolas'),
        position: LatLng(-17.773600, -63.166700),
        infoWindow: InfoWindow(
          title: 'Unidad de Postgrado de la Facultad de Ciencias Agrícolas',
          snippet: 'Postgrado Fac. Cs. Agricilas',
        ),
      ),

      Marker(
        markerId: MarkerId('Unidad de Postgrado de la Facultad de Ciencias de la Salud Humana'),
        position: LatLng(-17.782600, -63.179100),
        infoWindow: InfoWindow(
          title: 'Unidad de Postgrado de la Facultad de Ciencias de la Salud Humana',
          snippet: 'Postgrado Fac. Cs. Salud',
        ),
      ),

      Marker(
        markerId: MarkerId('Unidad de Postgrado de la Facultad de Ciencias del Hábitat, Diseño y Arte'),
        position: LatLng(-17.770100, -63.192100),
        infoWindow: InfoWindow(
          title: 'Unidad de Postgrado de la Facultad de Ciencias del Hábitat, Diseño y Arte',
          snippet: 'Postgrado Fac. Cs. Habitad',
        ),
      ),

      Marker(
        markerId: MarkerId('Unidad de Postgrado de la Facultad de Ciencias Económicas y Empresariales'),
        position: LatLng(-17.790500, -63.179100),
        infoWindow: InfoWindow(
          title: 'Unidad de Postgrado de la Facultad de Ciencias Económicas y Empresariales',
          snippet: 'Postgrado Fac. Cs. Economicas',
        ),
      ),

      Marker(
        markerId: MarkerId('Unidad de Postgrado de la Facultad de Ciencias Exactas y Tecnología'),
        position: LatLng(-17.778000, -63.190500),
        infoWindow: InfoWindow(
          title: 'Unidad de Postgrado de la Facultad de Ciencias Exactas y Tecnología',
          snippet: 'Postgrado Fac. Cs. Exactas y Tec.',
        ),
      ),

      Marker(
        markerId: MarkerId('Unidad de Postgrado de la Facultad de Ciencias Farmacéuticas y Bioquímicas'),
        position: LatLng(-17.774600, -63.197700),
        infoWindow: InfoWindow(
          title: 'Unidad de Postgrado de la Facultad de Ciencias Farmacéuticas y Bioquímicas',
          snippet: 'Postgrado Fac. Cs. Farmacia y Bio.',
        ),
      ),

      Marker(
        markerId: MarkerId('Unidad de Postgrado de la Facultad de Ciencias Jurídicas, Políticas, Sociales y RR.II.'),
        position: LatLng(-17.779200, -63.192600),
        infoWindow: InfoWindow(
          title: 'Unidad de Postgrado de la Facultad de Ciencias Jurídicas, Políticas, Sociales y RR.II.',
          snippet: 'Postgrado Fac. Cs. Juricas',
        ),
      ),

      Marker(
        markerId: MarkerId('Unidad de Postgrado de la Facultad de Ciencias Veterinarias y Zootecnia'),
        position: LatLng(-17.777100, -63.195800),
        infoWindow: InfoWindow(
          title: 'Unidad de Postgrado de la Facultad de Ciencias Veterinarias y Zootecnia',
          snippet: 'Postgrado Fac. Veternaria',
        ),
      ),

      Marker(
        markerId: MarkerId('Unidad de Postgrado de la Facultad de Humanidades'),
        position: LatLng(-17.776300, -63.190900),
        infoWindow: InfoWindow(
          title: 'Unidad de Postgrado de la Facultad de Humanidades',
          snippet: 'Postgrado Fac. Humanidades',
        ),
      ),

      Marker(
        markerId: MarkerId('Unidad de Postgrado de la Facultad de Ingeniería en Ciencias de la Computación y Telecomunicacione'),
        position: LatLng(-17.774100, -63.195300),
        infoWindow: InfoWindow(
          title: 'Unidad de Postgrado de la Facultad de Ingeniería en Ciencias de la Computación y Telecomunicacione',
          snippet: 'Postgrado Cs. Computacion',
        ),
      ),

      Marker(
        markerId: MarkerId('Unidad de Postgrado de la Facultad Integral de Ichilo'),
        position: LatLng(-17.396700, -63.878700),
        infoWindow: InfoWindow(
          title: 'Unidad de Postgrado de la Facultad Integral de Ichilo',
          snippet: 'Postgrado Fac. Ichilo',
        ),
      ),

      Marker(
        markerId: MarkerId('Unidad de Postgrado de la Facultad Integral del Chaco'),
        position: LatLng(-20.033400, -63.527900),
        infoWindow: InfoWindow(
          title: 'Unidad de Postgrado de la Facultad Integral del Chaco',
          snippet: 'Postgrado Fac. Chaco',
        ),
      ),

      Marker(
        markerId: MarkerId('Unidad de Postgrado de la Facultad Integral del Noreste'),
        position: LatLng(-16.910500, -62.620800),
        infoWindow: InfoWindow(
          title: 'Unidad de Postgrado de la Facultad Integral del Noreste',
          snippet: 'Postgrado Fac. Noroeste',
        ),
      ),


    ];
  }
}
