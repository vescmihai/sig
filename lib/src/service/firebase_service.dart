import 'package:firebase_storage/firebase_storage.dart';

class _FirebaseService {
  Future<String> getUrlImagen(String foto) async {
    String img = 'no';
    if (foto != null) {
      final ref = FirebaseStorage.instance.ref().child(foto);
      try {
        await ref.getDownloadURL().then((value) {
          img = value;
        });
      } on FirebaseException catch (e) {
        print("Error en la descarga de la imagen '${e.code}': ${e.message}");
      }
    }
    return img;
  }

  ///Retorna una lista con los nombres de todos archivos.
  Future<List<String>> getAll(String folder) async {
    Reference ref = FirebaseStorage.instance.ref().child(folder);
    ListResult list = await ref.listAll();

    List<String> urls = [];
    for (Reference item in list.items) {
      String url = await item.getDownloadURL();
      urls.add(url);
    }
    return urls;
  }

  ///Retorna un Map con todas las urls de las imagenes encontradas del edificio y secccion especificada.
  ///Se especifica en cada imagen si es o no una imagen 360.
  Future<Map<String, bool>> getImgBySection(
      String edificioCode, String sectionCode) async {
    List<MapEntry<String, bool>> urls = [];

    if (edificioCode.isNotEmpty && sectionCode.isNotEmpty) {
      Reference ref = FirebaseStorage.instance.ref().child(edificioCode);
      ListResult list = await ref.listAll();

      List<Reference> filteredItems = list.items.where((Reference ref) {
        return ref.name.startsWith(sectionCode);
      }).toList();

      if (filteredItems.isNotEmpty) {
        for (Reference item in filteredItems) {
          String url = await item.getDownloadURL();

          if (item.name.contains('(360)')) {
            urls.insert(0, MapEntry(url, true));
          } else {
            urls.add(MapEntry(url, false));
          }
        }
      }
    }
    return Map.fromEntries(urls);
  }

  Future<bool> hasImages(String edificioCode, String sectionCode) async {
    bool hasImages = false;

    if (edificioCode.isNotEmpty && sectionCode.isNotEmpty) {
      Reference ref = FirebaseStorage.instance.ref().child(edificioCode);
      ListResult list = await ref.listAll();

      List<Reference> filteredItems = list.items.where((Reference ref) {
        return ref.name.startsWith(sectionCode);
      }).toList();

      if (filteredItems.isNotEmpty) {
        hasImages = true;
      }
    }
    return hasImages;
  }
}

final firebaseService = _FirebaseService();
