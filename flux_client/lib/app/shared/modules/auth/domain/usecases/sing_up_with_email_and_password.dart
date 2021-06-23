import 'package:dartz/dartz.dart';
import 'package:flux_client/app/core/errors/failure.dart';
import 'package:flux_client/app/shared/modules/auth/domain/entities/user.dart';
import 'package:flux_client/app/shared/modules/auth/domain/repositories/auth_repository.dart';

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
