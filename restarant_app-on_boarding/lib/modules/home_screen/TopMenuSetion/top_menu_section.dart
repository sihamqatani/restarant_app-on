import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:restarant_app/modules/home_screen/TopMenuSetion/top_menu_items.dart';
import 'package:restarant_app/shared/components/components.dart';
import 'package:restarant_app/shared/networks/cubit/cubit.dart';
import 'package:restarant_app/shared/networks/cubit/states.dart';

class TopMenuSection extends StatelessWidget {
  // List< Cateogries> menuType=[];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RestaurantCubit, RestaurantStates>(
      listener: (contex, state) {},
      builder: (context, state) {
        return Container(
          // margin: EdgeInsets.symmetric(vertical: 20),
          height: 100,
          width: MediaQuery.of(context).size.width,

          child: Conditional.single(
              context: context,
              conditionBuilder: (context) =>
                  state is! RestarantGetcatogriesLoadingState,
              widgetBuilder: (context) {
                return ListView.builder(
                  // reverse: true,
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => TopMenuItems(
                      menuType: RestaurantCubit.get(context).catogry[index]),
                  //shrinkWrap: true,

                  itemCount: RestaurantCubit.get(context).catogry.length,
                  itemExtent: 50,
                  scrollDirection: Axis.horizontal,
                );
              },
              fallbackBuilder: (context) {
                return Center(
                    child: Container(
                        width: 50, height: 50, child: loadingIndicator()));
              }),
        );
      },
    );
  }
}
