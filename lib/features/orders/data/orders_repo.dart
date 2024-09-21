import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/api/dio_consumer.dart';
import '../../../core/api/end_points.dart';
import '../../../core/models/customer_model.dart';
import '../../../core/models/order_model.dart';
import '../../../core/models/product_model.dart';
import '../../../core/models/usermodel.dart';

class OrdersRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  DioConsumer dio = DioConsumer(dio: Dio());

  // Method to get all orders from Firestore
  Future<List<OrderModel>> getAllOrders() async {
    try {
      UserModel? user = await getUserFromSharedPreferences();

      // Fetch the documents from the 'orders' collection
      QuerySnapshot snapshot = await _firestore
          .collection('orders')
          .where('UserId', isEqualTo: user!.id)
          .get();

      // Convert the documents to a list of Order objects
      return snapshot.docs.map((doc) {
        return OrderModel.fromMap(doc.id, doc.data() as Map<String, dynamic>);
      }).toList();
    } catch (e) {
      print('Error fetching orders: $e');
      return []; // Return an empty list on error
    }
  }

  Future<List<CustomerModel>> getAllCustomers() async {
    try {
      UserModel? user = await getUserFromSharedPreferences();
      // Fetch the documents from the 'orders' collection
      QuerySnapshot snapshot = await _firestore
          .collection('customers')
          .where('userId', isEqualTo: user!.id)
          .get();

      // Convert the documents to a list of Order objects
      return snapshot.docs.map((doc) {
        return CustomerModel.fromMap(
            doc.id, doc.data() as Map<String, dynamic>);
      }).toList();
    } catch (e) {
      print('Error fetching orders: $e');
      return []; // Return an empty list on error
    }
  }

  Future<void> addOrderToFirestore(OrderModel order) async {
    try {
      final firestore = FirebaseFirestore.instance;
      await firestore.collection('orders').add(order.toMap());
      print('Order added successfully!');
    } catch (e) {
      print('Error adding order: $e');
    }
  }

  Future moveOrderToHistory(String documentId) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Reference to the `orders` and `orderhistory` collections
    DocumentReference orderRef = firestore.collection('orders').doc(documentId);
    CollectionReference orderHistoryRef = firestore.collection('order_history');

    try {
      // Get the document data from the 'orders' collection
      DocumentSnapshot orderSnapshot = await orderRef.get();

      if (orderSnapshot.exists) {
        // Add a new field for the current date
        Map<String, dynamic> orderData =
            orderSnapshot.data() as Map<String, dynamic>;
        orderData['date'] =
            '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}';

        // Add the document to the 'orderhistory' collection
        await orderHistoryRef.doc(documentId).set(orderData);

        // Remove the document from the 'orders' collection
        await orderRef.delete();

        print('Order moved to history and deleted from orders.');
      } else {
        print('Order does not exist.');
      }
    } catch (e) {
      print('Error moving order to history: $e');
    }
  }

  Future<UserModel?> getUserFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userJson = prefs.getString('currentUser');

    if (userJson != null) {
      Map<String, dynamic> userMap = jsonDecode(userJson);
      return UserModel.fromMap(userMap, userMap['id']);
    }
    return null; // No user found
  }

  Future<void> createCustomer(String name, String phoneNumber) async {
    try {
      // Initialize Firestore instance
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Retrieve the user ID from shared preferences
      UserModel? savedUser = await getUserFromSharedPreferences();
      String? userId =
          savedUser?.id; // Make sure you stored 'userId' when user logged in

      if (userId == null) {
        throw Exception('User not logged in or userId not found.');
      }

      // Create a new document in the 'customers' collection
      DocumentReference docRef = firestore.collection('customers').doc();

      // Set the customer data with generated doc ID
      await docRef.set({
        'id': docRef.id, // Auto-generated document ID
        'name': name, // Customer's name
        'phoneNumber': phoneNumber, // Customer's phone number
        'userId': userId, // ID of the user who created the customer
      });

      print("Customer created with ID: ${docRef.id}");
    } catch (e) {
      print("Error creating customer: $e");
    }
  }

  Future<void> createOrder(
      String date,
      String totalPrice,
      Function(String message) onSuccess,
      Function(String error) onError,
      List<Product> products,
      String url,
      {String? customerId,
      String? customerName,
      CustomerModel? customer}) async {
    try {
      // Initialize Firestore instance
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Retrieve the user ID from shared preferences
      UserModel? savedUser = await getUserFromSharedPreferences();
      String? userId =
          savedUser?.id; // Make sure you stored 'userId' when user logged in

      if (userId == null) {
        throw Exception('User not logged in or userId not found.');
      }

      // Create a new document in the 'orders' collection
      DocumentReference docRef = firestore.collection('orders').doc();

      if (customerId != null) {
        await docRef.set({
          'id': docRef.id, // Auto-generated document ID
          'date': date,
          'customerName': customerName,
          'UserId': userId,
          'url': url,
          'total': totalPrice,
          'customerId': customerId,
          'products': products
              .map((product) => product.toJson())
              .toList(), // Add products list
        });
      } else {
        // Create a new document in the 'customers' collection
        DocumentReference docRefCustomers =
            firestore.collection('customers').doc();

        // Set the customer data with generated doc ID
        await docRefCustomers.set({
          'id': docRefCustomers.id,
          'name': customer!.name,
          'phoneNumber': customer.phoneNumber,
          'userId': userId,
        });

        await docRef.set({
          'id': docRef.id,
          'date': date,
          'total': totalPrice,
          'UserId': userId,
          'url': url,
          'customerName': customer.name,
          'customerId': docRefCustomers.id,
          'products': products
              .map((product) => product.toJson())
              .toList(), // Add products list
        });
      }
      onSuccess('تم انشاء طلبك بنجاح');
      print("Order created with ID: ${docRef.id}");
    } catch (e) {
      onError(e.toString());
      print("Error creating order: $e");
    }
  }

  Future<void> editOrder(
    OrderModel order,
    Function(String message) onSuccess,
    Function(String error) onError,
  ) async {
    try {
      // Reference to the document using its ID
      DocumentReference docRef =
          FirebaseFirestore.instance.collection('orders').doc(order.id);

      // Update the document with new data
      await docRef.update({
        'date': order.date,
        'total': order.totalPrice,
        'url': order.cartLink,
        'customerName': order.customerName,
        'customerId': order.customerId,
        'products': order.cartItems.map((product) => product.toJson()).toList(),
      });
      onSuccess('تم تعديل الطلب بنجاح');
      print('Order updated successfully');
    } catch (e) {
      onSuccess(e.toString());
      print('Failed to update order: $e');
    }
  }

  Future<void> getCartInfo(
    String urlLink,
    Function(List<Product> products) onSuccess,
    Function(String error) onError,
  ) async {
    try {
      final url = EndPoints.basUrl;
      dynamic response = await dio.post(
        url,
        data: {'url': urlLink},
        headers: {
          'Content-Type': 'application/json',
        },
      );

      // Check if the response contains the 'data' field and it's a list
      if (response != null && response['data'] is List) {
        // Parse the 'data' list and convert each item into a Product
        final products = (response['data'] as List)
            .map((item) => Product.fromJson(item))
            .toList();
        onSuccess(products);
      } else {
        // Handle error if 'data' field is missing or not a list
        onError(response.toString() ?? '');
      }
    } catch (e) {
      // Handle any exceptions that occur during the request
      onError(e.toString());
      print("Error from getCartInfo: $e");
      rethrow;
    }
  }

  Future<CustomerModel?> getCustomerById(String customerId) async {
    try {
      // Initialize Firestore instance
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Reference to the specific document
      DocumentReference docRef =
          firestore.collection('customers').doc(customerId);

      // Fetch the document
      DocumentSnapshot docSnapshot = await docRef.get();

      if (docSnapshot.exists) {
        // Document exists, convert it to a CustomerModel instance
        return CustomerModel.fromMap(
            docSnapshot.id, docSnapshot.data() as Map<String, dynamic>);
      } else {
        // Document does not exist
        print('No customer found with ID: $customerId');
        return null;
      }
    } catch (e) {
      print('Error fetching customer data: $e');
      return null;
    }
  }
}
