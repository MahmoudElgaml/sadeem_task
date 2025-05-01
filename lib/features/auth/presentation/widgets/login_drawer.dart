

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:sadeem_task/core/utils/app_color.dart';
import 'package:sadeem_task/core/utils/app_string.dart';

import '../../../../core/utils/app_style.dart';
import '../pages/login_screen.dart';
import 'coatume_button.dart';
import 'costume_avatar.dart';
import 'costume_text_filed.dart';

class LogInDrawer extends StatelessWidget {
  const LogInDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      margin: const EdgeInsets.only(top: 281),
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      child:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 36, right: 36),
          child: Column(
            children: [
              Text(
                "Login",
                style: AppStyle.style34(context),
              ),
              const Gap(32),
              const CostumeTextFiled(title: "Email"),
              const Gap(32),
              const CostumeTextFiled(title: "password"),
              const Gap(20),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  style: AppStyle.style24(context),
                  AppString.helpMessage,
                ),
              ),
              const Gap(20),
              const CostumeButton(
                title: 'Login',
              ),
              const Gap(32),
              Text(
                style: AppStyle.style18(context),
                "or Log in With",
              ),
              const Gap(28),
            
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    style: AppStyle.style18(context),
                    "NewUser? ",
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Text(
                      "Create Account",
                      style:  TextStyle(color: AppColor.authColor),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
