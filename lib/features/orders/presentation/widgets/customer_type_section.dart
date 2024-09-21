import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/color.dart';
import '../view model/orders_controller.dart';

class CustomerTypeSection extends StatelessWidget {
  const CustomerTypeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrdersController>(
      init: OrdersController(),
      builder: (controller) {
        return Container(
          width: 220,
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: controller.customerType.value == 'new'
                  ? Colors.grey
                  : controller.customerType.value == 'old'
                      ? Colors.grey
                      : Colors.grey,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    controller.setCustomerType('new'); // New customer selected
                  },
                  child: Container(
                    width: 90,
                    height: 40,
                    decoration: BoxDecoration(
                      color: controller.customerType.value == 'new'
                          ? kPrimaryColor
                          : Colors.white12,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text(
                        'عميل جديد',
                        style: TextStyle(
                          color: controller.customerType.value == 'new'
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    controller.setCustomerType('old'); // Old customer selected
                  },
                  child: Container(
                    width: 90,
                    height: 40,
                    decoration: BoxDecoration(
                      color: controller.customerType.value == 'old'
                          ? kPrimaryColor
                          : Colors.white12,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text(
                        'عميل قديم',
                        style: TextStyle(
                          color: controller.customerType.value == 'old'
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
