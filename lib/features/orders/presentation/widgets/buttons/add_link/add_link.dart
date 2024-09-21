import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/constant/color.dart';
import '../../../view model/orders_controller.dart';

class AddLink extends StatelessWidget {
  const AddLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SizedBox(
        width: 150,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            backgroundColor: kPrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            shadowColor: Colors.white,
            elevation: 2,
          ),
          onPressed: () {
            Get.find<OrdersController>().getCartInfo();
          },
          child: const Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  'ايجاد الطلب',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Icon(
                Icons.search,
                color: kSecondaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
