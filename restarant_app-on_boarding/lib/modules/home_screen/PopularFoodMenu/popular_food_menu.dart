import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:restarant_app/models/food_details_model.dart/meals_model.dart';
import 'package:restarant_app/modules/home_screen/PopularFoodMenu/widgets/custom_food_card.dart';
import 'package:restarant_app/shared/components/components.dart';
import 'package:restarant_app/shared/networks/cubit/cubit.dart';
import 'package:restarant_app/shared/networks/cubit/states.dart';
import 'package:restarant_app/shared/shared_widgets/custom_text.dart';

class PopularFoodMenu extends StatelessWidget {
  MealsModel? mealsModel;

  PopularFoodMenu({Key? key, this.mealsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RestaurantCubit, RestaurantStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = RestaurantCubit.get(context);
          return Conditional.single(
              context: context,
              conditionBuilder: (context) =>
                  state is! RestarantMealsLoadingState,
              widgetBuilder: (context) {
                return Container(
                  // color: Colors.white,
                  height: 440,
                  child: Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(
                              top: 8, right: 16, left: 16, bottom: 8),
                          child: CustomText(
                              text: 'الوجبات الاكثر طلبا',
                              fontsize: 20,
                              colorText: Colors.grey[600]!)),
                      Container(
                        height: 350,
                        padding: EdgeInsets.only(right: 8, left: 8),
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemExtent: 200,
                            itemCount: cubit.mealsModel.length,
                            itemBuilder: (context, index) {
                              return Container(
                                height: 400,
                                child: CustomCard(
                                  foodDetails: cubit.mealsModel[index],
                                ),
                              );
                            } //popularListItem(),
                            //popularListItem(),
                            // popularListItem(),
                            ),
                      )
                    ],
                  ),
                );
              },
              fallbackBuilder: (context) {
                return Center(
                    child: Container(
                        width: 50, height: 50, child: loadingIndicator()));
              });
        });
  }
}
