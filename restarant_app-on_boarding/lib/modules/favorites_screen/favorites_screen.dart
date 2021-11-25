import 'package:flutter/material.dart';
import 'package:restarant_app/modules/favorites_screen/widgets/custom_fav_card.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.separated(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) => CustomFavCard(
                  image: 'assets/Menus/popular_food/popular1.png',
                  nameMeal: 'رز مع الدجاج',
                  price: 220,
                  cancel: () {},
                  shoppingCart: () {},
                ),
            separatorBuilder: (context, index) => Container(
                  height: 1,
                ),
            itemCount: 3),
      ),
    );
  }
}
