import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomRating extends StatelessWidget {
  void Function(double)? onRatingUpdate;
  CustomRating({
    required this.onRatingUpdate,
  });
  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      itemSize: 25,
      initialRating: 1,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      // itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: Colors.red[200],
      ),
      onRatingUpdate: onRatingUpdate!,
    );
  }
}
