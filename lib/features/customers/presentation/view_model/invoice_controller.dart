import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InvoiceController extends GetxController {
  var cliqController = TextEditingController();
  var priceController = TextEditingController();

  var cliqText = ''.obs;
  var priceText = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadSavedCliq(); 

    priceController.addListener(() {
      priceText.value = priceController.text;
    });


    cliqController.addListener(() {
      cliqText.value = cliqController.text;
    });
  }

  @override
  void onClose() {
    priceController.dispose();
    cliqController.dispose();
    super.onClose();
  }

  Future<void> loadSavedCliq() async {
    final prefs = await SharedPreferences.getInstance();
    cliqText.value = prefs.getString('saved_cliq') ?? '';
    cliqController.text = cliqText.value;
  }

  Future<void> saveCliq() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('saved_cliq', cliqText.value);
  }
}
