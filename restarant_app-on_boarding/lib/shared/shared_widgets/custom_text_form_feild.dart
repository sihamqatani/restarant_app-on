import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  TextEditingController controller;
  TextInputType type;
  void Function(String)? onSubmit;
  void Function(String)? onChange;
  void Function()? onTap;
  bool? isPassword = false;
  String? Function(String?)? validate;
  String label;
  IconData prefix;
  IconData? suffix;
  void Function()? suffixPressed;
  bool? isClickable = true;
  void Function(String)? onPressed;
  CustomTextFormField({
    required this.controller,
    required this.type,
    this.onSubmit,
    this.onChange,
    this.onTap,
    this.isPassword,
    this.validate,
    required this.label,
    required this.prefix,
    this.suffix,
    this.suffixPressed,
    this.isClickable,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword!,
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
  }
}
