import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator(
      {Key? key,
      Indicator? indicatorType,
      List<Color>? colors,
      int? strokeWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoadingIndicator(
      indicatorType: Indicator.ballPulse,

      /// Required, The loading type of the widget
      colors: [Colors.pink[200]!, Colors.red[100]!, Colors.red[400]!],

      /// Optional, The color collections
      strokeWidth: 0,

      /// Optional, The stroke of the line, only applicable to widget which contains line
      // backgroundColor: Colors.black,      /// Optional, Background of the widget
      //pathBackgroundColor: Colors.black   /// Optional, the stroke backgroundColor
    );
  }
}
