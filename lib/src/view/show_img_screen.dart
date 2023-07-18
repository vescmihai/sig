import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:panorama/panorama.dart';

class ShowImage extends StatelessWidget {
  final String imageUrl;
  final bool isPanorama;
  const ShowImage({Key? key, required this.imageUrl, required this.isPanorama})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isPanorama) {
      return Scaffold(body: SafeArea(child: panoramaImage()));
    } else {
      return Scaffold(body: SafeArea(child: normalImage(context)));
    }
  }

  Center normalImage(BuildContext context) {
    return Center(
      child: InteractiveViewer(
          boundaryMargin: const EdgeInsets.all(10),
          minScale: 0.5,
          maxScale: 2.5,
          constrained: false,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.center,
            child: CachedNetworkImage(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              imageUrl: imageUrl,
              fit: BoxFit.cover,
              errorWidget: (context, url, error) => Container(
                alignment: Alignment.center,
                child: const Icon(Icons.error),
              ),
            ),
          )),
    );
  }

  Center panoramaImage() {
    return Center(
        child: Panorama(
      croppedArea: const Rect.fromLTRB(0, 0.1, 1, 0.9),
      animSpeed: 0.8,
      sensitivity: 1.6,
      zoom: 0,
      maxZoom: 1.2,
      child: Image.network(imageUrl),
    ));
  }
}
