import 'package:flutter/material.dart';

class CustomElevatedBotton extends StatelessWidget {
  final String theText;
  final Function() theFunction;
  const CustomElevatedBotton(
      {super.key, required this.theFunction, required this.theText});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 113, 143, 224),
          fixedSize: const Size(120, 50),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(7))),
      onPressed: theFunction,
      child: Text(
        theText,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
