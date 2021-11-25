import 'package:flutter/material.dart';
import 'package:restarant_app/shared/networks/cubit/mode_cubit/mode_cubit.dart';

class CustomNavBar extends StatelessWidget {
  final String text;
  final String price;
  final String buttonText;
  CustomNavBar(
      {required this.text, required this.price, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ModeCubit.get(context).isDark ? Colors.black12 : Colors.white,
      width: 50,
      height: 150,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10, top: 16),
            child: Text(
              text,
              style: TextStyle(
                  color: Colors.red[200],
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  fontFamily: 'Cairo'),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: SizedBox(
              width: 200,
              child: MaterialButton(
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                color: Colors.red[200],
                onPressed: () {},
                child: Text(
                  buttonText,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      letterSpacing: 2,
                      fontFamily: 'Cairo'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
