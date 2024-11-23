class User {
  final String email;
  final String password;
  final String name;
  final String phone;
  final String phone_prefix;
  String? image;

  User({
    required this.email,
    required this.password,
    required this.name,
    required this.phone,
    required this.phone_prefix,

    this.image,
  });
}

