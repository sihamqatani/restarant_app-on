import 'package:flutter/material.dart';
import 'package:restarant_app/shared/networks/cubit/mode_cubit/mode_cubit.dart';

class CustomBackgroundContainer extends StatelessWidget {
  void Function()? arrowBack;
  void Function()? cartShopping;

  CustomBackgroundContainer({this.arrowBack, this.cartShopping});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topRight,
      color: ModeCubit.get(context).isDark ? Colors.black : Colors.red[100],
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(top: 35, right: 5, left: 5),
        child: Row(
          children: [
            InkWell(
              onTap: arrowBack,
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.grey,
              ),
            ),
            Spacer(),
            InkWell(
              onTap: cartShopping,
              child: Icon(
                Icons.shopping_cart,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
