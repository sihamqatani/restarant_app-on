import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:restarant_app/modules/Sign_up/restarant_signup_cubit/signup_cubit/cubit.dart';
import 'package:restarant_app/modules/Sign_up/restarant_signup_cubit/signup_cubit/states.dart';
import 'package:restarant_app/modules/Sign_up/widgets/custom_logo.dart';
import 'package:restarant_app/modules/Sign_up/widgets/custom_red_container.dart';
import 'package:restarant_app/modules/sign_in/sign_in.dart';
import 'package:restarant_app/shared/components/components.dart';
import 'package:restarant_app/shared/components/navigate_and_finish.dart';
import 'package:restarant_app/shared/shared_widgets/custom_text_form_feild.dart';

class SignUp extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  late var emailController = TextEditingController();
  late var passwordController = TextEditingController();
  late var nameController = TextEditingController();
  late var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, RestarantSignUpStates>(
        listener: (context, state) {
      if (state is RestarantSignUPSuccessState) {
        NavigateAndFinish().navigateAndFinish(context, SignIn());
        // navigateAndFinish(context, SignIn());
        showToast(state: ToastColorstate.SUCCESS, message: 'تم التسجيل بنجاح');
      }
    }, builder: (context, state) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
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
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    height: MediaQuery.of(context).size.height *
                                        0.9,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    // borderRadius: BorderRadius.only(
                                    //topLeft: Radius.circular(30), topRight: Radius.circular(30))),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "تسجيل",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20,
                                                      color: Colors.black54,
                                                      fontFamily: 'Cairo'),
                                                ),
                                              ]),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: CustomTextFormField(
                                            controller: nameController,
                                            type: TextInputType.name,
                                            isPassword: false,
                                            prefix: Icons.face,
                                            validate: (value) {
                                              if (value!.isEmpty) {
                                                return 'ادخل اسمك';
                                              }
                                            },
                                            label: 'ادخل بريدك',
                                          ),
                                        ),
                                        // ),
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: defaultFormField(
                                            controller: emailController,
                                            type: TextInputType.emailAddress,
                                            validate: (value) {
                                              if (value!.isEmpty)
                                                return 'ادخل بريدك';
                                            },
                                            label: 'ادخل بريدك',
                                            prefix: Icons.email,
                                          ),
                                        ),
                                        Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: defaultFormField(
                                                controller: passwordController,
                                                type: TextInputType
                                                    .visiblePassword,
                                                validate: (value) {
                                                  if (value!.isEmpty) {
                                                    return 'ادخل كلمة المرور';
                                                  }
                                                },
                                                label: 'ادخل كلمة المرور',
                                                prefix: Icons.lock)),
                                        Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: defaultFormField(
                                                controller: phoneController,
                                                type: TextInputType.phone,
                                                validate: (value) {
                                                  if (value!.isEmpty) {
                                                    return 'ادخل رقم الهاتف';
                                                  }
                                                },
                                                label: 'ادخل كلمة المرور',
                                                prefix: Icons.phone,
                                                onSubmit: (value) {
                                                  if (formKey.currentState!
                                                      .validate()) {
                                                    print('done');
                                                    SignUpCubit.get(
                                                            context)
                                                        .userSignUp(
                                                            email:
                                                                emailController
                                                                    .text,
                                                            password:
                                                                passwordController
                                                                    .text,
                                                            name: nameController
                                                                .text,
                                                            phone:
                                                                phoneController
                                                                    .text);
                                                  }
                                                })),
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Container(
                                            child: Conditional.single(
                                                context: context,
                                                conditionBuilder: (context) => state
                                                    is! RestarantSignUpLoadingState,
                                                widgetBuilder: (context) {
                                                  return MaterialButton(
                                                    height: 1.4 *
                                                        (MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            20),
                                                    minWidth: 5 *
                                                        (MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            10),
                                                    color: Colors.red[200],
                                                    child: Text(
                                                      'تسجيل',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 19,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          letterSpacing: 1,
                                                          fontFamily: 'Cairo'),
                                                    ),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20)),
                                                    onPressed: () {
                                                      if (formKey.currentState!
                                                          .validate()) {
                                                        SignUpCubit.get(context).userSignUp(
                                                            email:
                                                                emailController
                                                                    .text,
                                                            password:
                                                                passwordController
                                                                    .text,
                                                            name: nameController
                                                                .text,
                                                            phone:
                                                                phoneController
                                                                    .text);
                                                      }
                                                    },
                                                  );
                                                },
                                                fallbackBuilder: (context) =>
                                                    Center(
                                                      child: Container(
                                                          height: 100,
                                                          width: 100,
                                                          child:
                                                              loadingIndicator()),
                                                    )),
                                          ),
                                        ),
                                      ],
                                    )),
                              )
                            ]),
                        //drawButtom(),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
