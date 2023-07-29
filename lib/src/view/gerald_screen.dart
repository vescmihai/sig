import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:convert';
//import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart' as maps_web_service;
import 'package:location/location.dart';
import 'package:sig/src/model/section_model.dart';
import 'package:sig/src/utils/operations.dart';
import 'package:sig/src/widget/inf_panel_widget.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import './../controller/maps_controller.dart';
import 'dart:async';
import 'package:google_map_polyline_new/google_map_polyline_new.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:speech_to_text/speech_to_text.dart';
import 'package:uuid/uuid.dart';

class MapsScreen extends StatefulWidget {
  const MapsScreen({super.key});
  @override
  MapsScreenState createState() => MapsScreenState();
}

class MapsScreenState extends State<MapsScreen> {
  final MapsController _mapsController = MapsController();
  Future<List<Section>> futureSections = SeccionList.getSections();
  Map<MarkerId, BitmapDescriptor> markerIcons = {};
  Map<MarkerId, Marker> activeMarkers = {};
  Section? selectedSection;
  final _searchOrigenController = TextEditingController();
  GoogleMapController? mapController;
  LocationData? currentLocation;
  final PanelController _panelControlller = PanelController();
  List<LatLng> routePoints = [];
  PolylineId selectedRoute = PolylineId('selected_route');
  GoogleMapPolyline googleMapPolyline =
      GoogleMapPolyline(apiKey: "AIzaSyAQtoTgG5oyEQt-MswvRgoavtk822Wghck");
  Map<PolylineId, Polyline> _polylines = <PolylineId, Polyline>{};
  int _polylineCount = 1;
  bool _loading = false;
  RouteMode _routeMode = RouteMode.driving;
  Duration _drivingDuration = Duration();
  double _drivingDistance = 0;
  Duration _walkingDuration = Duration();
  double _walkingDistance = 0;
  late SpeechToText _speechToText;
  bool _selectOrigen = false;
  String googleKey = "AIzaSyAWqeXTDh8ANrGorI7lfnfH6Zkt0JgSKe0";
  var uuid = const Uuid();
  String _sessionToken = '1234567890';

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void dispose() {
    _speechToText.stop();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _speechToText = SpeechToText();
    _initMap();
  }

  Future<void> _initMap() async {
    bool permissionGranted = await _mapsController.requestLocationPermission();
    if (permissionGranted) {
      setState(() {
        //fitBounds();
        _panelControlller.hide();
      });
    }
  }

