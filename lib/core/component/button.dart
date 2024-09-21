import 'package:flutter/material.dart';

import '../constant/color.dart';
import 'TextLabel.dart';

Container elevatedButton({required String text, VoidCallback? onPressed}) {
  return Container(
    margin: const EdgeInsets.only(left: 60, right: 60),
    height: 40,
    width: double.maxFinite,
    child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: kPrimaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular((8)))),
        child: Text(
          text,
          style: const TextStyle(
              color: Colors.white, fontSize: 16, fontFamily: "Cairo"),
        )),
  );
}

void emptyFunction(BuildContext context) {}
