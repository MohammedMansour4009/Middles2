import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import 'TextLabel.dart';

InputDecoration DrowDownInputDecoration() {
  return InputDecoration(
    contentPadding: const EdgeInsets.symmetric(vertical: 16),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
    ),
  );
}


DropdownMenuItem<String> LableDropdownMenuItem(String day) {
  return DropdownMenuItem<String>(
    value: day,
    child: NormalText(day, fontSize: 14),
  );
}
DropdownStyleData StyleDropdownData() {
  return DropdownStyleData(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
    ),
    offset: Offset(0, -18),
  );
}
