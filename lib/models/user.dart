// models/user.dart
class User {
  final int id;
  final String name;
  final String email;
  final String imagePath; // Path gambar disimpan di database

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.imagePath,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'imagePath': imagePath,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      imagePath: map['imagePath'],
    );
  }
}