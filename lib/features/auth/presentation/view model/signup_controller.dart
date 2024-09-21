import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/models/usermodel.dart';
import '../../../home/presentation/view/home_screen_view.dart';
import '../../data/authentication_repository.dart';

class SignUpController extends GetxController {
  static SignUpController get Instance => Get.find();
  final AuthenticationRepository _authRepo =
      Get.find<AuthenticationRepository>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController =
      TextEditingController(text: '0778942157');

  final TextEditingController passwordController =
      TextEditingController(text: '002303');
  List<UserModel> allUsers = [];

  getAllUsers() async {
    allUsers = await _authRepo.getAllUsers();
    print('safdgf${allUsers.length}');

    update();
  }

  loginUser() async {
    for (UserModel user in allUsers) {
      if (user.phoneNumber == emailController.text &&
          user.password == passwordController.text) {
        saveUserToSharedPreferences(user);
        Get.offAll(const HomeScreenView());
      }
    }
  }

  Future<void> saveUserToSharedPreferences(UserModel user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userJson = jsonEncode(user.toMap()); // Convert UserModel to JSON
    await prefs.setString('currentUser', userJson); // Save to SharedPreferences
  }

  Future<void> signOut() async {
    try {
      await _authRepo.logout();
      // Navigate to the login or home screen after successful logout
      // For example:
      // Navigator.pushReplacementNamed(context, '/login');
    } catch (e) {
      print("Error during sign out: $e");
    }
  }

  Future<void> signIn() async {
    if (formKey.currentState?.validate() == true) {
      try {
        await _authRepo.loginWithEmailAndPassword(
            emailController.text, passwordController.text);
      } catch (e) {
        print("Error during login: $e");
        // Handle login error, show a message, etc.
      }
    }
  }
}
