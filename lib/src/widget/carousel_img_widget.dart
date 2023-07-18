import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sig/src/service/firebase_service.dart';
import 'package:sig/src/utils/images.dart';
import 'package:sig/src/view/show_img_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CarouselImageWidget extends StatelessWidget {
  final String edificioCode;
  final String sectionCode;
  const CarouselImageWidget(
      {super.key, required this.edificioCode, required this.sectionCode});

  @override
  Widget build(BuildContext context) {
    return listImageItems(edificioCode, sectionCode);
  }

  FutureBuilder listImageItems(String edificioCode, sectionCode) {
    return FutureBuilder<Map<String, bool>>(
        future: firebaseService.getImgBySection(edificioCode, sectionCode),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final list = snapshot.data;
            List<Widget>? widgets = [];

            if (list != null && list.values.isNotEmpty) {
              widgets = listClickImagesW(context, list);
            } else {
              widgets.add(notFoundImageWidget());
            }

            return CarouselSlider(
                items: widgets,
                options: CarouselOptions(
                  height: 185,
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
            return Container(
                alignment: Alignment.center,
                child: const CircularProgressIndicator());
          }
        });
  }

  CachedNetworkImage imageWidget(String imageUrl) {
    return CachedNetworkImage(
        fadeInDuration: const Duration(milliseconds: 250),
        alignment: Alignment.center,
        imageUrl: imageUrl,
        width: 330,
        height: 185,
        fit: BoxFit.cover,
        placeholder: (context, url) => Image.asset(
              loadingPoints,
              fit: BoxFit.cover,
            ),
        errorWidget: (context, url, error) => Container(
            alignment: Alignment.center, child: const Icon(Icons.error)));
  }

  GestureDetector notFoundImageWidget() {
    return GestureDetector(
        child: ClipRRect(
            child: Image.asset(
      imageMotFound,
      fit: BoxFit.cover,
      width: 400,
    )));
  }

  List<Widget> listClickImagesW(BuildContext context, Map<String, bool> list) {
    return list.keys.map((url) {
      bool isPanorama = list[url]!;
      return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ShowImage(
                          imageUrl: url,
                          isPanorama: isPanorama,
                        )));
          },
          child: Stack(children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(7.0),
                child: imageWidget(url)),
            if (isPanorama)
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.black45),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                  child: Image.asset(icon360, fit: BoxFit.contain, height: 25),
                ),
              ),
          ]));
    }).toList();
  }
}
