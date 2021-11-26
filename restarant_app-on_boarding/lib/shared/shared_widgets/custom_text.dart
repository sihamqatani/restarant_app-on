import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  String text;
  double fontsize;
  Color colorText;
  CustomText({
    Key? key,
    required this.text,
    required this.fontsize,
    required this.colorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topRight,
      child: Text(text,
          textAlign: TextAlign.right,
          style: TextStyle(
              color: Colors.grey[600],
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Cairo')),
    );
  }
}
