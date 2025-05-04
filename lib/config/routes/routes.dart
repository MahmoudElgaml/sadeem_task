import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sadeem_task/core/di/config.dart';
import 'package:sadeem_task/features/auth/presentation/cubit/login_cubit.dart';
import 'package:sadeem_task/features/auth/presentation/pages/login_screen.dart';
import 'package:sadeem_task/features/home_layout/presentation/cubit/home_layout_cubit.dart';
import 'package:sadeem_task/features/home_layout/presentation/screens/home_layout_scren.dart';
import 'package:sadeem_task/features/products_feature/presentation/pages/product_detail_screen.dart';

class AppRoute {
  static const homeLayout = '/';
  static const login = '/login';
  static const productDetail = '/productDetail';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: homeLayout,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => getIt<HomeLayoutCubit>(),
            child: const HomeLayoutScreen(),
          );
        },
      ),
      GoRoute(
        path: login,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          );
        },
      ),
       GoRoute(
        path: productDetail,
        builder: (context, state) {
          return  const ProductDetailScreen();
        },
      ),
    ],
  );
}
