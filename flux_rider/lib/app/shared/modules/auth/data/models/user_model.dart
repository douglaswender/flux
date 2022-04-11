import '../../domain/entities/user.dart';

class UserModel extends User {
  final String? email;
  final String? id;
  final String? name;
  final String? photoUrl;
  final String? phoneNumber;
  final String? carModel;
  final String? carColor;
  final String? carId;

  UserModel({
    this.name,
    this.photoUrl,
    this.email,
    this.id,
    this.phoneNumber,
    this.carModel,
    this.carColor,
    this.carId,
  }) : super(email: email ?? "", id: id);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      id: json['uid'],
      name: json['name'],
      photoUrl: json['photoUrl'],
      phoneNumber: json['phoneNumber'],
      carModel: json['carModel'],
      carColor: json['carColor'],
      carId: json['carId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'id': id,
      'name': name,
      'photoUrl': photoUrl,
      'phoneNumber': phoneNumber,
      'carModel': carModel,
      'carColor': carColor,
      'carId': carId,
    };
  }
}
