import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../../data/models/user_model.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class RegisterUser {
  final AuthRepository repository;

  RegisterUser({
    required this.repository,
  });

  Future<Either<Failure, User>> call({
    required String password,
    required UserModel user,
  }) {
    return repository.signUpWithEmailAndPassword(
      password: password,
      user: user,
    );
  }
}
