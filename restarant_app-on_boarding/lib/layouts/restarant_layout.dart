import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restarant_app/shared/networks/cubit/cubit.dart';
import 'package:restarant_app/shared/networks/cubit/mode_cubit/mode_cubit.dart';
import 'package:restarant_app/shared/networks/cubit/states.dart';

class RestarantLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cubit = RestaurantCubit.get(context);
    return BlocConsumer<RestaurantCubit, RestaurantStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Directionality(
              textDirection: TextDirection.rtl,
              child: Scaffold(
                appBar: AppBar(
                  iconTheme: IconThemeData(color: Colors.red[200]),
                  title: Text(
                    RestaurantCubit.get(context)
                        .titles[RestaurantCubit.get(context).currentIndex],
                    style: TextStyle(
                        color: ModeCubit.get(context).isDark
                            ? Colors.white70
                            : Colors.grey[900],
                        fontFamily: 'Cairo'),
                  ),
                ),
                bottomNavigationBar: BottomNavyBar(
                  curve: Curves.elasticInOut,
                  animationDuration: Duration(milliseconds: 300),
                  backgroundColor: ModeCubit.get(context).isDark
                      ? Colors.grey[900]
                      : Colors.white,
                  iconSize: 20,
                  showElevation: true,
                  selectedIndex: cubit.currentIndex,
                  onItemSelected: (value) {
                    cubit.changeBottomNav(value);
                  },
                  items: [
                    BottomNavyBarItem(
                        textAlign: TextAlign.center,
                        inactiveColor: Colors.grey,
                        icon: Icon(Icons.home),
                        title: Text('الرئيسية',
                            style: TextStyle(
                              fontFamily: 'Cairo',
                            )),
                        activeColor: Colors.red[300]!),
                    BottomNavyBarItem(
                        textAlign: TextAlign.center,
                        inactiveColor: Colors.grey,
                        icon: Icon(Icons.shopping_cart),
                        title: Text('اطلب الآن',
                            style: TextStyle(
                              fontFamily: 'Cairo',
                            )),
                        activeColor: Colors.red[200]!),
                    BottomNavyBarItem(
                        textAlign: TextAlign.center,
                        inactiveColor: Colors.grey,
                        icon: Icon(Icons.card_giftcard),
                        title: Text('العروض',
                            style: TextStyle(
                              fontFamily: 'Cairo',
                            )),
                        activeColor: Colors.red[200]!),
                    BottomNavyBarItem(
                        textAlign: TextAlign.center,
                        inactiveColor: Colors.grey,
                        icon: Icon(Icons.favorite),
                        title: Text('مفضلاتي',
                            style: TextStyle(
                              fontFamily: 'Cairo',
                            )),
                        activeColor: Colors.red[200]!),
                    BottomNavyBarItem(
                        textAlign: TextAlign.center,
                        inactiveColor: Colors.grey,
                        icon: Icon(Icons.account_box),
                        title: Text('حسابي',
                            style: TextStyle(
                              fontFamily: 'Cairo',
                            )),
                        activeColor: Colors.red[200]!),
                  ],
                ),
                body: cubit.screens[cubit.currentIndex],
              ));
        });
  }
}
