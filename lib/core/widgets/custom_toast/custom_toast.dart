import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showCustomToaster(String message, {bool isError = false}) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: isError ? Colors.red : Colors.green,
      textColor: Colors.white,
      fontSize: 14.0);
}
