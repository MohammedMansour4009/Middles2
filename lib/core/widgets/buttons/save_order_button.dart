import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../features/orders/presentation/view model/orders_controller.dart';
import '../../constant/color.dart';
import '../../models/order_model.dart';

class SaveOrderButton extends StatelessWidget {
  final OrderModel? currentOrder;
  const SaveOrderButton({super.key, this.currentOrder});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 50,
      child: ElevatedButton(
          onPressed: () {
            if (currentOrder == null) {
              Get.find<OrdersController>().createOrder();
            } else {
              Get.find<OrdersController>()
                  .editOrder(currentOrder!.customerId, currentOrder!.id);
            }
          },
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              backgroundColor: kPrimaryColor),
          child: Row(
            children: [
              Text(
                currentOrder != null ? 'تعديل الطلب' : 'حفظ الطلب',
                style: const TextStyle(color: kSecondaryColor),
              ),
              const Icon(Icons.save, color: kSecondaryColor),
            ],
          )),
    );
  }
}
