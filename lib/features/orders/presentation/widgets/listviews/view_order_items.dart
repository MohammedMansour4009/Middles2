import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constant/color.dart';
import '../../../../../core/models/product_model.dart';
import '../../../../../core/widgets/cards/item_details.dart';
import '../../view model/orders_controller.dart';

class ViewOrderItems extends StatelessWidget {
  final List<Product> products;

  const ViewOrderItems({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrdersController>(builder: (controller) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: kSecondaryColor,
            border: Border.all(color: Colors.grey, width: 0.3),
          ),
          height: MediaQuery.of(context).size.height * 0.7, // Adjusted height
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: GridView.builder(
              shrinkWrap: true, // To prevent infinite height issues
              physics:
                  const NeverScrollableScrollPhysics(), // Disable scrolling inside the GridView
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return _buildPhotoContainer(
                    context, products[index], index, controller);
              },
            ),
          ),
        ),
      );
    });
  }

  Widget _buildPhotoContainer(BuildContext context, Product currentProduct,
      int index, OrdersController controller) {
    return GestureDetector(
      onTap: () {
        _showItemDetailsDialog(context, currentProduct);
      },
      child: Container(
        decoration: BoxDecoration(
          color: kSecondaryColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: kPrimaryColor,
            width: 2,
          ),
        ),
        child: Column(
          children: [
            const Text(
              'وصف  المادة:',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  color: kPrimaryColor),
              textAlign: TextAlign.center,
            ),
            Flexible(
              child: Text(
                '${currentProduct.title.substring(0, 35)}...',
                style: const TextStyle(
                    fontSize: 17, fontWeight: FontWeight.w400, height: 2),
                textAlign: TextAlign.center,
              ),
            ),
            const Text(
              'رقم كود المادة:',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  color: kPrimaryColor),
              textAlign: TextAlign.center,
            ),
            Flexible(
              child: Text(
                '${currentProduct.qrCodeId.substring(0, 15)}...',
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
            ),
            const Text(
              'رقم المادة:',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  color: kPrimaryColor),
              textAlign: TextAlign.center,
            ),
            Flexible(
              child: Text(
                '${currentProduct.itemId}',
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showItemDetailsDialog(BuildContext context, Product currentProduct) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: ItemDetailsCard(
            currentProduct: currentProduct,
          ),
        );
      },
    );
  }
}
