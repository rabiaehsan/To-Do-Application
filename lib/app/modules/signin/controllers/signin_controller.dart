import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todoapp/auth/firebase_auth.dart'; // Import your Firebase Authentication class
import '../../../routes/app_pages.dart';

class SigninController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance; // Firebase Auth instance
  final FirebaseAuthentication _authentication = FirebaseAuthentication();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void onSignin() async {
    if (emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      try {
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
            Get.offAllNamed(Routes.HOME);
      } catch (e) {
        Get.snackbar('Error', 'Login failed please write correct email and password');
      }
    } else {
      Get.snackbar('Error', 'All fields are required');
    }
  }
}
