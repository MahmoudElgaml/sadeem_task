import 'package:flutter/material.dart';
import 'package:sadeem_task/core/utils/app_images.dart';

class ErrorComponent extends StatelessWidget {
  const ErrorComponent({super.key, required this.message});
  final String message;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image.asset(Assets.warning, height: 300),
          ),
      
          Text(
            message,
            style: const TextStyle(fontSize: 18, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
