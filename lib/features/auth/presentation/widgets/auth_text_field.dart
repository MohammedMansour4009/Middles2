import 'package:flutter/material.dart';

import '../view model/signup_controller.dart';
Padding authTextField(SignUpController controller, bool isPassword) {
  return Padding(
    padding: const EdgeInsets.only(top: 20),
    child: TextFormField(
      controller: isPassword
          ? controller.passwordController
          : controller.emailController,
      decoration: InputDecoration(
        prefixIcon: Icon(isPassword ? Icons.password : Icons.phone),
        labelText: isPassword ? 'كلمة المرور' : 'الهاتف',
        hintText: isPassword ? 'كلمة المرور' : 'الهاتف',
        border: const OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          if (isPassword) {
            return 'الرجاء ادخال كلمة المرور';
          } else {
            return 'الرجاء ادخال رقم الهاتف ';
          }
        }
        return null;
      },
    ),
  );
}
