
import 'package:middles/core/models/product_model.dart';

class OrderModel {
  final String customerId;
  final String customerName;
  final String date;
  final String totalPrice;
  final String id;
  final List<Product> cartItems;
  final String? cartLink;

  OrderModel({
    this.cartLink,
    required this.cartItems,
    required this.customerName,
    required this.customerId,
    required this.date,
    required this.totalPrice,
    required this.id,
  });

  double get totalPriceAsDouble {
    return double.tryParse(totalPrice) ?? 0.0;
  }

  Map<String, dynamic> toMap() {
    return {
      'customerId': customerId,
      'date': date,
      'total': totalPrice,
      'id': id,
    };
  }

  factory OrderModel.fromMap(String docId, Map<String, dynamic> map) {
    return OrderModel(
      cartLink: map['url'].toString(),
      id: map['id'].toString(),
      customerName: map['customerName'].toString(),
      customerId: map['customerId'].toString(),
      date: map['date'].toString(),
      totalPrice: map['total'].toString(),
      cartItems: (map['products'] as List<dynamic>?)
              ?.map((item) => Product.fromJson(item as Map<String, dynamic>))
              .toList() ??
          [], // Default to empty list if null
    );
  }
}
