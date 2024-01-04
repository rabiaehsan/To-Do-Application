import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../utils/add_task_alert_dialoagstate.dart';
import '../../routes/app_pages.dart';
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "To-Do List",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [

          ElevatedButton(onPressed: () {
            FirebaseAuth.instance.signOut().then((value) {
              // After signing out, navigate to the login screen or perform other actions
              Get.toNamed(Routes.SIGNIN);
            }).catchError((error) {
              // Handle sign-out error
              print('Error signing out: $error');
            });
          },child: const Text("Logout")),
        ],
      ),
      body: TaskList(), // Display the list of tasks
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Code to add new tasks
          showDialog(
            context: context,
            builder: (context) => AddTaskAlertDialog(),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('tasks').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(
            child: Text('No tasks available.'),
          );
        }

        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            var task = snapshot.data!.docs[index];
            var taskDateTime = (task['dateTime'] as Timestamp).toDate();
            var isCompleted = task['completed'] ??
                false; // Get completion status from Firestore
            if (isCompleted) {
              return const SizedBox.shrink(); // Remove completed tasks visually
            }
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: ListTile(
                leading: ElevatedButton(
                  onPressed: () {
                    // Example of opening the dialog for editing a task
                    showDialog(
                      context: context,
                      builder: (context) => AddTaskAlertDialog(
                        taskId: 'task_id_to_edit',
                        initialTaskName: task['taskName'],
                        initialTaskDesc: task['taskDesc'],
                        initialDateTime: DateTime.now(),
                      ),
                    );
                  },
                  child: Text('Edit Task'),
                ),
                trailing: IconButton(
                  icon: const Icon(
                    Icons.delete,
                    size: 20,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    FirebaseFirestore.instance
                        .collection('tasks')
                        .doc(task.id)
                        .update({
                      'completed': true, // or false to mark as incomplete
                    });


                    FirebaseFirestore.instance
                        .collection('tasks')
                        .doc(task.id)
                        .delete();
                  },
                ),
                title: Text(task['taskName']),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(task['taskDesc']),
                    const SizedBox(height: 4),
                    Text(
                      'Date & Time: ${DateFormat('yyyy-MM-dd HH:mm').format(taskDateTime)}',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
