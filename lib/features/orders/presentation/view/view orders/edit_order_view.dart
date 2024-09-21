import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/component/custom_text_field.dart';
import '../../../../../core/constant/color.dart';
import '../../../../../core/models/order_model.dart';
import '../../../../../core/widgets/back_buttons/primary_back_button.dart';
import '../../../../../core/widgets/buttons/save_order_button.dart';
import '../../../../../core/widgets/textfields/date_input.dart';
import '../../view model/orders_controller.dart';
import '../../widgets/listviews/photo_list_view.dart';

class EditOrderView extends StatelessWidget {
  final OrderModel? currentOrder;
  const EditOrderView({super.key, this.currentOrder});

  @override
  Widget build(BuildContext context) {
    if (currentOrder != null) {
      Get.find<OrdersController>().customerNameController.text =
          currentOrder!.customerName;
      Get.find<OrdersController>().customerPhoneController.text =
          Get.find<OrdersController>()
              .allCustomers
              .firstWhere((element) => element.id == currentOrder!.customerId)
              .phoneNumber;
      Get.find<OrdersController>().dateController.text = currentOrder!.date;
      Get.find<OrdersController>().linkController.text =
          currentOrder!.cartLink.toString();
      Get.find<OrdersController>().cartItems = currentOrder!.cartItems;
    }
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const PrimaryBackButton(),
                      customTextField(
                        Get.find<OrdersController>().customerNameController,
                        'اسم العميل',
                        'الرجاء إدخال اسم العميل',
                        true,
                        Icons.person,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Row(
                          children: [
                            Flexible(
                              child: customTextField(
                                Get.find<OrdersController>()
                                    .customerPhoneController,
                                'رقم الهاتف',
                                'الرجاء إدخال رقم الهاتف',
                                true,
                                Icons.phone,
                              ),
                            ),
                            Flexible(child: datePicker(context)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            Expanded(
                              child: customTextField(
                                  Get.find<OrdersController>().linkController,
                                  'رابط الطلب',
                                  'الرجاء ادخال رابط',
                                  false,
                                  Icons.link,
                                  isInsideRow: true),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                Get.find<OrdersController>().getCartInfo();
                              },
                              backgroundColor: kPrimaryColor,
                              child: const Icon(Icons.search),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'محتويات سلة العميل',
                          style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        PhotoListView(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: SaveOrderButton(
                currentOrder: currentOrder,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
