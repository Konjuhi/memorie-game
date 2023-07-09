import 'package:flutter/material.dart';

import 'custom_drop_down_menu_item.dart';

class CustomDropdownButton extends StatelessWidget {
  final int value;
  final ValueChanged<int?>? onChanged;

  const CustomDropdownButton({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<int>(
      value: value,
      onChanged: onChanged,
      items: [
        CustomDropdownMenuItem(value: 4, text: '4 Cards'),
        CustomDropdownMenuItem(value: 8, text: '8 Cards'),
        CustomDropdownMenuItem(value: 12, text: '12 Cards'),
        CustomDropdownMenuItem(value: 16, text: '16 Cards'),
        CustomDropdownMenuItem(value: 20, text: '20 Cards'),
        CustomDropdownMenuItem(value: 24, text: '24 Cards'),
      ],
    );
  }
}
