import 'package:flutter/material.dart';

import 'package:restarant_app/layouts/restarant_layout.dart';
import 'package:restarant_app/models/food_details_model.dart/food_details_model.dart';
import 'package:restarant_app/modules/details_food_screen/widgets/custom_baground_container.dart';
import 'package:restarant_app/modules/details_food_screen/widgets/custom_container_details.dart';
import 'package:restarant_app/modules/details_food_screen/widgets/custom_image_container.dart';
import 'package:restarant_app/shared/components/components.dart';
import 'package:restarant_app/shared/networks/cubit/mode_cubit/mode_cubit.dart';

class FoodDetailsScreen extends StatelessWidget {
  String? image;
  String? name;
  dynamic rating;
  dynamic price;
  FoodDetailsScreen({
    required this.image,
    required this.name,
    required this.rating,
    required this.price,
  });
  List<FoodDetails> foodDetails = [];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Stack(
                children: [
                  CustomBackgroundContainer(
                    arrowBack: () {
                      navigateTo(context, RestarantLayout());
                    },
                    cartShopping: () {},
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                        padding: const EdgeInsets.only(top: 35),
                        child: CustomImageContainer(image: image!)),
                  ),
                  Positioned(
                      top: 230,
                      child: CustomContainerDetails(
                        image: image,
                        name: name,
                        price: price,
                        rating: rating,
                      )),
                ],
              ),
              SizedBox(height: 1)
            ],
          ),
        ),
      ),
    );
  }
}
