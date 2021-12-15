import 'package:flutter/material.dart';
import 'package:restarant_app/modules/onBoarding/onBoarding_screen.dart';

class onBoardingItem extends StatelessWidget {
  final OnBoardingModel onBoardingModel;
  onBoardingItem({Key? key, required this.onBoardingModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            child: Image(
          image: AssetImage(
            onBoardingModel.image,
          ),
          fit: BoxFit.cover,
        )),
        SizedBox(
          height: 20,
        ),
        Text(
          onBoardingModel.title,
          style: Theme.of(context)
              .textTheme
              .headline4
              ?.copyWith(color: Colors.red[300]),
        ),
        SizedBox(
          height: 20,
        ),
        Text(onBoardingModel.body,
            style: Theme.of(context)
                .textTheme
                .subtitle2
                ?.copyWith(color: Colors.red[100], fontSize: 14)),
      ],
    );
  }
}
