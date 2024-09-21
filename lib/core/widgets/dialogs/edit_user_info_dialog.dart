import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../features/customers/presentation/view_model/customer_controller.dart';
import '../../constant/color.dart';

class EditUserBottomSheet extends StatelessWidget {
  final CustomerController customerController;
  final String customerName;

  const EditUserBottomSheet({
    super.key,
    required this.customerController,
    required this.customerName,
  });

  @override
  Widget build(BuildContext context) {
    customerController.customerNameController.text = customerName;

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: customerController.customerNameController,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0), // Rounded corners
                ),
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 12.0),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: customerController.customerPhoneController,
              decoration: InputDecoration(
                labelText: 'Phone',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0), // Rounded corners
                ),
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 12.0),
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  customerController.updateCustomerInfo(customerName);
                  Get.back();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 12.0),
                ),
                child: const Text(
                  'حفظ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
