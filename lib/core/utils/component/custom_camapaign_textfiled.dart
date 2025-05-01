
import 'package:flutter/material.dart';
import 'package:sadeem_task/core/utils/app_color.dart';


import '../app_style.dart';
import '../helper.dart';

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled({
    super.key,
    this.icon,
    required this.hint,
    required this.maxLine,
    required this.labelText,
    this.textEditingController,
    this.textInputType,
    this.validator,
  });

  final String hint;
  final String labelText;
  final Icon? icon;
  final int maxLine;
  final TextEditingController? textEditingController;
  final TextInputType? textInputType;
  final String? Function(String? value)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: textInputType,
      controller: textEditingController,
      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          border: Helper.buildOutlineInputBorder(),
          enabledBorder: Helper.buildOutlineInputBorder(),
          disabledBorder: Helper.buildOutlineInputBorder(),
          hintText: hint,
          hintStyle: TextStyle(color: AppColor.authColor.withOpacity(.3)),
          prefixIcon: icon),
    );
  }
}
