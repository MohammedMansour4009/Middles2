import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../features/orders/presentation/view model/orders_controller.dart';

datePicker(BuildContext context) {
  return GetBuilder<OrdersController>(builder: (controller) {
    var selectedDate = DateTime.now();
    return TextField(
      controller: controller.dateController,
      onTap: () async {
        final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: selectedDate,
          firstDate: DateTime(2000),
          lastDate: DateTime(2101),
        );
        if (picked != null) {
          selectedDate = picked;
          controller.dateController.text = DateFormat('yyyy-MM-dd')
              .format(selectedDate); // Update text field with selected date
        }
      },
      decoration: InputDecoration(
        labelText: 'Select Date',
        suffixIcon: const Icon(Icons.calendar_today),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0.0),
        ),
      ),
      readOnly: true, // Make the TextField read-only
    );
  });
}
