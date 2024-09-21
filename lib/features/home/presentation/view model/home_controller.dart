import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../customers/presentation/view/view_customers.dart';
import '../../../orders/presentation/view/view orders/view_order_scree.dart';

class HomeController extends GetxController {
  final List<Widget> pages = [
    const ViewOrdersScreen(),
    const ViewEmployees(),
  ];
  int currentPage = 0;

  changePage(index) {
    currentPage = index;
    update();
  }
}