  Row buildRouteModeButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.directions_car),
          color: _routeMode == RouteMode.driving ? Colors.blue : Colors.grey,
          onPressed: () {
            setState(() {
              _routeMode = RouteMode.driving;
              if (selectedSection != null && currentLocation != null) {
                _getPolylinesWithLocation(
                    currentLocation!.latitude!,
                    currentLocation!.longitude!,
                    selectedSection!.latitud,
                    selectedSection!.longitud);
              }
            });
          },
        ),
        IconButton(
          icon: Icon(Icons.directions_walk),
          color: _routeMode == RouteMode.walking ? Colors.blue : Colors.grey,
          onPressed: () {
            setState(() {
              _routeMode = RouteMode.walking;
              if (selectedSection != null && currentLocation != null) {
                _getPolylinesWithLocation(
                    currentLocation!.latitude!,
                    currentLocation!.longitude!,
                    selectedSection!.latitud,
                    selectedSection!.longitud);
              }
            });
          },
        ),
      ],
    );
  }

  Future<void> _searchByVoice() async {
    bool available = await _speechToText.initialize(
      onError: (val) => print('onError: $val'),
      onStatus: (val) => print('onStatus: $val'),
    );
    print('Disponibilidad de SpeechToText: $available'); // depuración
    if (available) {
      _speechToText.listen(
        onResult: (val) => setState(() {
          _mapsController.searchController.text = val.recognizedWords;
        }),
        listenFor: Duration(seconds: 10), // tiempo límite para escuchar
        pauseFor: Duration(seconds: 5), // tiempo límite para pausar
        partialResults: true, // Puedes activar resultados parciales.
        onSoundLevelChange: (level) =>
            print('Nivel de sonido: $level'), // depuración
        cancelOnError: true, // cancelar la escucha en caso de error.
        listenMode: ListenMode.confirmation, // modo de escucha.
      );
    } else {
      print(
          'El reconocimiento de voz no está disponible en este dispositivo.'); // depuración
    }
  }

  Widget buildRouteInfo() {
    String durationStr = '';
    String distanceStr = '';
    if (_routeMode == RouteMode.driving) {
      durationStr = formatDuration(_drivingDuration);
      distanceStr = _drivingDistance.toString() + ' km';
    } else if (_routeMode == RouteMode.walking) {
      durationStr = formatDuration(_walkingDuration);
      distanceStr = _walkingDistance.toString() + ' km';
    }
    return Column(
      children: [
        Text('Tiempo estimado: $durationStr'),
        Text('Distancia: $distanceStr'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SlidingUpPanel(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        parallaxEnabled: true,
        defaultPanelState: PanelState.CLOSED,
        controller: _panelControlller,
        minHeight: MediaQuery.of(context).size.height * 0.115,
        maxHeight: MediaQuery.of(context).size.height,
        snapPoint: 0.55,
        backdropEnabled: true,
        backdropOpacity: 0.1,
        panelSnapping: true,
        panel: InformationPanelW(selectedSection: selectedSection),
        body: Padding(
          padding: const EdgeInsets.only(bottom: 80),
          child: Column(
            children: [
              searchOrigenBar(),
              searchBar(),
              buildRouteModeButtons(),
              buildRouteInfo(),
              Expanded(
                child: Stack(children: [
                  showMap(),
                  zoomButtons(),
                  Positioned(
                      bottom: 180, right: 10, child: currentLocationButton()),
                  Positioned(
                      bottom: 110,
                      right: 10,
                      child: calculateNewDistanceButton()),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AnimatedSize searchOrigenBar() {
    return AnimatedSize(
      duration: const Duration(milliseconds: 200),
      child: SizedBox(
          height: _selectOrigen ? 60 : 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Visibility(
                visible: _selectOrigen,
                child: TypeAheadField(
                    textFieldConfiguration: TextFieldConfiguration(
                      controller: _searchOrigenController,
                      autofocus: false,
                      onTapOutside: (event) => FocusScope.of(context).unfocus(),
                      onChanged: (value) {
                        if (_sessionToken == null) {
                          setState(() {
                            _sessionToken = uuid.v4();
                          });
                        }
                      },
                      onTap: () async {},
                      decoration: InputDecoration(
                        labelText: 'Buscar ubicacion origen',
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.cancel),
                          onPressed: () {
                            _searchOrigenController.clear();
                          },
                        ),
                      ),
                    ),
                    suggestionsCallback: getPlacesSuggestions,
                    itemBuilder: (context, suggestion) {
                      return ListTile(
                        title: Text(suggestion.description ??
                            'No hay lugares que mostrar'),
                        subtitle: Text(
                            suggestion.structuredFormatting?.mainText ?? ''),
                      );
                    },
                    onSuggestionSelected: (suggestion) {
                      String? placeId = suggestion.placeId;
                      if (placeId != null) {
                        _selectMarkerByPlace(placeId);
                      }
                      _searchOrigenController.text = suggestion.description!;
                    })),
          )),
    );
  }

  Future<List<maps_web_service.Prediction>> getPlacesSuggestions(
      String query) async {
    List<maps_web_service.Prediction> suggestions = [];
    String type = '(regions)';
    String radius = '50000';
    String location = "-17.781774%2C-63.181267";

    try {
      String baseURL =
          'https://maps.googleapis.com/maps/api/place/autocomplete/json';
      String request =
          '$baseURL?input=$query&location=$location&radius=$radius&strictbounds=true&key=$googleKey&sessiontoken=$_sessionToken';
      var response = await http.get(Uri.parse(request));

      if (response.statusCode == 200) {
        var predictions = json.decode(response.body)['predictions'];

        for (var prediction in predictions) {
          suggestions.add(maps_web_service.Prediction(
              description: prediction['description'],
              placeId: prediction['place_id']));
        }
      } else {
        throw Exception('Failed to load predictions');
      }
    } catch (e) {
      // toastMessage('success');
    }

    return suggestions;
  }

  void _selectMarkerByPlace(String placeId) async {
    String url =
        "https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$googleKey";

    try {
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        var location = data['result']['geometry']['location'];
        var location_name =
            data['result']['address_components'][0]['long_name'];
        var location_name2 =
            data['result']['address_components'][1]['long_name'];

        double lat = location['lat'];
        double lng = location['lng'];
        Marker selectedMarker = Marker(
            markerId: MarkerId(placeId.substring(1, 6)),
            position: LatLng(lat, lng),
            onTap: () => _panelControlller.show(),
            infoWindow:
                InfoWindow(title: location_name, snippet: location_name2));

        setState(() {
          activeMarkers[const MarkerId('1')] = selectedMarker;
        });
        updateCamera();
      } else {
        print('Failed to load coordinates from place_id');
      }
    } catch (e) {
      print(e);
    }
  }

  SizedBox searchBar() {
    return SizedBox(
      height: 65,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: TypeAheadField(
          textFieldConfiguration: TextFieldConfiguration(
            controller: _mapsController.searchController,
            decoration: InputDecoration(
              labelText: 'Buscar módulo',
              suffixIcon: IconButton(
                onPressed: _searchByVoice,
                icon: const Icon(Icons.mic, color: Colors.red),
              ),
            ),
            onSubmitted: (value) {
              _selectMarker;
            },
          ),
          suggestionsCallback: getSuggestions,
          itemBuilder: (context, suggestion) {
            return ListTile(
              title: Text(suggestion.title),
              subtitle: Text(suggestion.snippet),
            );
          },
          onSuggestionSelected: (suggestion) {
            _selectMarker(suggestion.markerId);
            _mapsController.searchController.text = suggestion.title;
          },
        ),
      ),
    );
  }

  GoogleMap showMap() {
    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: const CameraPosition(
        target: LatLng(-17.775615, -63.198539),
        zoom: 14,
      ),
      zoomControlsEnabled: false,
      compassEnabled: true,
      myLocationButtonEnabled: false,
      myLocationEnabled: false,
      markers: Set<Marker>.of(activeMarkers.values),
      polylines: Set<Polyline>.of(_polylines.values),
      onTap: (_) {
        setState(() {
          _selectOrigen = false;
          _clearSelectedMarker();
          _panelControlller.hide();
        });
      },
    );
  }

  Positioned zoomButtons() {
    return Positioned(
      top: 40.0,
      right: 13.0,
      child: Column(
        children: [
          SizedBox(
            width: 40,
            height: 40,
            child: ElevatedButton(
              onPressed: () {
                mapController?.animateCamera(CameraUpdate.zoomIn());
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.grey[700],
                backgroundColor: Colors.white,
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0),
                ),
                padding: EdgeInsets.zero,
              ),
              child: const Icon(Icons.add),
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            width: 40,
            height: 40,
            child: ElevatedButton(
              onPressed: () {
                mapController?.animateCamera(CameraUpdate.zoomOut());
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.grey[700],
                backgroundColor: Colors.white,
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0),
                ),
                padding: EdgeInsets.zero,
              ),
              child: const Icon(Icons.remove),
            ),
          ),
        ],
      ),
    );
  }

  void _updateRouteInfo(RouteMode mode) async {
    if (selectedSection != null && currentLocation != null) {
      String modeStr = mode == RouteMode.driving ? 'driving' : 'walking';
      String origin =
          '${currentLocation!.latitude!},${currentLocation!.longitude!}';
      String destination =
          '${selectedSection!.latitud},${selectedSection!.longitud}';

      String url =
          'https://maps.googleapis.com/maps/api/directions/json?origin=$origin&destination=$destination&mode=$modeStr&key=AIzaSyAQtoTgG5oyEQt-MswvRgoavtk822Wghck';

      http.Response response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body);
        var routes = jsonResponse['routes'] as List;
        var legs = routes[0]['legs'] as List;
        var distance = legs[0]['distance']['text'];
        var duration = legs[0]['duration']['text'];

        var distanceValue = double.parse(distance.replaceAll(' km', ''));
        var durationValue = parseDuration(duration);

        setState(() {
          if (mode == RouteMode.driving) {
            _drivingDistance = distanceValue;
            _drivingDuration = durationValue;
          } else if (mode == RouteMode.walking) {
            _walkingDistance = distanceValue;
            _walkingDuration = durationValue;
          }
        });
      } else {
        print('Solicitud fallida: ${response.statusCode}.');
      }
    }
  }

  Duration parseDuration(String duration) {
    final durationParts = duration.split(' ');

    int hours = 0;
    int minutes = 0;

    for (int i = 0; i < durationParts.length; i += 2) {
      final value = int.parse(durationParts[i]);
      final unit = durationParts[i + 1];

      switch (unit) {
        case 'day':
        case 'days':
          hours += value * 24;
          break;
        case 'hour':
        case 'hours':
          hours += value;
          break;
        case 'min':
        case 'mins':
          minutes += value;
          break;
        default:
          throw Exception('Error de duracion $unit');
      }
    }

    return Duration(hours: hours, minutes: minutes);
  }

  void _selectMarker(int code) async {
    var sections = await futureSections;

    Section section = sections.firstWhere((section) => section.code == code);
    selectedSection = section;

    Marker selectedMarker = Marker(
        markerId: MarkerId(section.code.toString()),
        position: LatLng(section.latitud, section.longitud),
        onTap: () => _panelControlller.show(),
        infoWindow: InfoWindow(
            title: section.descripcion,
            snippet: 'Módulo: ${section.codEdificio}'));

    setState(() {
      activeMarkers[const MarkerId('2')] = selectedMarker;
      _panelControlller.show();
    });

    updateCamera();

    if (currentLocation != null) {
      _getPolylinesWithLocation(currentLocation!.latitude!,
          currentLocation!.longitude!, section.latitud, section.longitud);
    }
  }

  void updateCamera() {
    if (mapController != null) {
      var marker1 = activeMarkers[const MarkerId('1')];
      var marker2 = activeMarkers[const MarkerId('2')];

      if (marker1 != null && marker2 == null) {
        mapController!.animateCamera(
          CameraUpdate.newLatLngZoom(
            marker1.position,
            15,
          ),
        );
      } else if (marker1 == null && marker2 != null) {
        mapController!.animateCamera(
          CameraUpdate.newLatLngZoom(
            marker2.position,
            18,
          ),
        );
      } else if (marker1 != null && marker2 != null) {
        LatLngBounds? bounds =
            operations.computeBounds([marker1.position, marker2.position]);
        mapController!.animateCamera(
          CameraUpdate.newLatLngBounds(
            bounds,
            110,
          ),
        );
      }
    }
  }

  void _clearSelectedMarker() {
    setState(() {
      activeMarkers.clear();
      _polylines.clear();
      _searchOrigenController.clear();
      _mapsController.searchController.clear();
    });
  }

  _getPolylinesWithLocation(double originLat, double originLong,
      double destinationLat, double destinationLong) async {
    _setLoadingMenu(true);
    List<LatLng>? _coordinates =
        await googleMapPolyline.getCoordinatesWithLocation(
            origin: LatLng(originLat, originLong),
            destination: LatLng(destinationLat, destinationLong),
            mode: _routeMode);

    setState(() {
      _polylines.clear();
    });
    _addPolyline(_coordinates);
    _setLoadingMenu(false);
    _updateRouteInfo(_routeMode);
  }

  String formatDuration(Duration d) {
    String result = "";

    if (d.inDays > 0) {
      result += d.inDays.toString() + "d ";
    }
    if (d.inHours.remainder(24) > 0) {
      result += d.inHours.remainder(24).toString() + "h ";
    }
    if (d.inMinutes.remainder(60) > 0) {
      result += d.inMinutes.remainder(60).toString() + " min";
    }
    if (d.inSeconds.remainder(60) > 0) {
      result += d.inSeconds.remainder(60).toString() + " seg";
    }

    return result;
  }

  _addPolyline(List<LatLng>? _coordinates) {
    PolylineId id = PolylineId("poly$_polylineCount");
    Polyline polyline = Polyline(
        polylineId: id,
        color: Colors.blueAccent,
        points: _coordinates!,
        width: 10,
        onTap: () {});

    setState(() {
      _polylines[id] = polyline;
      _polylineCount++;
    });
  }

  _setLoadingMenu(bool _status) {
    setState(() {
      _loading = _status;
    });
  }

  Widget currentLocationButton() {
    return FloatingActionButton(
      heroTag: "fab1",
      onPressed: _getCurrentLocation,
      child: const Icon(Icons.my_location,
          color: Colors.white), // Cambio de color a rojo
    );
  }

  Widget calculateNewDistanceButton() {
    return FloatingActionButton(
      heroTag: "fab2",
      onPressed: () {
        setState(() {
          _selectOrigen = true;
        });
      },
      child: const Icon(
        Icons.route,
      ),
    );
  }

  void _getCurrentLocation() async {
    Location location = Location();
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    currentLocation = await location.getLocation();
    LatLng latLng =
        LatLng(currentLocation!.latitude!, currentLocation!.longitude!);

    Marker currentLocationMarker = Marker(
      markerId: MarkerId("current_location"), // Nuevo MarkerId
      position: latLng,
      icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueRed), // Icono en rojo
    );

    setState(() {
      activeMarkers[MarkerId("current_location")] = currentLocationMarker;
    });

    mapController!.animateCamera(CameraUpdate.newLatLngZoom(latLng, 15));
  }

  Future<List<MarkerSuggestion>> getSuggestions(String query) async {
    List<MarkerSuggestion> suggestions = [];
    List<Section> sections = await futureSections;
    for (Section section in sections) {
      if (section.descripcion.toLowerCase().contains(query.toLowerCase()) ||
          section.codEdificio.toString().contains(query.toLowerCase()) ||
          section.edificio!.toLowerCase().contains(query.toLowerCase())) {
        suggestions.add(
          MarkerSuggestion(
            markerId: section.code,
            title: section.descripcion,
            snippet: section.edificio.toString(),
          ),
        );
      }
    }
    return suggestions;
  }
}
