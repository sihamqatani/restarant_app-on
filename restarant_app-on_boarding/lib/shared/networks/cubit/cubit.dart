import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:restarant_app/models/cart_model/cart_model.dart';
import 'package:restarant_app/models/catoregy/cateogries.dart';
import 'package:restarant_app/models/catoregy/catogrey_model.dart';
import 'package:restarant_app/models/food_details_model.dart/meals_model.dart';
import 'package:restarant_app/models/restarant_user_model/user_model.dart';
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
  MealsModel? mealsModel2;
  Cateogries? cateogries;
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

  //in this method will get Cateogry of meals.....
  List<Cateogries> catogry = [];
  List<String> cateogryId = [];
  void getCatogries() {
    emit(RestarantGetcatogriesLoadingState());
    FirebaseFirestore.instance.collection('categories').get().then((value) {
      value.docs.forEach((element) {
        catogry.add(Cateogries.fromJson(element.data()));
        cateogryId.add(element.id);
        print(element.id.toString());
      });
      emit(RestarantGetcatogriesSucessState());
      print('the no of list of cateogries:${catogry.length}');
    }).catchError((onError) {
      emit(RestarantGetcatogriesErrorState(error: onError.toString()));
      print('error for gateogry${onError.toString()}');
      // print('the no of list of cateogries:${catogry.length}');
    });
  }

  //in this method will get meals.....
  List<MealsModel> mealsModel = [];
  void getMeals() {
    emit(RestarantMealsLoadingState());
    FirebaseFirestore.instance.collection('meals').get().then((value) {
      value.docs.forEach((element) {
        if (element.get('isPopular') == true) {
          mealsModel.add(MealsModel.fromJson(element.data()));
        }
      });
      emit(RestarantMealsSucessState());
    }).catchError((error) {
      print(error.toString());
      emit(RestarantMealsErrorState(error: error));
    });
  }

  List<MealsModel> visibleMeals = [];
  void getVisibleMeals() {
    emit(RestarantVisibleMealsLoadingState());
    FirebaseFirestore.instance.collection('meals').get().then((value) {
      value.docs.forEach((element) {
        if (element.get('isVisible') == true) {
          visibleMeals.add(MealsModel.fromJson(element.data()));
        }
      });
      emit(RestarantVisibleMealsSucessState());
    }).catchError((error) {
      print(error.toString());
      emit(RestarantVisibleMealsErrorState(error: error));
    });
  }

  List<MealsModel> menus = [];

  void getMenus(String cateogryId) {
    emit(RestarantMenuMealsLoadingState());
    FirebaseFirestore.instance
        .collection('categories')
        .doc(cateogryId)
        .collection('dishes')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        menus.add(MealsModel.fromJson(element.data()));
        print(element.data().toString());
      });
      emit(RestarantmenuMealsSucessState());
    }).catchError((onError) {
      emit(RestarantMenuMealsErrorState(error: onError.toString()));
      print('menu errror::${onError.toString()}');
    });
  }
 RestarantUserModel?restarantUserModel;
  void createcartItem(
      {required String name,
      required String image,
      required dynamic price,
      required dynamic counter}) {
        CartModel.toMap
        FirebaseFirestore.instance.collection('Users').doc(restarantUserModel!.uId).collection('cart').doc().set()
      }
}
