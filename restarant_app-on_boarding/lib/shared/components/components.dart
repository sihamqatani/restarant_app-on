import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

//import 'package:shop01_app/modules/login_screen/shop_login_screen.dart';
//import 'package:shop01_app/shared/network/local/cash_helper.dart';

void navigateTo(context, widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return widget;
  }));
}

void navigateAndFinish(context, widget) {
  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
    return widget;
  }), (Route<dynamic> route) => false);
}

Widget loadingIndicator() {
  return LoadingIndicator(
    indicatorType: Indicator.ballPulse,

    /// Required, The loading type of the widget
    colors: [Colors.pink[200]!, Colors.red[100]!, Colors.red[400]!],

    /// Optional, The color collections
    strokeWidth: 1,

    /// Optional, The stroke of the line, only applicable to widget which contains line
    // backgroundColor: Colors.black,      /// Optional, Background of the widget
    //pathBackgroundColor: Colors.black   /// Optional, the stroke backgroundColor
  );
}

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  double radius = 3.0,
  required void Function() function,
  required String text,
}) =>
    Container(
      width: width,
      height: 50.0,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: background,
      ),
    );

Widget defaultFormField(
        {required TextEditingController controller,
        required TextInputType type,
        void Function(String)? onSubmit,
        void Function(String)? onChange,
        void Function()? onTap,
        bool isPassword = false,
        required String? Function(String?)? validate,
        required String label,
        required IconData prefix,
        IconData? suffix,
        void Function()? suffixPressed,
        bool isClickable = true,
        void Function(String)? onPressed}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(prefix, color: Colors.red[50]!),

        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(
                  suffix,
                ),
              )
            : null,
        // border: OutlineInputBorder(),
      ),
    );
/*void signOut(context) {
  CashHelper.removeData(
    key: 'token',
  ).then((value) {
    if (value) {
      navigateAndFinish(
        context,
        ShopLoginScreen(),
      );
    }
  });
}*/