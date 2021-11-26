import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:restarant_app/models/food_details_model.dart/food_details_model.dart';
import 'package:restarant_app/modules/details_food_screen/details_food_screen.dart';
import 'package:restarant_app/shared/components/components.dart';
import 'package:restarant_app/shared/networks/cubit/mode_cubit/mode_cubit.dart';

class CustomCard extends StatelessWidget {
  final FoodDetails foodDetails;
  const CustomCard({Key? key, required this.foodDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: ModeCubit.get(context).isDark ? Colors.black12 : Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_border,
                color: Colors.red[200],
                size: 25,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              padding: EdgeInsets.only(bottom: 100),
              width: double.infinity,
              height: 350,
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    navigateTo(
                        context,
                        FoodDetailsScreen(
                            image: foodDetails.imageUrl,
                            name: foodDetails.name,
                            rating: foodDetails.noRating,
                            price: foodDetails.price));
                  },
                  child: Image.asset(
                    foodDetails.imageUrl,
                    // 'assets/Images/Menus/popular_food/popular1.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                child: Padding(
                  padding: const EdgeInsets.only(top: 210, right: 22),
                  child: Text(
                    foodDetails.name,
                    //'ستيك لحم مع الخضار',
                    style: TextStyle(
                        color: ModeCubit.get(context).isDark
                            ? Colors.white70
                            : Colors.grey[600],
                        fontSize: 18,
                        fontFamily: 'Cairo'),
                  ),
                ),
                alignment: Alignment.centerRight,
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8, left: 8),
                child: Align(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        //foodDetails[index].no_rating.toString(),
                        '(1.9)',
                        //  Provider.of<Cart>(context, listen:true )
                        //       .meal.length

                        //  .toString(),
                        style: TextStyle(
                            color: ModeCubit.get(context).isDark
                                ? Colors.white60
                                : Colors.grey[600],
                            fontSize: 22),
                      ),
                      Container(
                        child: RatingBar.builder(
                          itemSize: 20,
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
                    ],
                  ),
                  alignment: Alignment.centerRight,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${foodDetails.price.toString()}ريال',
                      // '\$12 ',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.red[200],
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Cairo'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: CircleAvatar(
                        backgroundColor: Colors.red[100],
                        radius: 20,
                        child: IconButton(
                            iconSize: 20,
                            color: Colors.white,
                            icon: Icon(
                              Icons.add,
                            ),
                            onPressed: () {
                              // print();
                              //  print(foodDetails.length);
                            }),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
