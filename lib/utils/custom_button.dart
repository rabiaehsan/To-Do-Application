import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.title,required this.function});
  final String title;
  final Function function;
   @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: ()=> function(),
          child: Container(
            height: 50,
            width: 200,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              gradient:  LinearGradient(
                colors: [Colors.deepOrange, Colors.orange],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              ),
             child: Center(child: Text(title,style: const TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),)),
            ),

        ),

      ]
    );
  }
}
