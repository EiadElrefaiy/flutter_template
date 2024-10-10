
class UserModel {

  UserModel();

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel();
  Map<String, dynamic> toJson() => {};
}


/*
 class UserModel {
  int id;
  String name;
  String email;
  String phoneNumber;

  // Constructor with optional named parameters
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
  });

  // Factory constructor to create a UserModel object from a JSON map
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? 0, // Default value of 0 if id is null
      name: json['name'] ?? '', // Default value of empty string if name is null
      email: json['email'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
    );
  }

  // Method to convert the UserModel object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
    };
  }
}
* */