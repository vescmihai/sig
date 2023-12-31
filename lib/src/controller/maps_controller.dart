import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class MapsController {
  GoogleMapController? mapController;
  TextEditingController searchController = TextEditingController();
  MarkerId? selectedMarker;
  Map<MarkerId, BitmapDescriptor> markerIcons = {};
  MarkerId? selectedMarkerId;
  Marker? selectedMarkerid;

  Future<bool> requestLocationPermission() async {
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
/*
  Future<List<MarkerSuggestion>> getSuggestions(String query) async {
    List<MarkerSuggestion> suggestions = [];
 var markers = await futureMarkers;
    for (Marker marker in markers) {
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
*/
/*   static Future<Set<Marker>> _getMarkers() async {
    List<Marker> markerList = await MarkerList.getMarkers();
    return markerList.toSet();
  }  */

  void setState(VoidCallback callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }
}