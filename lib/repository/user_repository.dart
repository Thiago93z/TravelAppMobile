import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:travel_mobile_app/model/user_model.dart';

class UserRegister {
  Future<String?> registerUser(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user?.uid;
    } on FirebaseException catch (e) {
      return e.code;
    }
  }

  Future<String> createUser(Usuario usuario) async {
    try {
      var document = await FirebaseFirestore.instance
          .collection("Users")
          .doc(usuario.id)
          .set(usuario.convertir());
      return usuario.id;
    } on FirebaseException catch (e) {
      return e.code;
    }
  }
}
