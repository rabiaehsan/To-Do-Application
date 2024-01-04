import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/signout_controller.dart';

class SignoutView extends GetView<SignoutController> {
  const SignoutView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              controller.signOut();
            },
            icon: const Icon(Icons.logout),


          )
        ],
      ),
          );
  }
}
