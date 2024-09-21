import 'package:flutter/material.dart';

import '../constant/color.dart';
import 'TextLabel.dart';

AppBar appBar(String text) => AppBar(
  title: NormalText(text),
  backgroundColor: kBackgroundColor,
  elevation: 0,
  titleTextStyle: const TextStyle(
    color: kSecondaryColor,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  ),
  iconTheme: const IconThemeData(
    color: kSecondaryColor,
  ),
);
