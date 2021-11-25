import 'package:flutter/material.dart';

class CustomRedContainer extends StatelessWidget {
  const CustomRedContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .8,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.pink[50],
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
          )),
    );
  }
}
