import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../../core/constant/color.dart';
import '../../view_model/invoice_controller.dart';

class ChequeDialog extends StatelessWidget {
  final double totalPrice;

  ChequeDialog({super.key, required this.totalPrice}) {
    final InvoiceController invoiceController = Get.put(InvoiceController());
    invoiceController.priceController.text = totalPrice.toString();
    invoiceController.priceText.value = totalPrice.toString();
  }

  @override
  Widget build(BuildContext context) {
    final InvoiceController invoiceController = Get.find<InvoiceController>();

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Price TextField
            TextField(
              controller: invoiceController.priceController,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              decoration: const InputDecoration(
                labelText: 'المبلغ',
                border: OutlineInputBorder(),
              ),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
            ),
            const SizedBox(height: 15),
            // Cliq TextField
            TextField(
              controller: invoiceController.cliqController,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              decoration: const InputDecoration(
                labelText: 'اسم/رقم كليك',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 25),
            // Invoice Text
            Obx(() {
              double currentTotalPrice = double.tryParse(invoiceController.priceText.value) ?? 0.0;
              return Text(
                'سداد الفاتورة بمبلغ مقداره ${currentTotalPrice.toString()} عن طريق الحوالة البنكية ${invoiceController.cliqText.value}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              );
            }),
            const SizedBox(height: 25),
            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    double currentTotalPrice = double.tryParse(invoiceController.priceText.value) ?? 0.0;
                    Share.share(
                        'يرجى سداد الفاتورة بمبلغ مقداره ${currentTotalPrice.toString()} عن طريق الحوالة البنكية \n${invoiceController.cliqText.value}',
                        subject: 'Customer Notification');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('مشاركة الفاتورة'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () async {
                    await invoiceController.saveCliq();
                    Get.back();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('اغلاق'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
