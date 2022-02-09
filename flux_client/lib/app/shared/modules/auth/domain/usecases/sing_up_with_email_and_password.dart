import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class SignUpWithEmailAndPassword {
  final AuthRepository repository;

  SignUpWithEmailAndPassword({
    required this.repository,
  });

  Future<Either<Failure, User>> call({
    required String email,
    required String password,
    required String name,
  }) {
    return repository.signUpWithEmailAndPassword(
      email: email,
      password: password,
      name: name,
    );
  }
}
