
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:quickalert/models/quickalert_animtype.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:sadeem_task/core/utils/app_color.dart';
import 'package:sadeem_task/core/utils/app_string.dart';

class DialogUtils {
  static showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Center(
          child: LoadingAnimationWidget.fourRotatingDots(
            color: AppColor.authColor,
            size: 50,
          ),
        );
      },
    );
  }

  static showErrorDialog(BuildContext context, String errorMessage) {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      title: AppString.error,
      text: errorMessage,
      animType: QuickAlertAnimType.scale,
      confirmBtnColor: Colors.red,
      confirmBtnText: AppString.ok,
      onConfirmBtnTap: () {
        Navigator.pop(context);
      },
    );
  }

  static showSuccesLoading(BuildContext context, String successMessage) async{
  await  QuickAlert.show(
      context: context,
      type: QuickAlertType.success,
      text: successMessage,
      confirmBtnColor: AppColor.authColor,
      animType: QuickAlertAnimType.scale,
      autoCloseDuration: Duration(seconds: 2),
      showCancelBtn: false,
      showConfirmBtn: false,
      confirmBtnText: AppString.ok,
      onConfirmBtnTap: () {
        Navigator.pop(context);
      },
    );
  }
}
