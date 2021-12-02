import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restarant_app/modules/sign_in/cubit/cubit.dart';
import 'package:restarant_app/modules/sign_in/cubit/states.dart';
import 'package:restarant_app/shared/navigator/navigate_and_finish.dart';
import 'package:restarant_app/shared/shared_widgets/custom_text_form_feild.dart';

import '../sign_in.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({Key? key}) : super(key: key);
  var emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, RestarantSignInStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
                appBar: AppBar(
                  title: Text('نسيت كلمة المرور'),
                ),
                body: Column(
                  children: [
                    CustomTextFormField(
                        controller: emailController,
                        type: TextInputType.emailAddress,
                        label: "ادخل بريدك",
                        isPassword: false,
                        prefix: Icons.email),
                    SizedBox(height: 10),
                    Container(
                      child: MaterialButton(
                          color: Colors.red[200],
                          child: Text(
                            'تغيير كلمة السر',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                                fontFamily: 'Cairo'),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          onPressed: () {
                            SignInCubit.get(context)
                                .changePassword(email: emailController.text);
                            print('suesss');
                            NavigateAndFinish()
                                .navigateAndFinish(context, SignIn());

                            print('suesss');
                          }),
                      height: 1.4 * (MediaQuery.of(context).size.height / 20),
                      width: 5 * (MediaQuery.of(context).size.width / 10),
                    )
                  ],
                )),
          );
        });
  }
}
