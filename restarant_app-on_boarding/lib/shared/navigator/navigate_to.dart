import 'package:flutter/material.dart';

class NavigateTo {
  void navigateTo(context, widget) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return widget;
    }));
  }
}
