import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/utils/custom_button.dart';
import 'package:todoapp/utils/custom_text_field.dart';

import '../app/routes/app_pages.dart';


class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 150,width: 50,),

                Material(
                  child: GestureDetector(
                    onTap: () {
                      print("Tapped Icon"); // Check if this message appears in the console
                      Get.toNamed(Routes.VIDEOPLAYERAPP);
                    },
                    child: const Icon(Icons.play_circle_fill_outlined, size: 50),
                  ),
                ),

                const Text(" How its ",style: TextStyle(
                    fontSize: 20,
                    color: Colors.black),

                ),
                const Text("Works",style: TextStyle(
                    fontSize: 20,
                    color: Colors.orange),
                )

              ],

            ),
            Image.asset("images/splash.png",width: 700,),

            const Text('Manage Your',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
            const SizedBox(height: 8,),
            const Text('Everyday task list',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
            const SizedBox(height: 8,),
            const  CustomTextField(text: 'Lorem Ipsum is simply dummy text',),
            const CustomTextField(text: 'Lorem Ipsum is simply dummy text',),
            const CustomTextField(text: 'Lorem Ipsum is simply',),
            const SizedBox(height: 20,),

                     CustomButton(title: 'Get Started', function: (){
              Get.toNamed(Routes.SIGNIN);
           })



          ],

        ),
      ),
    );
  }
}
