import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Add this import
import 'package:get/get.dart';
import 'package:todoapp/utils/indecator.dart';
import '../app/routes/app_pages.dart';
import '../utils/const.dart';

class FirebaseFunctions {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<void> createUserCredential(String email, String name, String text) async {
    try {
      final user = FirebaseAuth.instance.currentUser; // Get the current user
      if (user != null) {
        await _firebaseFirestore.collection('users').doc(user.uid).set({
          "uid": user.uid,
          'email': email,
          'name': name,
        }).then((value) =>
            Indecatore.classLoading());
            Get.offAllNamed(Routes.HOME)
    ;
      }
    } catch (e) {
      showToast(e.toString());
    }
  }
}
