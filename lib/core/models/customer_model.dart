class CustomerModel {
  final String name;
  final String phoneNumber;
  final String? id;
  final String? userId;

  CustomerModel({required this.name, required this.phoneNumber,  this.id,  this.userId});

    Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phoneNumber': phoneNumber,
      'userId': userId,
      'id': id,
    };
  }

  factory CustomerModel.fromMap(String docId, Map<String, dynamic> map) {
    return CustomerModel(
      id: map['id'].toString(),
      name: map['name'].toString(),
      phoneNumber: map['phoneNumber'].toString(),
      userId: map['userId'].toString(),
    );
  }
}
