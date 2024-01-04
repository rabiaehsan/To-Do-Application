import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

class AddTaskAlertDialog extends StatefulWidget {
  final String? taskId; // Pass the task ID for editing
  final String? initialTaskName; // Pass the initial task name for editing
  final String? initialTaskDesc; // Pass the initial task description for editing
  final DateTime? initialDateTime; // Pass the initial date and time for editing
  const AddTaskAlertDialog({
    Key? key,
    this.taskId,
    this.initialTaskName,
    this.initialTaskDesc,
    this.initialDateTime,
  }) : super(key: key);

  @override
  _AddTaskAlertDialogState createState() => _AddTaskAlertDialogState();
}

class _AddTaskAlertDialogState extends State<AddTaskAlertDialog> {
  final TextEditingController taskNameController = TextEditingController();
  final TextEditingController taskDescController = TextEditingController();
  late DateTime selectedDate;
  late TimeOfDay selectedTime;

  @override
  void initState() {
    super.initState();
    // Initialize with the initial values for editing
    selectedDate = widget.initialDateTime ?? DateTime.now();
    selectedTime = TimeOfDay.fromDateTime(selectedDate);
    taskNameController.text = widget.initialTaskName ?? '';
    taskDescController.text = widget.initialTaskDesc ?? '';
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return AlertDialog(
      scrollable: true,
      title: const Text(
        'New Task',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16, color: Colors.brown,fontWeight: FontWeight.bold),
      ),
      content: SizedBox(
        height: height * 0.5,
        width: width,
        child: Form(
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: taskNameController,
                style: const TextStyle(fontSize: 14),
                decoration: const InputDecoration(
                  hintText: 'Enter task name',


                ),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: taskDescController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                style: const TextStyle(fontSize: 14),
                decoration: const InputDecoration(
                  hintText: 'Enter task description',

                ),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () => _selectDate(context),
                child: Text('Select Date: ${DateFormat('yyyy-MM-dd').format(selectedDate)}'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => _selectTime(context),
                child: Text('Select Time: ${selectedTime.format(context)}'),
              ),
            ],
          ),
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Get.close(0);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey,
          ),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () async {
            // Get task details from controllers
            String taskName = taskNameController.text;
            String taskDesc = taskDescController.text;

            // Format the selected date and time
            DateTime combinedDateTime = DateTime(
              selectedDate.year,
              selectedDate.month,
              selectedDate.day,
              selectedTime.hour,
              selectedTime.minute,
            );

            try {
              // Save task data to Firestore
              await FirebaseFirestore.instance.collection('tasks').add({
                'taskName': taskName,
                'taskDesc': taskDesc,
                'dateTime': combinedDateTime,
                'completed': false,
              });

              // Close the dialog on successful data save
              Get.close(0);
            } catch (e) {
              // Handle error while saving data to Firestore
              print('Error saving data: $e');
              // Optionally show an error message
            }
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
