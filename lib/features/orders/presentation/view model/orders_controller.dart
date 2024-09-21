import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../core/constant/color.dart';
import '../../../../core/models/customer_model.dart';
import '../../../../core/models/order_model.dart';
import '../../../../core/models/product_model.dart';
import '../../../../core/widgets/custom_toast/custom_toast.dart';
import '../../data/orders_repo.dart';

class OrdersController extends GetxController {
  // Existing controllers
  var customerNameController = TextEditingController();
  var customerPhoneController = TextEditingController();
  var billTotalController = TextEditingController();
  var linkController = TextEditingController();
  var dateController = TextEditingController(
      text: DateFormat('yyyy-MM-dd').format(DateTime.now()));
  CustomerModel? customer;
  CustomerModel? currentCustomer;

  bool isLoading = true;
  OrdersRepo repo = OrdersRepo();
  List<OrderModel> ordersList = [];
  List<CustomerModel> allCustomers = [];
  List<Product> cartItems = [];

  // New feature: Add a customer type (new or old)
  var customerType = 'new'.obs; // 'new' or 'old'

  clearOrder() {
    customerNameController.clear();
    customerPhoneController.clear();
    linkController.clear();
    dateController.clear();
    cartItems.clear();
    update();
  }

  // Function to change customer type
  void setCustomerType(String type) {
    customerType.value = type;
    cartItems.clear();
    update();
  }

  getOrdersAndCustomers() async {
    isLoading = true;
    update();
    ordersList = await repo.getAllOrders();
    allCustomers = await repo.getAllCustomers();
    isLoading = false;
    update();
  }

  createOrder() {
    double orderTotal = 0;
    for (var element in cartItems) {
      orderTotal += double.parse(element.price);
    }

    if (customerType.value == 'new') {
      if (dateController.text.isNotEmpty &&
          cartItems.isNotEmpty &&
          linkController.text.isNotEmpty &&
          customerNameController.text.isNotEmpty &&
          customerPhoneController.text.isNotEmpty) {
        customer = CustomerModel(
            name: customerNameController.text,
            phoneNumber: customerPhoneController.text);
        repo.createOrder(dateController.text, orderTotal.toString(),
            (succesMessage) {
          Get.back();
          cartItems.clear();
          customer = null;
          currentCustomer = null;
          showCustomToaster(succesMessage);
        }, (errorMessage) {
          showCustomToaster(errorMessage, isError: true);
        }, cartItems, linkController.text, customer: customer);
      } else {
        Get.snackbar('خطأ', 'الرجاء ملء جميع الحقول',
            backgroundColor: kAlertColor, colorText: Colors.white);
      }
    } else {
      if (dateController.text.isNotEmpty &&
          cartItems.isNotEmpty &&
          linkController.text.isNotEmpty &&
          customer != null) {
        repo.createOrder(
          dateController.text,
          orderTotal.toString(),
          (succesMessage) {
            Get.back();
            cartItems.clear();
            customer = null;
            currentCustomer = null;
            showCustomToaster(succesMessage);
            getOrdersAndCustomers();
          },
          (errorMessage) {
            showCustomToaster(errorMessage, isError: true);
          },
          cartItems,
          linkController.text,
          customerId: customer!.id,
          customerName: customer!.name,
        );
      } else {
        Get.snackbar('خطأ', 'الرجاء ملء جميع الحقول',
            backgroundColor: kAlertColor, colorText: Colors.white);
      }
    }
  }

  getCartInfo() async {
    String url = linkController.text;
    await repo.getCartInfo(url, (products) {
      cartItems = products;
      update();
    }, (error) {
      Get.snackbar('Error', error,
          backgroundColor: kAlertColor, colorText: Colors.white);
    });
  }

  getCustomerByID(String id) async {
    currentCustomer = await repo.getCustomerById(id);
    update();
  }

  editOrder(String customerId, String orderId) {
    isLoading = true;
    update();
    double orderTotal = 0;
    for (var element in cartItems) {
      orderTotal += double.parse(element.price);
    }
    repo.editOrder(
      OrderModel(
        cartItems: cartItems,
        customerName: customerNameController.text,
        customerId: customerId,
        date: dateController.text,
        totalPrice: orderTotal.toString(),
        cartLink: linkController.text,
        id: orderId,
      ),
      (succesMessage) {
        Get.back();
        cartItems.clear();
        customer = null;
        currentCustomer = null;
        showCustomToaster(succesMessage);
        getOrdersAndCustomers();
      },
      (errorMessage) {
        showCustomToaster(errorMessage, isError: true);
      },
    );

    isLoading = false;
    update();
  }
}
