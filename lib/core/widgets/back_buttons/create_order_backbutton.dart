import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:middles/features/orders/presentation/widgets/customer_type_section.dart';

class CreateOrderBackButton extends StatelessWidget {
  const CreateOrderBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Get.back(); // Uses GetX to navigate back; replace with Navigator.pop(context) if not using GetX
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white, // Background color of the button
                shape: BoxShape.circle, // Circular shape
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 6,
                    offset: const Offset(0, 2), // Shadow position
                  ),
                ],
              ),
              child: const Icon(
                Icons.arrow_back,
                color: Colors.black, // Icon color
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.1,
          ),
          const CustomerTypeSection(), //todo
        ],
      ),
    );
  }
}
