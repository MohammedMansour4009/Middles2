class UserModel {
  final String id;
  final String name;
  final String phoneNumber;
  final String password;

  UserModel({
    required this.password,
    required this.id,
    required this.name,
    required this.phoneNumber,
  });

  // Convert Firestore data into a UserModel
  factory UserModel.fromMap(Map<String, dynamic> data, String id) {
    return UserModel(
      id: id,
      name: data['name'] ?? '',
      phoneNumber: data['phoneNumber'] ?? '',
      password: data['password'] ?? '',
    );
  }

  // Convert UserModel to a map (optional)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phoneNumber': phoneNumber,
    };
  }
}
