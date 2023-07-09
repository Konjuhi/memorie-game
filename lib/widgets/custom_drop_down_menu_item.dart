import 'package:flutter/material.dart';

class CustomDropdownMenuItem extends DropdownMenuItem<int> {
  CustomDropdownMenuItem({
    super.key,
    required int value,
    required String text,
  }) : super(
          value: value,
          child: Text(text),
        );
}
