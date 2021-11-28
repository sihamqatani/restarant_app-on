import 'package:flutter/material.dart';
import 'package:restarant_app/modules/Sign_up/widgets/custom_logo.dart';
import 'package:restarant_app/modules/Sign_up/widgets/custom_red_container.dart';
import 'package:restarant_app/modules/sign_in/widgets/custom_rich_text.dart';
import 'package:restarant_app/modules/sign_in/widgets/sign_in_section.dart';

class SignIn extends StatelessWidget {
  final loginKey = GlobalKey<ScaffoldState>();
  var emailController = TextEditingController();
  var paswwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        // key: loginKey,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Stack(
              children: [
                CustomRedContainer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 0, top: 20),
                      child: CustomLogo(
                          text: 'حسابي',
                          fontSize: 18,
                          fontColor: Colors.grey[900]!),
                    ),
                    SignInSection(),
                    CustomRichText(),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
