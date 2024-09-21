// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../core/constant/color.dart';
import '../../../orders/presentation/view model/orders_controller.dart';
import '../../../orders/presentation/view/create_order/create_order_screen.dart';
import '../view model/home_controller.dart';

class HomeBottomNavigationBar extends StatelessWidget {
  const HomeBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Container(
        margin: EdgeInsets.only(right: 50, left: 50),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: kSecondaryColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildNavItem(Icons.attach_money_outlined, 'طلباتي', 0, context),
            SizedBox(
              width: 45.0, // Specify the width
              height: 45.0,
              child: FloatingActionButton(
                elevation: 0,
                shape: CircleBorder(),
                onPressed: () {
                  Get.find<OrdersController>().clearOrder();
                  Get.to(CreateNewOrderScreen());
                },
                backgroundColor: kPrimaryColor,
                foregroundColor: kOnSecondaryColor,
                child: const Icon(Icons.add, color: Colors.white),
              ),
            ),
            _buildNavItem(Icons.people, 'العملاء', 1, context),
          ],
        ),
      );
    });
  }

  Widget _buildNavItem(
      IconData iconName, String label, int index, BuildContext context) {
    return GestureDetector(
      onTap: () => Get.find<HomeController>().changePage(index),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              iconName,
              color: Get.find<HomeController>().currentPage == index
                  ? kPrimaryColor
                  : Colors.black,
              size: 22,
            ),
            SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                  color: Get.find<HomeController>().currentPage == index
                      ? kPrimaryColor
                      : Colors.black,
                  fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
