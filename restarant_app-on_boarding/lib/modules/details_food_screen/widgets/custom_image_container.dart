import 'package:flutter/material.dart';

class CustomImageContainer extends StatelessWidget {
  String image;
  CustomImageContainer({
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 160,
        width: 160,
        decoration: BoxDecoration(shape: BoxShape.circle),
        child: Image.asset(image.toString()));
  }
}
