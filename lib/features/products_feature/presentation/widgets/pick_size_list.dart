import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_style.dart';

class PickSizeList extends StatelessWidget {
  const PickSizeList({super.key});

  static const List<String> items = [
    "30",
    "40",
    '50',
    '60',
    "65",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Size",
          style: AppStyle.style18(context),
        ),
        SizedBox(
          height: 40,
          child: ListView.separated(
            separatorBuilder: (context, index) => const Gap(8),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => SizeItem(
              isSelected: true,
              size: items[index],
            ),
            itemCount: 5,
          ),
        ),
      ],
    );
  }
}

class SizeItem extends StatelessWidget {
  const SizeItem({super.key, required this.isSelected, required this.size});

  final String size;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(9),
      decoration: BoxDecoration(
          color: isSelected ? AppColor.primaryColor : Colors.transparent,
          shape: BoxShape.circle),
      child: Center(
        child: Text(
          size,
          style: AppStyle.textRegular14(context).copyWith(
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
