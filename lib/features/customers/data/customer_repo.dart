import 'package:cloud_firestore/cloud_firestore.dart';


class CustomerRepo {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> updateCustomerInfo(
      String customerId, String name, String phoneNumber) async {
    try {
      firestore;

      await firestore.collection('customers').doc(customerId).update({
        'name': name,
        'phoneNumber': phoneNumber,
      });

      print('Customer information updated successfully!');
    } catch (e) {
      print('Error updating customer information: $e');
    }
  }
}
