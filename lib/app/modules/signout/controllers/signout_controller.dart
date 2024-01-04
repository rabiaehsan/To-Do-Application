import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todoapp/app/routes/app_pages.dart';

class SignoutController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void onClose() async {
    await signOut(); // Automatically sign out when the controller is closed
    super.onClose();
  }
  Future<void> signOut() async {
    try {
      await _auth.signOut();
      Get.offAllNamed(Routes.SIGNIN); // Navigate to the login screen after sign out
    } catch (e) {
       if (kDebugMode) {
         print('Error signing out');
       }
    }
  }
}
