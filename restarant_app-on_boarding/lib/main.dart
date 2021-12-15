//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restarant_app/layouts/restarant_layout.dart';

import 'package:restarant_app/modules/Sign_up/restarant_signup_cubit/signup_cubit/cubit.dart';
//import 'package:restarant_app/layouts/restarant_layout.dart';

import 'package:restarant_app/modules/onBoarding/onBoarding_screen.dart';
import 'package:restarant_app/modules/sign_in/cubit/cubit.dart';
import 'package:restarant_app/modules/sign_in/sign_in.dart';
//import 'package:restarant_app/modules/sign_in/sign_in.dart';
import 'package:restarant_app/shared/networks/cubit/cubit.dart';
import 'package:restarant_app/shared/networks/cubit/mode_cubit/mode_cubit.dart';
import 'package:restarant_app/shared/networks/cubit/mode_cubit/mode_states.dart';
import 'package:restarant_app/shared/networks/local/cash_helper/cash_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:restarant_app/shared/theme/dark_theme.dart';
import 'package:restarant_app/shared/theme/light_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CashHelper.init();
  //print('the onBoard$onBoard');

  late Widget startWidget;
  if (CashHelper.getData(key: 'onBoarding') == null &&
      CashHelper.getData(key: 'uId') == null) {
    startWidget = OnBoardingScreen();
  } else if (CashHelper.getData(key: 'onBoarding') != null &&
      CashHelper.getData(key: 'uId') == null) {
    startWidget = SignIn();
  } else {
    startWidget = RestarantLayout();
  }
  late bool isDark;
  if (CashHelper.getData(key: 'isDark') != null) {
    isDark = CashHelper.getData(key: 'isDark');
  } else
    isDark = false;

  runApp(RestarantApp(
    startWidget: startWidget,
    isDark: isDark,
  ));
}

class RestarantApp extends StatelessWidget {
  Widget startWidget;
  //
  bool isDark;
  // bool? onBoard;
  RestarantApp({
    required this.startWidget,
    required this.isDark,
  });
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => RestaurantCubit()
              ..getCatogries()
              ..getMeals()
              ..getVisibleMeals()),
        BlocProvider<ModeCubit>(
            create: (context) =>
                ModeCubit()..changeAppMode(fromShared: isDark)),
        BlocProvider(
          create: (context) => SignUpCubit(),
        ),
        BlocProvider(
          create: (context) => SignInCubit(),
        ),
      ],
      child: BlocConsumer<ModeCubit, ModeStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: LightTheme().lightTheme,
                darkTheme: DarkTheme().darkTheme,
                themeMode: ModeCubit.get(context).isDark
                    ? ThemeMode.dark
                    : ThemeMode.light,
                home: startWidget);
          }),
    );
    //onBoard! ? SignIn() : OnBoardingScreen());
  }
}
