import 'package:flutter/material.dart';

import '../../constant/text_styles.dart';
import '../../models/product_model.dart';

class ItemDetailsCard extends StatelessWidget {
  final Product currentProduct;

  const ItemDetailsCard({super.key, required this.currentProduct});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                currentProduct.imageUrl.toString(),
                width: 200,
                height: 200,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                      child: Icon(Icons.error, color: Colors.red));
                },
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'وصف المادة:  ',
              style: GlobalTextStyles.labelTextStyle,
            ),
            Text('${currentProduct.title} ',
                style: GlobalTextStyles.regularTextStyle),
            const SizedBox(height: 10),
            const Text('رقم كود المادة : ',
                style: GlobalTextStyles.labelTextStyle),
            Text(currentProduct.qrCodeId,
                style: GlobalTextStyles.regularTextStyle),
            const SizedBox(height: 10),
            const Text('رقم المادة : ', style: GlobalTextStyles.labelTextStyle),
            Text(currentProduct.itemId.toString(),
                style: GlobalTextStyles.regularTextStyle),
            const SizedBox(height: 10),
            const Text('السعر : ', style: GlobalTextStyles.labelTextStyle),
            Text(currentProduct.price.toString(),
                style: GlobalTextStyles.regularTextStyle),
            const SizedBox(height: 10),
            const Text('السعر قبل الخصم : ',
                style: GlobalTextStyles.labelTextStyle),
            Text(currentProduct.priceBeforeSele.toString(),
                style: GlobalTextStyles.regularTextStyle),
            const SizedBox(height: 10),
            Text('${currentProduct.productType} :',
                style: GlobalTextStyles.labelTextStyle),
            Text(currentProduct.productValue.toString(),
                style: GlobalTextStyles.regularTextStyle),
            const SizedBox(height: 10),
            Text('${currentProduct.attrName} :',
                style: GlobalTextStyles.labelTextStyle),
            Text(
              currentProduct.attrValue.toString(),
              style: GlobalTextStyles.regularTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
