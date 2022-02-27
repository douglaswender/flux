import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? email;
  final String? id;
  final String? name;
  final String? photoUrl;
  final String? phoneNumber;

  User({
    this.id,
    this.name,
    this.photoUrl,
    this.phoneNumber,
    required this.email,
  }) : assert(email != '');

  @override
  List<Object> get props => [id ?? 0];
}
