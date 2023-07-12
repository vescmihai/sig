import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sig/src/service/firebase_service.dart';
import 'package:sig/src/view/show_img_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CarouselImageWidget extends StatelessWidget {
  final String firebaseFolder;
  const CarouselImageWidget({super.key, required this.firebaseFolder});

  @override
  Widget build(BuildContext context) {
    return listImageItems(firebaseFolder);
  }

  FutureBuilder listImageItems(String folder) {
    return FutureBuilder<List<String>>(
        future: firebaseService.getAll(folder),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final list = snapshot.data;
            List<GestureDetector> widgets = list!.map((item) {
              print(item);
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ShowImage(
                                imageUrl: item,
                              )));
                },
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(7.0),
                    child: imageWidget(item)),
              );
            }).toList();

            return CarouselSlider(
                items: widgets,
                options: CarouselOptions(
                  height: 195,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.9,
                  enlargeCenterPage: false,
                  initialPage: 0,
                  enableInfiniteScroll: false,
                  reverse: false,
                  autoPlay: false,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  scrollDirection: Axis.horizontal,
                ));
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return Container(alignment: Alignment.center, child: CircularProgressIndicator());
          }
        });
  }

  CachedNetworkImage imageWidget(String imageUrl) {
    return CachedNetworkImage(
      fadeInDuration: Duration(milliseconds: 250),
        alignment: Alignment.center,
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        errorWidget: (context, url, error) => Container(
            alignment: Alignment.center, child: const Icon(Icons.error)));
  }
}
