import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restarant_app/modules/cart_screen/widgets/custom_container_cart.dart';
import 'package:restarant_app/modules/cart_screen/widgets/custom_nav_bar.dart';
import 'package:restarant_app/shared/networks/cubit/cubit.dart';
import 'package:restarant_app/shared/networks/cubit/states.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RestaurantCubit, RestaurantStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            bottomNavigationBar: CustomNavBar(
                text: 'اجمالي المبلغ :                 100',
                price: '100',
                buttonText: 'ادفع الان'),
            body: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: 3,
                      // itemExtent: 40,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: const EdgeInsets.only(
                                bottom: 3, left: 6, right: 6, top: 12),
                            child: CustomConatinerCart(
                              nameMeal: 'رزمع الدجاج',
                              image: 'assets/Menus/popular_food/pop4.png',
                              counter: 4,
                              price: 400,
                            ));
                      }),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
