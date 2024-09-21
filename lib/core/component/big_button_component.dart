import 'package:flutter/material.dart';

import '../constant/color.dart';

SizedBox BigButtonComponent(void Function()? toDo, String title) {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
            kPrimaryColor), // Change the color here
      ),
      onPressed: toDo,
      child: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
    ),
  );
}
