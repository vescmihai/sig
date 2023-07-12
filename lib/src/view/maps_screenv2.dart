/*import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:sig/src/model/marker_model.dart';
import './../controller/maps_controller.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:math' as math;

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
              //  clearMarkers();
              //updateMarkers();
              clearSelectedMarker();
              //selectedMarker = null;
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
          // print(suggestion.markerId);
          //updateMarkers();
          selectMarker(suggestion.markerId);
          setState(() {
            clearMarkers();
            clearSelectedMarker();
            // updateMarkers();
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
            //clearMarkers();
            // updateMarkers();
            clearSelectedMarker();
            // selectedMarker = null;
          });
        },
      ),
    );
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

  void clearMarkers() {
    setState(() {
      markers.clear();
      updateMarkers();
    });
  }

  void updateMarkers() {
    markerIcons.clear();
    for (Marker marker in markers) {
      markerIcons[marker.markerId] = BitmapDescriptor.defaultMarkerWithHue(
        marker.markerId == selectedMarkerId
            ? BitmapDescriptor.hueRed
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