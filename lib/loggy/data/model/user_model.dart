class UserModel {
  final String id;
  final String email;
  final String name;
  final String age;
  final String image;
  final int password;

  UserModel({
    required this.password,
    required this.id,
    required this.image,
    required this.email,
    required this.name,
    required this.age,
  });

  UserModel copyWith({
    String? id,
    String? email,
    String? name,
    String? age,
    String? image,
    int? password,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      age: age ?? this.age,
      image: image ?? this.image,
      password: password ?? this.password,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      password: json['password'],
      id: json['id'],
      image: json['image'],
      email: json['email'],
      name: json['name'],
      age: json['age'],
    );
  }
}
