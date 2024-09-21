// text_styles.dart

import 'package:flutter/material.dart';

import 'color.dart';

class GlobalTextStyles {
  static const TextStyle regularTextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle labelTextStyle = TextStyle(
    color: kPrimaryColor,
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle viewCustomerTextStyle = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle viewCustomerDetailsTextStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle orderRegularTextStyle = TextStyle(
    color: Colors.black,
    fontSize: 17,
  );
  static const TextStyle orderLabelTextStyle = TextStyle(
    color: kPrimaryColor,
    fontSize: 17,
  );
}
