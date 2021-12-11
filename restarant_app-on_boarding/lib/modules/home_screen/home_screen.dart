import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:restarant_app/models/catoregy/cateogries.dart';
import 'package:restarant_app/models/food_details_model.dart/food_details_model.dart';
import 'package:restarant_app/modules/home_screen/PopularFoodMenu/popular_food_menu.dart';
import 'package:restarant_app/modules/home_screen/TopMenuSetion/top_menu_section.dart';
import 'package:restarant_app/modules/home_screen/more_request_section/More_req_section.dart';
import 'package:restarant_app/modules/home_screen/search_section/search_section.dart';
import 'package:restarant_app/shared/components/components.dart';
import 'package:restarant_app/shared/networks/cubit/cubit.dart';
import 'package:restarant_app/shared/networks/cubit/states.dart';
import 'package:restarant_app/shared/shared_widgets/custom_text.dart';

class HomeScreen extends StatelessWidget {
  late List<Cateogries> menuType;
  // List<Cateorgy> menuType = [
  //  Cateorgy( 'برجر', 'assets/Menus/burger.png'),
  //  Cateorgy('بيتزا', 'assets/Menus/pizza-slice.png'),
  // Cateorgy('ايسكريم', 'assets/Menus/ice-cream.png'),
  // Cateorgy('لحم', 'assets/Menus/meat.png'),
  // Cateorgy('معجنات', 'assets/Menus/croissant.png'),
  // Cateorgy('دجاج', 'assets/Menus/chicken-leg.png'),
  // Cateorgy('سباجيتي', 'assets/Menus/noodles.png'),
  // Cateorgy('مشروبات', 'assets/Menus/cola.png'),
  // Cateorgy('أرز', 'assets/Menus/rice.png'),
  // ];
  List<FoodDetails> foodDetails = [
    FoodDetails(
        name: 'رزمع الدجاج ',
        imageUrl: 'assets/Menus/popular_food/popular2.png',
        noRating: 1.1,
        price: 20),
    FoodDetails(
        name: 'برياني ',
        imageUrl: 'assets/Menus/b.png',
        noRating: 1.9,
        price: 30),
    FoodDetails(
        name: 'برجركلاسيكي ',
        imageUrl: 'assets/Menus/b.png',
        noRating: 1.5,
        price: 25),
    FoodDetails(
        name: 'بيتزا ',
        imageUrl: 'assets/Menus/p.png',
        noRating: 2.5,
        price: 60),
  ];
  List imageSlider = [
    'assets/Menus/p.png',
    'assets/Menus/b.png',
    'assets/Menus/b.png'
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RestaurantCubit, RestaurantStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: Conditional.single(
              context: context,
              conditionBuilder: (context) => true,
              widgetBuilder: (context) {
                return SafeArea(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SearchSection(hintText: 'اكتب الوجبة التي تريدها'),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: TopMenuSection(),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomText(
                              text: 'الوجبات المتوفرة اليوم',
                              fontsize: 20,
                              colorText: Colors.grey[600]!),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MoreRequestSection(imageSlider: imageSlider),
                        ),
                        PopularFoodMenu()
                      ],
                    ),
                  ),
                );
              },
              fallbackBuilder: (context) => Center(child: loadingIndicator()),
            ),
          );
        });
  }
}
