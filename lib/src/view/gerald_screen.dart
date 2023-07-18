import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:sig/src/model/section_model.dart';
import 'package:sig/src/service/firebase_service.dart';
import 'package:sig/src/widget/carousel_img_widget.dart';
import 'package:sig/src/widget/inf_panel_widget.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import './../controller/maps_controller.dart';
import 'dart:async';

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
  GoogleMapController? mapController;
  LocationData? currentLocation;
  final PanelController _panelControlller = PanelController();

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    //fitBounds();
  }

  @override
  void dispose() {
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
        //fitBounds();
      });
    }
    _panelControlller.hide();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SlidingUpPanel(
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
              Column(children: [searchBar(), showMap()]),
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
          decoration: const InputDecoration(
            labelText: 'Buscar módulo',
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
        markers: Set<Marker>.of(activeMarkers.values),
        onTap: (_) {
          setState(() {
            _panelControlller.hide();
            _clearSelectedMarker();
          });
        },
      ),
    );
  }

  void _selectMarker(int code) async {
    var sections = await futureSections;

    Section section = sections.firstWhere((section) => section.code == code);
    selectedSection = section;

    Marker selectedMarker = Marker(
        markerId: MarkerId(section.code.toString()),
        position: LatLng(section.latitud, section.longitud),
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
        _panelControlller.show();
        activeMarkers[MarkerId(code.toString())] = selectedMarker;
      });
    }
  }

  void _clearSelectedMarker() {
    setState(() {
      activeMarkers.clear();
    });
  }

  static Future<Set<Marker>> _getMarkers() async {
    List<Marker> markerList = await MarkerList.getMarkers();
    return markerList.toSet();
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

    currentLocation = await location.getLocation();
    LatLng latLng =
        LatLng(currentLocation!.latitude!, currentLocation!.longitude!);
    mapController!.animateCamera(CameraUpdate.newLatLng(latLng));
  }

  /* void fitBounds() async {
    var markers = await futureMarkers;
    if (markers.isNotEmpty && mapController != null) {
      double minLat = double.infinity;
      double maxLat = double.negativeInfinity;
      double minLng = double.infinity;
      double maxLng = double.negativeInfinity;

      for (Marker marker in markers) {
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
      mapController!.animateCamera(cameraUpdate);
    }
  } */

  Future<List<MarkerSuggestion>> getSuggestions(String query) async {
    List<MarkerSuggestion> suggestions = [];
    List<Section> sections = await futureSections;
    for (Section section in sections) {
      if (section.descripcion.toLowerCase().contains(query.toLowerCase())) {
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
