import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/color.dart';
import '../../../../core/constant/text_styles.dart';
import '../../../../core/models/customer_model.dart';
import '../../../../core/models/order_model.dart';
import '../../../../core/widgets/back_buttons/primary_back_button.dart';
import '../../../../core/widgets/dialogs/edit_user_info_dialog.dart';
import '../../../orders/presentation/view model/orders_controller.dart';
import '../../../orders/presentation/view/view orders/edit_order_view.dart';
import '../view_model/customer_controller.dart';
import 'buttons/cheque_button.dart';

class ViewCustomerDetails extends StatelessWidget {
  final CustomerModel currentCustomer;

  const ViewCustomerDetails({super.key, required this.currentCustomer});

  @override
  Widget build(BuildContext context) {
    // Initialize the CustomerController
    final CustomerController customerController = Get.put(CustomerController());

    return GetBuilder<OrdersController>(
      init: Get.find<OrdersController>(),
      builder: (controller) {
        List<OrderModel> filteredOrders = controller.ordersList
            .where((element) => element?.customerId == currentCustomer.id)
            .toList();

        // Calculate the total price of filtered orders
        double totalPrice = filteredOrders.fold(
            0.0, (sum, order) => sum + order.totalPriceAsDouble);

        return Scaffold(
          body: Stack(children: [
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const PrimaryBackButton(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Container(
                        width: double.infinity,
                        height: 100,
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(
                            color: kPrimaryColor,
                            width: 2.0,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(currentCustomer.name,
                                    style:
                                        GlobalTextStyles.viewCustomerTextStyle),
                                Text(currentCustomer.phoneNumber,
                                    style:
                                        GlobalTextStyles.viewCustomerTextStyle),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return EditUserBottomSheet(
                                      customerController: customerController,
                                      customerName: currentCustomer.name,
                                    );
                                  },
                                );
                              },
                              child: const Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(Icons.edit),
                                  Text('تعديل',
                                      style: GlobalTextStyles
                                          .viewCustomerTextStyle),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                      child: Text('قائمة الطلبات',
                          style: GlobalTextStyles.viewCustomerTextStyle),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.65,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: kSecondaryColor,
                        ),
                        child: ListView.builder(
                          itemCount: filteredOrders.length,
                          itemBuilder: (context, index) {
                            OrderModel currentOrder = filteredOrders[index];
                            return GestureDetector(
                              onTap: () {
                                Get.to(
                                    EditOrderView(currentOrder: currentOrder));
                              },
                              child: Card(
                                elevation: 0,
                                child: ListTile(
                                  title: Text(currentOrder.date,
                                      style: GlobalTextStyles
                                          .viewCustomerDetailsTextStyle),
                                  subtitle: Text(
                                    '${currentOrder.totalPrice}\$',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green,
                                    ),
                                  ),
                                  trailing: const Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Icon(Icons.edit),
                                      Text('تعديل',
                                          style: GlobalTextStyles
                                              .viewCustomerDetailsTextStyle),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 2,
              left: 16,
              right: 16,
              child: ChequeButton(
                totalPrice: totalPrice,
              ),
            ),
          ]),
        );
      },
    );
  }
}
