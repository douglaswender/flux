import 'package:flux_client/app/shared/modules/auth/domain/entities/user.dart';

class UserModel extends User {
  final String email;
  final String? id;
  final String? name;
  final String? photoUrl;

  UserModel({
    this.name,
    this.photoUrl,
    required this.email,
    this.id,
  }) : super(email: email);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      id: json['uid'],
      name: json['name'],
      photoUrl: json['photoUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'email': email, 'id': id, 'name': name, 'photoUrl': photoUrl};
  }
}
