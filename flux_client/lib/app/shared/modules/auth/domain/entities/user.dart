import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? id;
  final String email;

  User({
    this.id,
    required this.email,
  }) : assert(email != '');

  @override
  List<Object> get props => [id ?? 0];
}