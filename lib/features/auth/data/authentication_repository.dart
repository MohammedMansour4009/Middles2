// ignore_for_file: empty_catches, unused_catch_clause

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/models/usermodel.dart';
import '../../home/presentation/view/home_screen_view.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //variables
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
  }

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      // Save email to shared preferences
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('user_email', email);
      Get.snackbar(
        "Success",
        "User logged in successfully.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.black,
      );
      Get.offAll(() => const HomeScreenView());
      // Get.to(() => homeScreen());
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        "User was not found",
        "Try again",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.black,
      );
    } catch (e) {
      print(e);
    }
  }

  Future<void> logout() async => await _auth.signOut();

  Future<List<UserModel>> getAllUsers() async {
    try {
      // Fetch all documents from the 'users' collection
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection('Users').get();

      // Map the documents to a list of UserModel
      List<UserModel> users = snapshot.docs.map((doc) {
        var userData = doc.data() as Map<String, dynamic>;
        return UserModel.fromMap(userData, doc.id);
      }).toList();
      return users; // Return the list of users
    } catch (e) {
      print('Error fetching users: $e');
      return []; // Return an empty list on error
    }
  }
}
