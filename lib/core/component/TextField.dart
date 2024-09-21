import 'package:flutter/material.dart';

import '../constant/color.dart';

TextInputField(Icon exm,
    {required TextEditingController controller,
    required String labelText,
    bool isPassword = false,
    bool isEmail = false,
    FocusNode? focusNode,
    TextInputAction? textInputAction}) {
  return Container(
    margin: const EdgeInsets.only(right: 20, left: 20),
    child: TextFormField(
      focusNode: focusNode,
      controller: controller,
      textInputAction: textInputAction,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter $labelText';
        }
        if (isEmail && double.tryParse(value) == null) {
          return 'Please enter a valid number';
        }
        return null;
      },
      obscureText: isPassword,
      keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: kPrimaryColor, width: 2.0),
        ),
        hintText: labelText, // Your hint text
        filled: true,
        fillColor: Colors.white, // White background color
      ),
    ),
  );
}
