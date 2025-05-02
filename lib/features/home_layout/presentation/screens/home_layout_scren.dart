import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:sadeem_task/features/home_layout/presentation/widgets/my_nav_bar.dart';

class HomeLayoutScreen extends StatelessWidget {
  const HomeLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeLayoutScren'),
      ),
      body: const Center(
        child: Text(
          'HomeLayoutScren is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
      bottomNavigationBar: const MyNavBar()
    );
  }
}