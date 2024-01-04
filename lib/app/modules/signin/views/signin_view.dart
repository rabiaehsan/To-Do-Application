import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:todoapp/utils/custom_button.dart';
import 'package:todoapp/utils/reusetextfield.dart';

import '../../../routes/app_pages.dart';
import '../controllers/signin_controller.dart';

class SigninView extends GetView<SigninController> {
  const SigninView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          // mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(height: 80,),
             Center(child: Container(
             width: 200, // Set the desired width
            height: 200, // Set the desired height
             child: Image.asset('images/signin.jpg',)),),
            const SizedBox(height: 30,),
             ReUseTextField(hintText: 'Email', icon: Icons.email, controller:controller.emailController),
            const SizedBox(height: 30,),
            ReUseTextField(hintText: 'Password', icon: Icons.lock, controller:controller.passwordController),
            const SizedBox(height: 30,),
            CustomButton(title: 'Sign In', function: (){
              controller.onSignin();
            }),


          ]
        ),
      ),
          bottomNavigationBar: InkWell(
            onTap: (){
              Get.toNamed(Routes.SIGNUP);
            },
            child: Container(
              height: 60,
              child: const Center(
                child: Text(
                  'Don\'t have an account? Sign Up',
                ),
              ),
            ),
          ) ,
    );
  }
}
