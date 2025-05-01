import 'package:flutter/material.dart';

import 'package:sadeem_task/core/utils/app_color.dart';
import 'package:sadeem_task/core/utils/app_style.dart';

class CustomTextFieldOfEdit extends StatelessWidget {
  const CustomTextFieldOfEdit({
    super.key,
    FocusNode? focusNode,
    required this.title,
    required this.controller,
    required this.readOnly,
    this.validator,
    this.onTap,
    this.appearColor = false,
    this.isPadding = true,
    this.suffixIcon,
    this.prefixIcon,
    this.textInputType,
  }) : _focusNode = focusNode;

  final FocusNode? _focusNode;
  final String title;
  final TextEditingController controller;
  final bool readOnly;
  final bool appearColor;
  final String? Function(String?)? validator;
  final void Function()? onTap;
  final bool isPadding;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: isPadding ? 12.0 : 0),
      child: TextFormField(
        keyboardType: textInputType,
        onTap: onTap,
        controller: controller,
        focusNode: _focusNode,
        style: AppStyle.textRegular16(context).copyWith(
          fontSize: 16,
          color: appearColor ? AppColor.borederColor : AppColor.blackColor,
          fontWeight: FontWeight.w500,
        ),
        cursorColor: AppColor.primaryColor,
        validator: validator,
        readOnly: readOnly,
        decoration: InputDecoration(
          prefixIcon:
              prefixIcon != null
                  ? Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: prefixIcon,
                  )
                  : null,
          suffixIcon: suffixIcon,
          label: Text(title),
          enabled: true,
          labelStyle: AppStyle.textSemiBold16(
            context,
          ).copyWith(color: AppColor.borederColor),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColor.borederColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColor.borederColor,
              width: 20,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColor.borederColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
