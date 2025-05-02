import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadeem_task/core/utils/app_images.dart';
import 'package:sadeem_task/features/home_layout/presentation/cubit/home_layout_cubit.dart';

class MyNavBar extends StatefulWidget {
  const MyNavBar({super.key});

  @override
  State<MyNavBar> createState() => _MyNavBarState();
}

class _MyNavBarState extends State<MyNavBar> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return FlashyTabBar(
  
      selectedIndex: _selectedIndex,
      showElevation: true,
      onItemSelected: (index) {
        setState(() {
          _selectedIndex = index;
        });
        context.read<HomeLayoutCubit>().changeScreen(index);
      },
      items: [
        FlashyTabBarItem(
          icon: Image.asset(Assets.productIcon, width: 24, height: 24),
          title: const Text('Products'),
        ),
        FlashyTabBarItem(
          icon: Image.asset(Assets.cartIcon, width: 24, height: 24),
          title: const Text('Cart'),
        ),
      ],
    );
  }
}
