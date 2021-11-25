import 'package:flutter/material.dart';

class CustomLogo extends StatelessWidget {
  String text;
  double fontSize;
  Color fontColor;
  CustomLogo({
    required this.text,
    required this.fontSize,
    required this.fontColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: Text(
            text,
            style: TextStyle(
                color: fontColor,
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                fontFamily: 'Cairo'),
          ),
        ),
      ],
    );
  }
}
