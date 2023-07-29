import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:sig/src/model/section_model.dart';
import 'package:sig/src/widget/inf_panel_widget.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import './../controller/maps_controller.dart';
import 'dart:async';
import 'package:google_map_polyline_new/google_map_polyline_new.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:speech_to_text/speech_to_text.dart';
import 'package:diacritic/diacritic.dart';

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
  Map<MarkerId, Marker> activeMarker = {};
  Section? selectedSection;
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
              } else if (selectedSection != null &&
                  activeMarker.containsKey(MarkerId('user_marker'))) {
                LatLng userMarkerPosition =
                    activeMarker[MarkerId('user_marker')]!.position;
                _getPolylinesWithLocation(
                  userMarkerPosition.latitude,
                  userMarkerPosition.longitude,
                  selectedSection!.latitud,
                  selectedSection!.longitud,
                );
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
              } else if (selectedSection != null &&
                  activeMarker.containsKey(MarkerId('user_marker'))) {
                LatLng userMarkerPosition =
                    activeMarker[MarkerId('user_marker')]!.position;
                _getPolylinesWithLocation(
                  userMarkerPosition.latitude,
                  userMarkerPosition.longitude,
                  selectedSection!.latitud,
                  selectedSection!.longitud,
                );
              }
            });
          },
        ),
      ],
    );
  }

//falta actualizar la informacion en tiempo y distancia con el userMarker-------------------------
  void _onMapTap(LatLng position) {
    setState(() {
      Marker userMarker = Marker(
        markerId: MarkerId('user_marker'),
        position: position,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      );
      activeMarker[MarkerId('user_marker')] = userMarker;

      // Update the markers on the map by creating a new set with the updated markers.
      Set<Marker> updatedMarkers = Set.of(activeMarkers.values)
        ..addAll(activeMarker.values);
      activeMarkers =
          Map.fromIterable(updatedMarkers, key: (marker) => marker.markerId);

      // Now call the route calculation function after the user marker is added to the map.
      if (selectedSection != null &&
          activeMarker.containsKey(MarkerId('user_marker'))) {
        LatLng userMarkerPosition =
            activeMarker[MarkerId('user_marker')]!.position;
        _getPolylinesWithLocation(
          userMarkerPosition.latitude,
          userMarkerPosition.longitude,
          selectedSection!.latitud,
          selectedSection!.longitud,
        );

        // Update route info based on the selected mode
        _updateRouteInfo(_routeMode);
      }
    });
  }

//------------------------------------------------------------------------------------------------
  Future<void> _searchByVoice() async {
    bool available = await _speechToText.initialize(
      onError: (val) => print('onError: $val'),
      onStatus: (val) => print('onStatus: $val'),
    );
    print('Disponibilidad de SpeechToText: $available'); // depuración
    if (available) {
      _speechToText.listen(
        onResult: (val) async {
          String recognizedWords = val.recognizedWords.toLowerCase();
          List<MarkerSuggestion> suggestions =
              await getSuggestions(recognizedWords);
          _mapsController.searchController.text = recognizedWords;
          // No necesitas una variable "filteredSuggestions",
          // simplemente usa la lista "suggestions" directamente.
          setState(() {
            // La lista "suggestions" se mostrará en el TypeAheadField.
          });
        },
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
        snapPoint: 0.5,
        backdropEnabled: true,
        backdropOpacity: 0.1,
        panelSnapping: true,
        panel: InformationPanelW(selectedSection: selectedSection),
        body: Padding(
          padding: const EdgeInsets.only(bottom: 80),
          child: Stack(
            children: [
              Column(children: [
                searchBar(),
                buildRouteModeButtons(),
                buildRouteInfo(),
                showMap()
              ]),
              Positioned(
                  bottom: 110, right: 10, child: currentLocationButton()),
            ],
          ),
        ),
      ),
    );
  }

  Padding searchBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
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
        suggestionsCallback: (pattern) async {
          String query = pattern.toLowerCase();
          return await getSuggestions(query);
        },
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
    );
  }

  Expanded showMap() {
    return Expanded(
        child: GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: const CameraPosition(
        target: LatLng(-17.775615, -63.198539),
        zoom: 14,
      ),
      compassEnabled: true,
      myLocationButtonEnabled: true,
      myLocationEnabled: true,
      markers: Set<Marker>.of(activeMarkers.values)
          .union(Set<Marker>.of(activeMarker.values)),
      polylines: Set<Polyline>.of(_polylines.values),
      onTap: (LatLng position) {
        setState(() {
          _panelControlller.hide();

          _onMapTap(position);
        });
      },
      onLongPress: (LatLng position) {
        setState(() {
          _clearAllMarkers();
        });
      },
    ));
  }

  void _clearAllMarkers() {
    setState(() {
      activeMarker.clear();
      activeMarkers.clear();
      currentLocation = null;
      _polylines.clear();
      _drivingDistance = 0;
      _drivingDuration = Duration();
      _walkingDistance = 0;
      _walkingDuration = Duration();
    });
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
            snippet: 'Edificio: ${section.codEdificio}'));

    if (mapController != null) {
      mapController!.animateCamera(
        CameraUpdate.newLatLngZoom(
          selectedMarker.position,
          18,
        ),
      );
      activeMarkers.clear();
      setState(() {
        activeMarkers[MarkerId(code.toString())] = selectedMarker;
        _panelControlller.show();
      });

      if (currentLocation != null) {
        _getPolylinesWithLocation(currentLocation!.latitude!,
            currentLocation!.longitude!, section.latitud, section.longitud);
      }
    }
  }

  void _clearSelectedMarker() {
    setState(() {
      activeMarkers.clear();
      _polylines.clear();
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
      onPressed: _getCurrentLocation,
      child: const Icon(Icons.my_location,
          color: Colors.red), // Cambio de color a rojo
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
    activeMarker.clear();
    currentLocation = await location.getLocation();
    LatLng latLng =
        LatLng(currentLocation!.latitude!, currentLocation!.longitude!);

    Marker currentLocationMarker = Marker(
      markerId: MarkerId("current_location"), // Nuevo MarkerId
      position: latLng,
      icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueBlue), // Icono en rojo
    );

    setState(() {
      activeMarker[MarkerId("current_location")] = currentLocationMarker;
    });

    mapController!.animateCamera(CameraUpdate.newLatLngZoom(latLng, 15));
  }

  Future<List<MarkerSuggestion>> getSuggestions(String query) async {
    List<MarkerSuggestion> suggestions = [];
    List<Section> sections = await futureSections;
    String normalizedQuery =
        removeDiacritics(query.toLowerCase()); // Remueve tildes
    for (Section section in sections) {
      String normalizedDescription =
          removeDiacritics(section.descripcion.toLowerCase());
      String normalizedEdificio =
          removeDiacritics(section.edificio!.toLowerCase());
      String normalizedCodEdificio =
          removeDiacritics(section.codEdificio.toString().toLowerCase());

      if (normalizedDescription.contains(normalizedQuery) ||
          normalizedCodEdificio.contains(normalizedQuery) ||
          normalizedEdificio.contains(normalizedQuery)) {
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
