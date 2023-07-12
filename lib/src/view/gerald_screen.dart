import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:sig/src/model/marker_model.dart';
import 'package:sig/src/widget/carousel_img_widget.dart';
import './../controller/maps_controller.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:math' as math;

class MapsScreen extends StatefulWidget {
  @override
  _MapsScreenState createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  final MapsController _mapsController = MapsController();
  final PanelController _panelControlller = PanelController();
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
        fitBounds();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
        controller: _panelControlller,
        minHeight: MediaQuery.of(context).size.height * 0.11,
        maxHeight: MediaQuery.of(context).size.height,
        snapPoint: 0.5,
        backdropEnabled: true,
        backdropOpacity: 0.1,
        panelSnapping: true,
        panel: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
              Icon(Icons.drag_handle),
            ]),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Modulo 300',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Facultad de cienesnsdfasdfa',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ],
              ),
            ),
            const CarouselImageWidget(
              firebaseFolder: '212/',
            )
          ],
        ),
        body: Column(
          children: [
            searchBar(),
            showMap(),
          ],
        ) /* Column(
          children: [
            FloatingActionButton(
              onPressed: () {
                _panelControlller.hide();
              },
              child: Icon(Icons.close),
            ),
            FloatingActionButton(
              onPressed: () {
                _panelControlller.show();
              },
              child: const Icon(Icons.open_in_new_outlined),
            )
          ],
        ) */
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
            ? BitmapDescriptor.hueYellow
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
