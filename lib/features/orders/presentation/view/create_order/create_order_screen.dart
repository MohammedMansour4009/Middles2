import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/component/ItemsContainer.dart';
import '../../../../../core/component/custom_text_field.dart';
import '../../../../../core/constant/color.dart';
import '../../../../../core/widgets/back_buttons/create_order_backbutton.dart';
import '../../../../../core/widgets/buttons/save_order_button.dart';
import '../../../../../core/widgets/dropdowns/person_selection.dart';
import '../../../../../core/widgets/textfields/date_input.dart';
import '../../view model/orders_controller.dart';
import '../../widgets/new_customer/new_customer.dart';

class CreateNewOrderScreen extends StatelessWidget {
  final TextEditingController customerNameController = TextEditingController();

  CreateNewOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<OrdersController>(
        init: OrdersController(),
        builder: (controller) {
          return SafeArea(
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      const CreateOrderBackButton(),
                      // Section to toggle customer type

                      // Display different widgets based on customer type
                      Obx(() {
                        if (controller.customerType.value == 'new') {
                          return const NewCustomer();
                        } else {
                          return Column(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  primaryDropDown(
                                      'اسم العميل', controller.allCustomers,
                                      (val) {
                                    controller.customer = val;
                                    controller.update();
                                  }),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 8),
                                    child: datePicker(context),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: customTextField(
                                              controller.linkController,
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
                                            Get.find<OrdersController>()
                                                .getCartInfo();
                                          },
                                          backgroundColor: kPrimaryColor,
                                          child: const Icon(Icons.search),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              const Itemscontainer(),
                            ],
                          );
                        }
                      }),
                    ],
                  ),
                ),
                // Save Order Button Positioned at the bottom of the screen
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: SaveOrderButton(),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
