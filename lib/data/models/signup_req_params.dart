import '../../domain/entities/user.dart';

class SignupReqParams extends User {
  SignupReqParams({
    required String email,
    required String password,
    required String name,
    required String phone,
    required String phone_prefix,
    String? image,  // Make image nullable here too
  }) : super(
    email: email,
    password: password,
    name: name,
    phone: phone,
    image: image,
    phone_prefix: phone_prefix// Pass the nullable image to the User class
  );

  factory SignupReqParams.fromJson(Map<String, dynamic> json) {
    return SignupReqParams(
      email: json['email'],
      password: json['password'],
      name: json['name'],
      phone: json['phone'],
      phone_prefix:json['phone_prefix'],
      image: json['image'],  // Handle image field
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
      'name': name,
      'phone': phone,
      'phone_prefix':phone_prefix,
      'image': image,  // Handle image field, will be null if not set
    };
  }
}
