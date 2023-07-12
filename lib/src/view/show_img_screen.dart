import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:sig/src/service/firebase_service.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ShowImage extends StatelessWidget {
  final String imageUrl;
  const ShowImage({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
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
                    )))));
  }
}

/* 
FutureBuilder<String>(
                  future: firebaseService.getUrlImagen(imageUrl),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data == 'no') {
                        return Text('no hay data');
                      } else {
                        return Image.network(
                          snapshot.data!,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                        );
                      }
                    } else {
                      return Container(
                          padding: const EdgeInsets.all(17),
                          height: 50,
                          width: 50,
                          child: const CircularProgressIndicator());
                    }
                  },
                ) */