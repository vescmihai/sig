import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import './../controller/maps_controller.dart';

class SearchBarW extends StatelessWidget {
  final MapsController mapsController;

  SearchBarW(this.mapsController);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TypeAheadField(
        textFieldConfiguration: TextFieldConfiguration(
          controller: mapsController.searchController,
          decoration: InputDecoration(
            labelText: 'Buscar módulo',
          ),
        ),
        suggestionsCallback: mapsController.getSuggestions,
        itemBuilder: (context, suggestion) {
          return ListTile(
            title: Text(suggestion.title),
            subtitle: Text(suggestion.snippet),
          );
        },
        onSuggestionSelected: (suggestion) {
          mapsController.selectMarker(suggestion.markerId);
        },
      ),
    );
  }
}

class MapsView extends StatelessWidget {
  final MapsController mapsController;

  MapsView(this.mapsController);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GoogleMap(
        onMapCreated: (controller) {
          mapsController.mapController = controller;
          mapsController.fitBounds();
        },
        initialCameraPosition: CameraPosition(
          target: LatLng(-17.775615, -63.198539),
          zoom: 14,
        ),
        markers: mapsController.markers,
        onTap: (_) {
          mapsController.clearSelectedMarker();
          mapsController.updateMarkers();
        },
      ),
    );
  }
}
