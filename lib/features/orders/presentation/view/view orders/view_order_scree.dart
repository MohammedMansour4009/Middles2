import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../../core/constant/color.dart';
import '../../../../../core/utils/images.dart';
import '../../view model/orders_controller.dart';
import 'edit_order_view.dart';

class ViewOrdersScreen extends StatelessWidget {
  const ViewOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersController(), permanent: true).getOrdersAndCustomers();
    return GetBuilder<OrdersController>(builder: (controller) {
      return Scaffold(
        body: RefreshIndicator(
          color: kPrimaryColor,
          onRefresh: () async {
            controller.getOrdersAndCustomers();
          },
          child: SafeArea(
            child: Column(
              children: [
                const Text(
                  'الطلبات الحالية',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: ListView.builder(
                    // shrinkWrap: true,
                    itemCount: controller.ordersList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Card(
                          elevation: 0,
                          color: kSecondaryColor,
                          child: ListTile(
                            onTap: () {
                              Get.to(EditOrderView(
                                currentOrder: controller.ordersList[index],
                              ));
                            },
                            leading:
                                ClipOval(child: Image.asset(Images.customer)),
                            title:
                                Text(controller.ordersList[index].customerName),
                            subtitle: Text(controller.ordersList[index].date),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
