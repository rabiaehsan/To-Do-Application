import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TaskEditingController extends GetxController {
  final taskNameController = TextEditingController();
  final taskDescController = TextEditingController();
  final selectedTag = 'Select a Tag'.obs; // Using Rx to observe changes

  void setSelectedTag(String tag) {
    selectedTag.value = tag;
  }
  @override
  void onClose() {
    taskNameController.dispose();
    taskDescController.dispose();
    super.onClose();
  }
}
