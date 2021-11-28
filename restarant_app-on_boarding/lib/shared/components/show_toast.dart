import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum ToastColorstate { SUCCESS, ERROR, WARNING }

class ShowToast {
  void showToast({required String message, required ToastColorstate state}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: chooseToastColor(state),
        textColor: Colors.white,
        fontSize: 16.0);
  }

  Color chooseToastColor(ToastColorstate state) {
    Color color;
    switch (state) {
      case ToastColorstate.SUCCESS:
        color = Colors.green[900]!;
        break;
      case ToastColorstate.WARNING:
        color = Colors.amberAccent;
        break;
      case ToastColorstate.ERROR:
        color = Colors.red[300]!;
        break;
    }
    return color;
  }
}
