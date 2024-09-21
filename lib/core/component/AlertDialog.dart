import 'package:flutter/material.dart';

import 'TextLabel.dart';

void alertDialog(BuildContext context, String title, String content,
    {String positiveText = 'Ok', VoidCallback? onClickPositive}) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: NormalText(title),
          content:  NormalText(content),
          actions: <Widget>[
            FilledButton(
              child: NormalText('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                onClickPositive!();
              },
            ),
          ],
        );
      });
}