// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../core/constant/color.dart';
import '../view model/signup_controller.dart';
import 'auth_text_field.dart';

class logInForm extends StatefulWidget {
  const logInForm({super.key});

  @override
  State<logInForm> createState() => _logInFormState();
}

class _logInFormState extends State<logInForm> {
  @override
  Widget build(BuildContext context) {

    return GetBuilder<SignUpController>(
      init: SignUpController()..getAllUsers(),
      builder: (controller) {
        return Form(
          key: controller.formKey,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                authTextField(controller, false),
                authTextField(controller, true),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(kPrimaryColor),
                        // You can customize other properties here such as padding, shape, etc.
                      ),
                      onPressed: () {
                        {
                          // Validation passed, attempt to sign in
                          print("TAG00 onPressed  loginUser ");
                          controller.loginUser();
                          // Get.to(CreateNewOrderScreen());
                        }
                      },
                      child: Text(
                        'login'.toUpperCase(),
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }
    );
  }
}
