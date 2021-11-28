import 'package:flutter/material.dart';
import 'package:restarant_app/layouts/restarant_layout.dart';
import 'package:restarant_app/modules/Sign_up/sign_up.dart';
import 'package:restarant_app/shared/navigator/navigate_to.dart';

class CustomRichText extends StatelessWidget {
  
  const CustomRichText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MaterialButton(
            onPressed: () {},
            child: InkWell(
              onTap: () {
                NavigateTo().navigateTo(context, SignUp());
              },
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: 'لاتمتلك حساب',
                      style:
                          TextStyle(color: Colors.black, fontFamily: 'Cairo')),
                  TextSpan(
                      text: 'انشئ حسابك',
                      style: TextStyle(
                          color: Colors.red[200], fontFamily: 'Cairo')),
                ]),
              ),
            )),
        MaterialButton(
          onPressed: () {
            NavigateTo().navigateTo(context, RestarantLayout());
          },
          child: Text('تخطي',
              style: TextStyle(color: Colors.red[200], fontFamily: 'Cairo')),
        ),
      ],
    );
  }
}
