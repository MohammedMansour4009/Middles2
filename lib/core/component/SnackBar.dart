import 'package:flutter/material.dart';

import 'TextLabel.dart';


snackBar(String message, BuildContext context,bool isError) {
  SnackBar snackBar = SnackBar(
    content: NormalText(message),
    duration: const Duration(seconds: 4),
    backgroundColor: isError?Colors.red:Colors.green,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}