import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/custom_button.dart';

import '../../../../utils/reusetextfield.dart';
import '../../../routes/app_pages.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
            // mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(
                height: 80,
              ),
              Center(
                child: Container(
                    width: 200, // Set the desired width
                    height: 200, // Set the desired height
                    child: Image.asset(
                      'images/signup.jpg',
                    )),
              ),
              const SizedBox(
                height: 30,
              ),
              ReUseTextField(
                  hintText: 'Name',
                  icon: Icons.person,
                  controller: controller.nameController),
              const SizedBox(
                height: 30,
              ),
              ReUseTextField(


                  hintText: 'Email',
                  icon: Icons.email,
                  controller: controller.emailController),
              const SizedBox(
                height: 30,
              ),
              ReUseTextField(
                  hintText: 'Password',
                  icon: Icons.lock,
                  controller: controller.passwordController),
              const SizedBox(
                height: 30,
              ),
              CustomButton(title: 'Sign Up', function: () {
                controller.onCreateAccount();
              }),
              CustomButton(title: 'Sign Up', function: () {
                controller.onCreateAccount();
              }),
            ]),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          Get.toNamed(Routes.SIGNIN);
        },
        child: Container(
          height: 60,
          child: const Center(
            child: Text(
              'Already have an account? Sign In',
            ),
          ),
        ),
      ),
    );
  }
}
