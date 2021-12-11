
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:restarant_app/layouts/restarant_layout.dart';
import 'package:restarant_app/modules/sign_in/cubit/cubit.dart';
import 'package:restarant_app/modules/sign_in/cubit/states.dart';
import 'package:restarant_app/shared/components/components.dart';
import 'package:restarant_app/shared/navigator/navigate_to.dart';
import 'package:restarant_app/shared/networks/local/cash_helper/cash_helper.dart';
import 'package:restarant_app/shared/shared_widgets/custom_text_form_feild.dart';

import 'change_password.dart';

class SignInSection extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  late var emailController = TextEditingController();
  late var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, RestarantSignInStates>(
      listener: (context, state) {
        if (state is RestarantSignInSuccessState){
           CashHelper.saveData(key: 'uId', value: state.uId).then((value) 
           { navigateAndFinish(context, RestarantLayout());
            //showToast(message: 'تم نسجيل الدخول بنجاح', state:ToastColorstate.SUCCESS);
          });
         }else if(state is RestarantSignInErrorState) {
           print('failed Login');
           
         }
         

      },
      builder: (context, state) {
        return Form(
          key: formKey,
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.7,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  // borderRadius: BorderRadius.only(
                  //topLeft: Radius.circular(30), topRight: Radius.circular(30))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "تسجيل",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.black54,
                                    fontFamily: 'Cairo'),
                              ),
                            ]),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomTextFormField(
                              isPassword: false,
                              controller: emailController,
                              type: TextInputType.emailAddress,
                              label: ' الايميل او رقم الهاتف',
                              prefix: Icons.email)),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomTextFormField(
                          isPassword: false,
                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                          label: 'ادخل كلمة المرور',
                          prefix: Icons.lock,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: [
                            MaterialButton(
                              child: Text(
                                'نسيت كلمةالسر',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 18,
                                    fontFamily: 'Cairo'),
                              ),
                              onPressed: () {
                                NavigateTo()
                                    .navigateTo(context, ForgotPassword());
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Conditional.single(
                                context: context,
                                conditionBuilder: (context) =>
                                    state is! RestarantSignInLoadingState,
                                widgetBuilder: (context) {
                                  return Container(
                                    child: MaterialButton(
                                        color: Colors.red[200],
                                        child: Text(
                                          'دخول',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 19,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 1,
                                              fontFamily: 'Cairo'),
                                        ),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        onPressed: () {
                                          SignInCubit.get(context).userLogin(
                                              email: emailController.text,
                                              password:
                                                  passwordController.text);
                                          print('geted started');
                                        }),
                                    height: 1.4 *
                                        (MediaQuery.of(context).size.height /
                                            20),
                                    width: 5 *
                                        (MediaQuery.of(context).size.width /
                                            10),
                                  );
                                },
                                fallbackBuilder: (context) {
                                  return Center(
                                      child: Container(
                                          width: 50,
                                          height: 50,
                                          child: loadingIndicator()));
                                }),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '-OR-',
                              style:
                                  TextStyle(fontSize: 16, fontFamily: 'Cairo'),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    // margin: EdgeInsets.only(bottom: 19),
                                    child: CircleAvatar(
                                  radius: 100,
                                  // backgroundColor: Colors.lightBlueAccent,
                                  child: Icon(
                                    Icons.facebook,
                                    // FontAwesomeIcons.facebook,
                                    color: Colors.white,
                                  ),
                                ))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            )
          ]),
        );
      },
    );
  }
}
