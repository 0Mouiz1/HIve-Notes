import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;

  MyButton({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 40.0,
      minWidth: 70.0,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0), // Circular borders
        side: BorderSide(color: Colors.black), // Border color
      ),
      color: Colors.yellow,
      child: Text(text),
    );
  }
}
