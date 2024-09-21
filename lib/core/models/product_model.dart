class Product {
  final int itemId;
  final String qrCodeId;
  final String title;
  final String productType;
  final String productValue;
  final String attrName;
  final String attrValue;
  final String priceBeforeSele;
  final String price;
  final String? imageUrl;

  Product({
    required this.itemId,
    required this.qrCodeId,
    required this.title,
    required this.productType,
    required this.productValue,
    required this.attrName,
    required this.attrValue,
    required this.priceBeforeSele,
    required this.price,
    required this.imageUrl,
  });

  // Factory constructor to create an instance from JSON
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      itemId: json['item_id'],
      qrCodeId: json['qrCodeId'],
      title: json['title'],
      productType: json['product_type'],
      productValue: json['product_value'],
      attrName: json['attr_name'],
      attrValue: json['attr_value'],
      priceBeforeSele: json['priceBeforeSele'],
      price: json['price'],
      imageUrl: json['imageThumbnail'].toString(),
    );
  }

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'item_id': itemId,
      'qrCodeId': qrCodeId,
      'title': title,
      'product_type': productType,
      'product_value': productValue,
      'attr_name': attrName,
      'attr_value': attrValue,
      'priceBeforeSele': priceBeforeSele,
      'price': price,
      'imageThumbnail': imageUrl,
    };
  }
}
