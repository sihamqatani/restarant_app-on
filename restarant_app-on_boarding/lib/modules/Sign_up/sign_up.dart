import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:restarant_app/modules/Sign_up/widgets/custom_logo.dart';
import 'package:restarant_app/modules/Sign_up/widgets/custom_red_container.dart';
import 'package:restarant_app/modules/Sign_up/widgets/sign_up_section.dart';

class SignUp extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  late var emailController = TextEditingController();
  late var passwordController = TextEditingController();
  late var nameController = TextEditingController();
  late var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                CustomRedContainer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomLogo(
                        text: 'حسابي',
                        fontSize: 18,
                        fontColor: Colors.grey[900]!),
                    SignUpSection(),
                    //drawButtom(),
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
