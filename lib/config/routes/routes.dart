import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sadeem_task/features/home_layout/presentation/screens/home_layout_scren.dart';

class AppRoute {
  static const homeLayout = '/';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: homeLayout,
        builder: (context, state) {
          return HomeLayoutScreen();
        },
      ),
    ],
  );
}
