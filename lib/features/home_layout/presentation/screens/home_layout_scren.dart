import 'package:flutter/material.dart';

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
    );
  }
}