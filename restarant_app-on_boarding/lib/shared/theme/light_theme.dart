import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LightTheme {
  ThemeData lightTheme = ThemeData(
    fontFamily: 'Cairo',
    focusColor: Colors.red[200],
    primaryColor: Colors.red[200],
    appBarTheme: AppBarTheme(
        actionsIconTheme: IconThemeData(color: Colors.red[100]),
        iconTheme: IconThemeData(color: Colors.red[200]),
        backwardsCompatibility: true,
        backgroundColor: Colors.white,
        elevation: 0,
        titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20, color: Colors.red[400]),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        )),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.black12,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.red[100],
        elevation: 0,
        selectedLabelStyle: TextStyle(fontFamily: 'Cairo'),
        type: BottomNavigationBarType.fixed),
  );
}
