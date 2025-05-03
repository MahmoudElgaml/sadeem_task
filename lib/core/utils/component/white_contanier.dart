import 'package:flutter/material.dart';

class WhiteContanier extends StatelessWidget {
  const WhiteContanier({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(0),
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Colors.white,
        ),
        child: child,
      ),
    );
  }
}
