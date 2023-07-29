import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import './../controller/maps_controller.dart';
import '../view/maps_screenv2.dart';

/*class SearchBarW extends StatefulWidget {
  final MapsController mapsController;

  SearchBarW(this.mapsController);

  @override
  _SearchBarWState createState() => _SearchBarWState();
}

class _SearchBarWState extends State<SearchBarW> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TypeAheadField(
        textFieldConfiguration: TextFieldConfiguration(
          controller: widget.mapsController.searchController,
          decoration: InputDecoration(
            labelText: 'Buscar módulo',
          ),
          onSubmitted: (value) {
            // Aquí se ejecuta cuando se presiona Enter en el teclado
            // Llama al método selectMarker del controlador
            widget.mapsController.selectMarker;
            // Activa el hot reload automático
            setState(() {
              widget.mapsController.updateMarkers(); //new

              widget.mapsController.clearSelectedMarker();
              widget.mapsController.selectedMarker = null;
            });
          },
        ),
        suggestionsCallback: widget.mapsController.getSuggestions,
        itemBuilder: (context, suggestion) {
          return ListTile(
            title: Text(suggestion.title),
            subtitle: Text(suggestion.snippet),
          );
        },
        onSuggestionSelected: (suggestion) {
          widget.mapsController
              .updateMarkers(); // Actualiza los marcadores en el mapa
          // Aquí se ejecuta cuando se selecciona un marcador de la lista de sugerencias
          // Llama al método selectMarker del controlador
          widget.mapsController.selectMarker(suggestion.markerId);
          // Activa el hot reload automático
          setState(() {
            widget.mapsController.clearSelectedMarker();
            widget.mapsController.updateMarkers();
            // widget.mapsController.selectedMarker = null;
          });
        },
      ),
    );
  }
}

class MapsView extends StatefulWidget {
  final MapsController mapsController;

  MapsView(this.mapsController);

  @override
  _MapsViewState createState() => _MapsViewState();
}

class _MapsViewState extends State<MapsView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GoogleMap(
        onMapCreated: (controller) {
          widget.mapsController.mapController = controller;
          widget.mapsController.fitBounds();
        },
        initialCameraPosition: CameraPosition(
          target: LatLng(-17.775615, -63.198539),
          zoom: 15,
        ),
        markers: widget.mapsController.selectedMarkerId != null
            ? Set<Marker>.of([widget.mapsController.selectedMarkerid!])
            : {},
        onTap: (_) {
          setState(() {
            widget.mapsController.updateMarkers();
            widget.mapsController.clearSelectedMarker();
            widget.mapsController.selectedMarker = null;
          });
        },
      ),
    );
  }
}
*/
class BackgroundImage extends StatelessWidget {
  const BackgroundImage();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(2),
      child: Container(
        width: 600,
        height: 300,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/uagrmred.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
