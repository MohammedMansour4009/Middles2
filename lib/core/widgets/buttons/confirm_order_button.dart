import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/color.dart';

class ConfirmOrderButton extends StatelessWidget {
  final bool isNewCustomer;
  const ConfirmOrderButton({super.key, required this.isNewCustomer});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: SizedBox(
        width: 150, // Set the desired width here
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: kPrimaryColor,
          ),
          onPressed: () {
            // Get.find<OrdersController>().createOrder();
          },
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'تأكيد الطلب',
                style: TextStyle(color: kSecondaryColor),
              ),
              Icon(
                Icons.image,
                color: kSecondaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
