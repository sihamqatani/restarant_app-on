import 'package:flutter/material.dart';
import 'package:restarant_app/shared/networks/cubit/mode_cubit/mode_cubit.dart';
import 'package:restarant_app/shared/shared_widgets/custom_rating.dart';

class CustomFoodCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.white,
      elevation: 0,
      color: ModeCubit.get(context).isDark ? Colors.black12 : Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Align(
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite_border,
                  size: 25,
                ),
                color: Colors.pink[100],
              ),
              alignment: Alignment.topLeft,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                padding: EdgeInsets.only(bottom: 100),
                width: double.infinity,
                height: 400,
                child: Center(
                  child: GestureDetector(
                    onTap: () {},
                    child: SizedBox(
                      height: 90,
                      child: Image.asset(
                        //'',
                        'assets/Menus/popular_food/popular1.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Align(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 103, right: 22),
                    child: Text(
                      'رز مع الدجاج',
                      //'ستيك لحم مع الخضار',
                      style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 18,
                          fontFamily: 'Cairo'),
                    ),
                  ),
                  alignment: Alignment.centerRight,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '1.2',
                      // '(1.9)',
                      //  Provider.of<Cart>(context, listen:true )
                      //       .meal.length

                      //  .toString(),
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 16,
                      ),
                    ),
                    Container(child: CustomRating(onRatingUpdate: (rating) {})),
                  ],
                ),
                alignment: Alignment.centerRight,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '500ريال',
                      // '\$12 ',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.red[200],
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Cairo'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 14),
                      child: CircleAvatar(
                        backgroundColor: Colors.red[100],
                        radius: 16,
                        child: Center(
                          child: IconButton(
                              iconSize: 16,
                              color: Colors.white,
                              icon: Icon(
                                Icons.add,
                              ),
                              onPressed: () {
                                // print(foodDetails.length);

                                // print();
                                //  print(foodDetails.length);
                              }),
                        ),
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
