import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constant/color.dart';
import '../../../../../core/constant/text_styles.dart';
import '../../../../../core/models/order_model.dart';
import '../../../../../core/widgets/back_buttons/primary_back_button.dart';
import '../../view model/orders_controller.dart';
import '../../widgets/listviews/view_order_items.dart';

class OrderDetails extends StatelessWidget {
  final OrderModel currentOrder;
  const OrderDetails({
    super.key,
    required this.currentOrder,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrdersController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const PrimaryBackButton(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                        color: kPrimaryColor,
                        width: 2.0,
                      ),
                    ),
                    child: Column(
                      children: [
                        RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              const TextSpan(
                                  text: 'اسم العميل: ',
                                  style: GlobalTextStyles.orderLabelTextStyle),
                              TextSpan(
                                  text: currentOrder.customerName,
                                  style:
                                      GlobalTextStyles.orderRegularTextStyle),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10), // Add spacing
                        RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              const TextSpan(
                                  text: 'تاريخ الطلب : ',
                                  style: GlobalTextStyles.orderLabelTextStyle),
                              TextSpan(
                                  text: currentOrder.date,
                                  style:
                                      GlobalTextStyles.orderRegularTextStyle),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10), // Add spacing
                        RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              const TextSpan(
                                  text: 'سعر الطلب : ',
                                  style: GlobalTextStyles.orderLabelTextStyle),
                              TextSpan(
                                  text: '${currentOrder.totalPrice} \$',
                                  style:
                                      GlobalTextStyles.orderRegularTextStyle),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ViewOrderItems(
                  products: currentOrder.cartItems,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
