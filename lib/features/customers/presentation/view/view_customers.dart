import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../core/constant/color.dart';
import '../../../../core/models/customer_model.dart';
import '../../../../core/utils/images.dart';
import '../../../orders/presentation/view model/orders_controller.dart';
import '../widgets/view_customer_details.dart';

class ViewEmployees extends StatelessWidget {
  const ViewEmployees({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrdersController>(
        init: Get.find<OrdersController>(),
        builder: (controller) {
          return Scaffold(
            body: RefreshIndicator(
              color: kPrimaryColor,
              onRefresh: () async {
                controller.getOrdersAndCustomers();
              },
              child: SafeArea(
                  child: Column(
                children: [
                  const Center(
                    child: Text(
                      'العملاء',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: controller.allCustomers.length,
                      itemBuilder: (context, index) {
                        CustomerModel currentCustomer =
                            controller.allCustomers[index];
                        return GestureDetector(
                          onTap: () {
                            Get.to(ViewCustomerDetails(
                              currentCustomer: currentCustomer,
                            ));
                          },
                          child: Card(
                            elevation: 0,
                            color: kSecondaryColor,
                            child: ListTile(
                              leading: Image.asset(
                                Images.customer,
                                width: 50,
                              ),
                              title: Text(currentCustomer.name),
                              trailing: Text(currentCustomer.phoneNumber),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              )),
            ),
          );
        });
  }
}
