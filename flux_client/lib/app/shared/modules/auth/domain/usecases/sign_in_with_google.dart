import 'package:dartz/dartz.dart';
import 'package:flux_client/app/core/errors/failure.dart';
import 'package:flux_client/app/shared/modules/auth/domain/entities/user.dart';
import 'package:flux_client/app/shared/modules/auth/domain/repositories/auth_repository.dart';

class SignInWithGoogle {
  final AuthRepository repository;

  SignInWithGoogle({required this.repository});

  Future<Either<Failure, User>> call() {
    return repository.signInWithGoogle();
  }
}
