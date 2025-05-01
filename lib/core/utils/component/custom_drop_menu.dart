import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sadeem_task/core/utils/app_color.dart';


class CustomDropMenu extends StatefulWidget {
   CustomDropMenu({
    super.key,
    required this.items,
    required this.selectedValue,
    required this.isAuth,
    required this.setValue,
  });

  @override
  State<CustomDropMenu> createState() => _CustomDropMenuState();
  String? selectedValue;
  final Map<String, String> items;

  final bool isAuth;
  final void Function(String value) setValue;
}

class _CustomDropMenuState extends State<CustomDropMenu> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        isExpanded: true,
        items: widget.items.entries.map(
          (item) {
            return DropdownMenuItem<String>(
              value: item.value,
              child: Text(item.key, style: const TextStyle(fontSize: 16)),
            );
          },
        ).toList(),
        value: widget.selectedValue,
        onChanged: (String? value) {
          widget.setValue(value ?? "Babies");

          setState(() {
            widget.selectedValue = value ?? "Factory";
          });
        },
        buttonStyleData: ButtonStyleData(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: const Border(
              bottom: const BorderSide(
                color: AppColor.authColor,
                strokeAlign: BorderSide.strokeAlignOutside,
              ),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: widget.isAuth ? 40 : null,
          width: widget.isAuth ? 140 : null,
        ),
        menuItemStyleData: const MenuItemStyleData(),
        iconStyleData: IconStyleData(),
      ),
    );
  }
}
