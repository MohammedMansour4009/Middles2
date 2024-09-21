// cheque_button.dart
import 'package:flutter/material.dart';

import '../../../../../core/constant/color.dart';
import '../dialogs/cheque_dialog.dart';
class ChequeButton extends StatelessWidget {
  final double totalPrice; // Add a double property for total price

  const ChequeButton({super.key, required this.totalPrice}); // Update constructor to accept total price

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return ChequeDialog(totalPrice: totalPrice); // Pass the total price to the dialog
                },
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: kPrimaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
            ),
            child: const Text(
              'ارسال فاتورة',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
