import 'package:flutter/material.dart';
import 'package:restarant_app/shared/shared_widgets/custom_food_card.dart';

class CatogryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 1,
          centerTitle: true,
          title: Text(
            'برجر',
            style: TextStyle(color: Colors.grey[900], fontFamily: 'Cairo'),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                childAspectRatio: 2 / 3,
                maxCrossAxisExtent: 290,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20),
            itemBuilder: (context, index) {
              return CustomFoodCard();
            },
          ),
        ),
      ),
    );
  }
}
