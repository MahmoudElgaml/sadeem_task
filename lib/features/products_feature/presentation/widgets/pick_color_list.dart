import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/utils/app_style.dart';
import '../pages/product_detail_screen.dart';

class PickColorList extends StatelessWidget {
  const PickColorList({super.key});
  static const List<Color> items = [
    Colors.red,
    Colors.green,
    Colors.yellow,
    Colors.black,
    Colors.grey,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Color",
          style: AppStyle.style18(context),
        ),
        SizedBox(
          height: 40,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) =>
                ColorItem(itemColor: items[index]),
            separatorBuilder: (context, index) => const Gap(8),
            itemCount: items.length,
          ),
        ),
      ],
    );
  }
}
class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.itemColor});

  final Color itemColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 35,
      decoration: BoxDecoration(shape: BoxShape.circle, color: itemColor),
    );
  }
}
