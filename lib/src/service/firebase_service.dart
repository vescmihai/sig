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

  Future<List<String>> getAll(String folder) async {
    Reference ref = FirebaseStorage.instance.ref().child(folder);
    ListResult list = await ref.listAll();
    List<Reference> items = list.items;
    List<String> urls = [];
    for (Reference item in items) {
      String url =
          await item.getDownloadURL(); // obtener la url de cada elemento
      urls.add(url); // agregar la url a la lista
    }
    return urls;
  }
}

final firebaseService = _FirebaseService();
