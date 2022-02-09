import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class SignInWithGoogle {
  final AuthRepository repository;

  SignInWithGoogle({required this.repository});

  Future<Either<Failure, User>> call() {
    return repository.signInWithGoogle();
  }
}
