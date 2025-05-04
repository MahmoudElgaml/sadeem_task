import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sadeem_task/config/routes/routes.dart';
import 'package:sadeem_task/core/cache/storage_token.dart';
import 'package:sadeem_task/core/di/config.dart';
import 'package:sadeem_task/core/utils/app_images.dart';
import 'package:sadeem_task/core/utils/app_string.dart';
import 'package:sadeem_task/core/utils/app_style.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({Key? key}) : super(key: key);

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  @override
  void initState() {
    super.initState();
    // goToHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Image.asset(Assets.splashLogo),
          ),
           Text(
            AppString.splashText,
            textAlign: TextAlign.center,
            style: AppStyle.style24(context),
          ),
        ],
      ),
    );
  }

  void goToHome() {
    Future.delayed(const Duration(seconds: 3), () async {
      var userToken = await getIt<StorageToken>().getAccessToken();
      if (userToken == null) {
        context.go(AppRoute.login);
        return;
      }
      context.go(AppRoute.homeLayout);
    });
  }
}
