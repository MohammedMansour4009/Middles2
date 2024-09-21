import 'package:flutter/material.dart';

Padding customTextField(TextEditingController controller, String hint,
    String validatorText, bool isNumber, IconData icon,
    {bool isInsideRow = false,bool isNoIcon = false}) {
  return Padding(
    padding:
        EdgeInsets.symmetric(horizontal: isInsideRow ? 0 : 16, vertical: 8),
    child: TextFormField(
      controller: controller,
      keyboardType: isNumber ? TextInputType.number : null,
      decoration: InputDecoration(
        prefixIcon:isNoIcon? null:Icon(icon),
        labelText: hint,
        hintText: hint,
        border: const OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validatorText;
        }
        // You can add additional password validation rules here
        return null;
      },
    ),
  );
}
