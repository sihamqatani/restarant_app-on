import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomFavCard extends StatelessWidget {
  String image;
  String nameMeal;
  dynamic price;
  void Function()? cancel;
  void Function()? shoppingCart;
  CustomFavCard({
    Key? key,
    required this.image,
    required this.nameMeal,
    required this.price,
    this.cancel,
    this.shoppingCart,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Container(
            height: 90,
            width: 80,
            decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage(image), fit: BoxFit.fill),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
            child: Column(
              children: [
                Text(nameMeal,
                    style: TextStyle(
                        color: Colors.red[400], fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 12,
                ),
                Container(
                  child: RatingBar.builder(
                    itemSize: 14,
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
                    onRatingUpdate: (rating) {
                      // print(rating);
                    },
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  '${price}ريال',
                  style: TextStyle(
                      color: Colors.red[400], fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.cancel,
                    color: Colors.red[100],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  child: Icon(
                    Icons.shopping_cart_sharp,
                    size: 20,
                    color: Colors.red[100],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
