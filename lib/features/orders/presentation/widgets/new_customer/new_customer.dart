import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/component/custom_text_field.dart';
import '../../../../../core/constant/color.dart';
import '../../../../../core/widgets/textfields/date_input.dart';
import '../../view model/orders_controller.dart';
import '../listviews/photo_list_view.dart';

class NewCustomer extends StatelessWidget {
  const NewCustomer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: 380,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0),
        child: Center(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customTextField(
                    Get.find<OrdersController>().customerNameController,
                    'اسم العميل',
                    'الرجاء إدخال اسم العميل',
                    false,
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
    );
  }
}
