import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DarkTheme {
  ThemeData darkTheme = ThemeData(
    fontFamily: 'Cairo',
    focusColor: Colors.red[200],
    primaryColor: Colors.red[200],
    primaryColorDark: Colors.black12,
    cardColor: Colors.black,
    scaffoldBackgroundColor: Colors.grey[900],
    primarySwatch: Colors.deepOrange,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.deepOrange,
    ),
    textTheme: TextTheme(
        bodyText1: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w600,
      fontSize: 18,
    )),
    appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(
            //color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.red[400]),
        iconTheme: IconThemeData(color: Colors.white),
        backwardsCompatibility: false,
        backgroundColor: Colors.black12,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.black12,
          statusBarIconBrightness: Brightness.light,
        )),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.grey[900],
      elevation: 0,
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.red[100],
    ),
  );
}
