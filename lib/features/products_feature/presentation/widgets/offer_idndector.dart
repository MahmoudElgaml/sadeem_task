import 'package:flutter/material.dart';

class OfferImageIndicator extends StatelessWidget {
  const OfferImageIndicator({super.key,required this.selectedIndex,required this.numberIndicator});
final int selectedIndex;
final int numberIndicator;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        numberIndicator,
            (index) =>  DotIndicator(isSelected: index==selectedIndex),
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({super.key, required this.isSelected});

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3.0),
      child: Container(
        width: 10,
        height: 10,
        decoration: ShapeDecoration(
          color: isSelected ? const Color(0xFF004182) : Colors.grey,
          shape: const OvalBorder(),
        ),
      ),
    );
  }
}