import 'package:firebase_auth/firebase_auth.dart';

class User_Register {
  Future<bool> registerUser(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      print("the exception was $e");
      return false;
    } catch (e) {
      print(" the exception was $e");
      return false;
    }
  }
}
