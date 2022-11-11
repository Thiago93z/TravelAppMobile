import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:travel_mobile_app/model/place_model.dart';

class PlaceRepository {
  Future<String?> registerPlace(Place place) async {
    try {
      final uid = FirebaseAuth.instance.currentUser?.uid;
      QuerySnapshot namePlace = await FirebaseFirestore.instance
          .collection("Users")
          .doc(uid)
          .collection("places")
          .where("nombre", isEqualTo: place.nombre)
          .get();

      if (namePlace.docs.isEmpty) {
        final documentPlace = FirebaseFirestore.instance
            .collection("Users")
            .doc(uid)
            .collection("places")
            .doc();
        place.id = documentPlace.id;
        final resultado = await FirebaseFirestore.instance
            .collection("Users")
            .doc(uid)
            .collection("places")
            .doc(place.id)
            .set(place.convertir());
        return place.id;
      } else {
        return "Ya tienes este lugar en tu lista";
      }
    } on FirebaseException catch (e) {
      print(e.code);
      return e.code;
    }
  }
}
