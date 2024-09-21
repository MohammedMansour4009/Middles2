import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constant/color.dart';
import '../../../../../core/models/product_model.dart';
import '../../../../../core/utils/images.dart';
import '../../../../../core/widgets/cards/item_details.dart';
import '../../view model/orders_controller.dart';

class PhotoListView extends StatelessWidget {
  const PhotoListView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrdersController>(builder: (controller) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: kSecondaryColor,
          border: Border.all(color: Colors.grey, width: 0.3),
        ),
        height: MediaQuery.of(context).size.height * 0.47,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 1,
              mainAxisSpacing: 1,
            ),
            itemCount: controller.cartItems.length,
            itemBuilder: (context, index) {
              return itemCard(
                  context, controller.cartItems[index], index, controller);
            },
          ),
        ),
      );
    });
  }

  Widget itemCard(BuildContext context, Product item, int index,
      OrdersController controller) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            _showItemDetailsDialog(context, item);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product image
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        // borderRadius: const BorderRadius.vertical(
                        //     top: Radius.circular(16)),
                        image: DecorationImage(
                          image: NetworkImage(item.imageUrl.toString()),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                  // Product title
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      item.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          Images.expandIcon,
                          width: 15,
                        ),
                        Text(
                          'JOD ${double.parse(item.price).toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: GestureDetector(
            onTap: () {
              controller.cartItems.removeAt(index);
              controller.update();
            },
            child: Image.asset(
              'assets/remove.png',
              width: 25,
              height: 25,
            ),
          ),
        ),
      ],
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
