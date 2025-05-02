import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadeem_task/features/home_layout/presentation/cubit/home_layout_cubit.dart';
import 'package:sadeem_task/features/home_layout/presentation/widgets/my_nav_bar.dart';

class HomeLayoutScreen extends StatelessWidget {
  const HomeLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HomeLayoutScren')),
      body: BlocBuilder<HomeLayoutCubit, HomeLayoutState>(
        builder: (context, state) {
          return state.getWidget();
        },
      ),
      bottomNavigationBar: const MyNavBar(),
    );
  }
}
