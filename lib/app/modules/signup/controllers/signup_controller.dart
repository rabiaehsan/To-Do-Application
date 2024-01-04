import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import FirebaseAuth
import 'package:todoapp/auth/firebase_functions.dart';

import '../../../routes/app_pages.dart';

class SignupController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance; // Firebase Auth instance
  final FirebaseFunctions _functions = FirebaseFunctions();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void onCreateAccount() async {
    if (nameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      try {
        UserCredential userCredential = await _auth
            .createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );

        // Optionally, store additional user data using your FirebaseFunctions
        await _functions.createUserCredential(
          userCredential.user!.uid, // Assuming you store user data by UID
          emailController.text,
          nameController.text,
        );

        Get.snackbar('Success', 'Account created successfully');
        // Navigate to the login screen after successful signup
        Get.offAllNamed(Routes.SIGNIN);
      } catch (e) {
        Get.snackbar('Error', 'Failed to create account');
      }
    } else {
      Get.snackbar('Error', 'All fields are required');
    }
  }
}
