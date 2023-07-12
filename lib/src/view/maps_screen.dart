/*

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import './../controller/maps_controller.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:math' as math;
import './../model/marker_model.dart';

class MapsScreen extends StatefulWidget {
  @override
  _MapsScreenState createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  final MapsController _mapsController = MapsController();
  Set<Marker> markers = _getMarkers();
  MarkerId? selectedMarker;
  Map<MarkerId, BitmapDescriptor> markerIcons = {};
  MarkerId? selectedMarkerId;
  Marker? selectedMarkerid;
  GoogleMapController? mapController;
  LocationData? currentLocation;

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
              searchBar(),
              showMap(),
              currentLocationButton(),
            ],
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
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
            selectMarker;
            setState(() {
              updateMarkers();
              clearSelectedMarker();
              selectedMarker = null;
            });
          },
        ),
        suggestionsCallback: _mapsController.getSuggestions,
        itemBuilder: (context, suggestion) {
          return ListTile(
            title: Text(suggestion.title),
            subtitle: Text(suggestion.snippet),
          );
        },
        onSuggestionSelected: (suggestion) {
          print(suggestion.markerId);
          updateMarkers();
          selectMarker(suggestion.markerId);
          setState(() {
            clearSelectedMarker();
            updateMarkers();
          });
        },
      ),
    );
  }

  Expanded showMap() {
    return Expanded(
      child: GoogleMap(
        onMapCreated: (controller) {
          mapController = controller;
          fitBounds();
        },
        initialCameraPosition: const CameraPosition(
          target: LatLng(-17.775615, -63.198539),
          zoom: 15,
        ),
        markers:
            selectedMarkerId != null ? Set<Marker>.of([selectedMarkerid!]) : {},
        onTap: (_) {
          setState(() {
            updateMarkers();
            clearSelectedMarker();
            selectedMarker = null;
          });
        },
      ),
    );
  }

  Widget currentLocationButton() {
  return FloatingActionButton(
    onPressed: _getCurrentLocation,
    child: Icon(Icons.my_location, color: Colors.red), // Cambio de color a rojo
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
    LatLng latLng = LatLng(currentLocation!.latitude!, currentLocation!.longitude!);
    mapController!.animateCamera(CameraUpdate.newLatLng(latLng));
  }

  void selectMarker(MarkerId markerId) {
    setState(() {
      selectedMarkerId = markerId;
      selectedMarkerid =
          markers.firstWhere((marker) => marker.markerId == markerId);
    });

    if (mapController != null && selectedMarkerid != null) {
      mapController!.animateCamera(
        CameraUpdate.newLatLngZoom(
          selectedMarkerid!.position,
          20,
        ),
      );
    }

    updateMarkers(); // Actualiza los marcadores en el mapa con el nuevo marcador seleccionado
  }

  void clearSelectedMarker() {
    setState(() {
      selectedMarker = null;
      updateMarkers();
    });
  }

  void updateMarkers() {
  markerIcons.clear();
  for (Marker marker in markers) {
    markerIcons[marker.markerId] = BitmapDescriptor.defaultMarkerWithHue(
      marker.markerId == selectedMarkerId
          ? BitmapDescriptor.hueRed // Cambio de color a rojo
          : BitmapDescriptor.hueRed,
    );
  }
  setState(() {
    markers = markers.map((marker) {
      return marker.copyWith(
        iconParam: markerIcons[marker.markerId],
      );
    }).toSet();
  });
}

  static Set<Marker> _getMarkers() {
    List<Marker> markerList = MarkerList.getMarkers();
    return markerList.toSet();
  }

  void fitBounds() {
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
  }
}
*/