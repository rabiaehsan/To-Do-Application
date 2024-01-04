import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Indecatore{
  static void showLoading(){
    Get.dialog(const Center(child: CircularProgressIndicator()), barrierDismissible: false);
  }
  static void classLoading(){
    if(Get.isDialogOpen!) {
      Get.back();
    }
  }
}