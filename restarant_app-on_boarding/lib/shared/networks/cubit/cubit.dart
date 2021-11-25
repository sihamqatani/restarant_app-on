import 'package:bloc/bloc.dart';
import 'package:restarant_app/modules/cart_screen/cart_screen.dart';
import 'package:restarant_app/modules/favorites_screen/favorites_screen.dart';
import 'package:restarant_app/modules/home_screen/home_screen.dart';
import 'package:restarant_app/modules/offers_screen/offers_screen.dart';
import 'package:restarant_app/modules/setting_screen/setting/setting_screen.dart';
import 'package:restarant_app/shared/networks/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RestaurantCubit extends Cubit<RestaurantStates> {
  RestaurantCubit() : super(RestaurantInitialState());
  static RestaurantCubit get(context) => BlocProvider.of(context);
  var pageViewController = PageController();
  List<Widget> screens = [
    HomeScreen(),
    CartScreen(),
    OffersScreen(),
    FavoritesScreen(),
    SettingScreen()
  ];
  List<String> titles = ['الرئيسية', 'طلباتي', 'العروض', 'مفضلاتي', 'حسابي'];
  int currentIndex = 0;
  void changeBottomNav(int index) {
    currentIndex = index;
    //emit(RestaurantBottomNavState());
    // pageViewController.animateToPage(currentIndex,
    // duration: Duration(milliseconds: 300), curve: Curves.linearToEaseOut);

    emit(RestaurantBottomNavState());
  }
}
