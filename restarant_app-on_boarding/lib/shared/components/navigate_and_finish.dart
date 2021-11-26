import 'package:flutter/material.dart';

class NavigateAndFinish {
  void navigateAndFinish(context, widget) {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
      return widget;
    }), (Route<dynamic> route) => false);
  }
}
