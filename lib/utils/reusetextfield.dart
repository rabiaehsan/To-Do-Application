import 'package:flutter/material.dart';

class ReUseTextField extends StatelessWidget {

  const ReUseTextField({
    Key? key,
    required this.hintText,
    required this.icon, required this.controller,
  }) : super(key: key);
  final TextEditingController controller;
  final String hintText;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(

        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              obscureText: hintText == 'Password' ? true : false,

              controller: controller,
              decoration: InputDecoration(
                contentPadding:const EdgeInsets.symmetric(horizontal: 10, ),

                border: const OutlineInputBorder(

                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),

                prefixIcon: Icon(icon), // Use the provided icon parameter
                hintText: hintText,

              ),
            ),
          ),

        ],
      );

  }
}
