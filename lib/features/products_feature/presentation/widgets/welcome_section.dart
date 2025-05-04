import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:sadeem_task/core/cache/hive/hive_keyes.dart';
import 'package:sadeem_task/core/cache/hive/hive_manager.dart';
import 'package:sadeem_task/core/di/config.dart';
import 'package:sadeem_task/core/utils/app_color.dart';
import 'package:sadeem_task/core/utils/app_images.dart';
import 'package:sadeem_task/core/utils/app_style.dart';
import 'package:sadeem_task/features/auth/domain/entites/response/login_response_entity.dart';

class WelcomeSection extends StatelessWidget {
  const WelcomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    LoginResponseEntity? userData = getIt<HiveManager>().retrieveUserData(
      HiveKeys.userBox,
    );
    return FadeInUp(
      curve: Curves.linearToEaseOut,
      duration: const Duration(milliseconds: 900),
      delay: const Duration(seconds: 1),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Welcome ",
                      style: AppStyle.textRegular16(context),
                    ),
                    TextSpan(
                      text: userData?.name ?? " No Name",
                      style: AppStyle.textBold20(context),
                    ),
                  ],
                ),
              ),
              const Gap(8),
              Text('New Cairo , Egypt', style: AppStyle.textMedium16(context)),
            ],
          ),
          const Spacer(),
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColor.whiteColor,
            ),
            padding: const EdgeInsets.all(8),
            child: ClipOval(
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: userData?.image ?? "",
                width: 50,
                height: 50,
                errorWidget:
                    (context, url, error) => const Icon(Icons.error, size: 50),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
