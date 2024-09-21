import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/customer_repo.dart';

class CustomerController extends GetxController {
  var customerNameController = TextEditingController();
  var customerPhoneController = TextEditingController();

  CustomerRepo repo = CustomerRepo();
  Future<void> updateCustomerInfo(name) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('customers')
          .where('name', isEqualTo: '$name')
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        var customerDoc = querySnapshot.docs.first;
        String customerId = customerDoc.id;

        await repo.updateCustomerInfo(
          customerId,
          customerNameController.text,
          customerPhoneController.text,
        );
      } else {
        print('No customer found with the provided email.');
      }
    } catch (e) {
      print('Error fetching customer ID: $e');
    }
  }
}
