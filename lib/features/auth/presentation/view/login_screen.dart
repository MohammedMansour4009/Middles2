// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../../../../core/utils/images.dart';
import '../widgets/login_form_widget.dart';
class logIn extends StatelessWidget {
  const logIn({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage(Images.kLogo),
                  height: size.height * 0.4,
                ),
                logInForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
