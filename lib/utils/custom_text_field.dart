import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8),
        Text(
          text,
          style: const TextStyle(fontSize: 15 , fontWeight: FontWeight.bold,color: Colors.grey),
        ),
      ],
    );
  }
}
