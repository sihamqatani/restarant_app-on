import 'package:flutter/material.dart';
import 'package:restarant_app/models/food_details_model.dart/food_details_model.dart';
import 'package:restarant_app/modules/home_screen/PopularFoodMenu/widgets/custom_food_card.dart';
import 'package:restarant_app/shared/shared_widgets/custom_text.dart';

class PopularFoodMenu extends StatelessWidget {
  List<FoodDetails> foodDetails;

  PopularFoodMenu({Key? key, required this.foodDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.white,
      height: 440,
      child: Column(
        children: [
          Padding(
              padding:
                  const EdgeInsets.only(top: 8, right: 16, left: 16, bottom: 8),
              child: CustomText(
                  text: 'الوجبات الاكثر طلبا',
                  fontsize: 20,
                  colorText: Colors.grey[600]!)),
          Container(
            height: 350,
            padding: EdgeInsets.only(right: 8, left: 8),
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemExtent: 200,
              itemCount: foodDetails.length,
              itemBuilder: (context, index) => Container(
                height: 400,
                child: CustomCard(
                  foodDetails: foodDetails[index],
                ),
              ),

              //popularListItem(),
              //popularListItem(),
              // popularListItem(),
            ),
          )
        ],
      ),
    );
  }
}
