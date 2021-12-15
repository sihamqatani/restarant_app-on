import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:restarant_app/shared/components/components.dart';
import 'package:restarant_app/shared/networks/cubit/cubit.dart';
import 'package:restarant_app/shared/networks/cubit/mode_cubit/mode_cubit.dart';
import 'package:restarant_app/shared/networks/cubit/states.dart';

class MoreRequestSection extends StatelessWidget {
  List imageSlider;
  MoreRequestSection({Key? key, required this.imageSlider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RestaurantCubit, RestaurantStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Conditional.single(
              context: context,
              conditionBuilder: (context) =>
                  state is! RestarantVisibleMealsLoadingState,
              widgetBuilder: (context) {
                var cubit = RestaurantCubit.get(context);
                return CarouselSlider.builder(
                    itemCount: cubit.visibleMeals.length,
                    itemBuilder: (context, index, realIndex) {
                      return Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: ModeCubit.get(context).isDark
                                ? Colors.black12
                                : Colors.white,
                            width: 5,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            new BoxShadow(
                              color: Colors.white,
                              //  offset: new Offset(10.0, 10.0),
                            ),
                          ],
                        ),
                        height: 150,
                        // color: Colors.white,
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        child: Image(
                          image: NetworkImage(cubit.visibleMeals[index].image),
                          fit: BoxFit.fill,
                        ),
                      );
                    },
                    options: CarouselOptions(
                      initialPage: 0,
                      enlargeCenterPage: true,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      autoPlay: true,
                      // dotSize: 6.0,
                      autoPlayInterval: Duration(seconds: 3),
                    ));
              },
              fallbackBuilder: (context) => Center(
                  child: Container(
                      width: 50, height: 50, child: loadingIndicator())));
        });
  }
}
