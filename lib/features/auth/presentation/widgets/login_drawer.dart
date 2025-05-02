import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:sadeem_task/config/routes/routes.dart';
import 'package:sadeem_task/core/utils/app_color.dart';
import 'package:sadeem_task/core/utils/app_string.dart';
import 'package:sadeem_task/core/utils/component/custom_textfiled.dart';
import 'package:sadeem_task/core/utils/component/dialog/dilog_utils.dart';
import 'package:sadeem_task/features/auth/domain/entites/request/login_request_entity.dart';
import 'package:sadeem_task/features/auth/presentation/cubit/auth_action.dart';
import 'package:sadeem_task/features/auth/presentation/cubit/login_cubit.dart';

import '../../../../core/utils/app_style.dart';
import '../pages/login_screen.dart';
import 'coatume_button.dart';
import 'costume_avatar.dart';
import 'costume_text_filed.dart';

class LogInDrawer extends StatefulWidget {
  const LogInDrawer({super.key});

  @override
  State<LogInDrawer> createState() => _LogInDrawerState();
}

class _LogInDrawerState extends State<LogInDrawer> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late LoginCubit _loginCubit;
  @override
  void initState() {
    _loginCubit = context.read<LoginCubit>();
    super.initState();
  }

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
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 36, right: 36),
          child: Column(
            children: [
              AuthListenerWidget(),
              Text("Login", style: AppStyle.style34(context)),
              const Gap(20),
              CustomTextFieldOfEdit(
                controller: _emailController,
                title: "Email",
                readOnly: false,
              ),
              const Gap(20),
              CustomTextFieldOfEdit(
                controller: _passwordController,
                title: "Password",
                readOnly: false,
              ),
              const Gap(20),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  style: AppStyle.style18(context),
                  AppString.helpMessage,
                ),
              ),
              const Gap(20),
              CostumeButton(
                title: 'Login',
                onTap: () {
                  _loginCubit.doAction(
                    AuthActionLogin(
                      LoginRequestEntity(
                        email: _emailController.text,
                        password: _passwordController.text,
                      ),
                    ),
                  );
                },
              ),
              const Gap(32),
              Text(style: AppStyle.style18(context), "or Log in With"),
              const Gap(28),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(style: AppStyle.style18(context), "NewUser? "),
                  InkWell(
                    onTap: () {},
                    child: const Text(
                      "Create Account",
                      style: TextStyle(color: AppColor.authColor),
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

class AuthListenerWidget extends StatelessWidget {
  const AuthListenerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          DialogUtils.showLoadingDialog(context);
        } else if (state is LoginSuccessState) {
          context.pop();
          context.push(AppRoute.homeLayout);
        } else if (state is LoginFailureState) {
          context.pop();
          DialogUtils.showErrorDialog(
            context,
            state.errorMessage.message ?? "unknown error",
          );
        }
      },
      child: const SizedBox(),
    );
  }
}
