import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/app/modules/home/controllers/taskeditingcontrollers.dart';

class TaskTags extends StatefulWidget {
  const TaskTags({super.key,required this.controller});
  final TaskEditingController controller;

  @override
  State<TaskTags> createState() => _TaskTagsState();
}

class _TaskTagsState extends State<TaskTags> {


  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Icon(CupertinoIcons.tag, color: Colors.brown),
        const SizedBox(width: 15.0),
        PopupMenuButton<String>(
          icon: const Icon(Icons.arrow_drop_down), // Dropdown icon
          initialValue: widget.controller.selectedTag.value,
          itemBuilder: (BuildContext context) {
            return <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: 'Select a Tag',
                child: Text('Select a Tag'),
              ),
              PopupMenuItem<String>(
                value: 'Tag 1',
                child: Text('work'),
              ),
              PopupMenuItem<String>(
                value: 'Tag 2',
                child: Text('prayers'),
              ),
              PopupMenuItem<String>(
                value: 'Tag 3',
                child: Text('Tag 3'),
              ),
              // Add more tags as needed
            ];
          },
          onSelected: (String newValue) {
            setState(() {
              widget.controller.selectedTag.value = newValue;

            });
          },
        ),
      ],
    );
  }
}