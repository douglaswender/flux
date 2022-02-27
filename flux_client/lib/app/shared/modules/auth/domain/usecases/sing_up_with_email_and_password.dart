import 'package:dartz/dartz.dart';
import 'package:flux_client/app/shared/modules/auth/data/models/user_model.dart';
import '../../../../../core/errors/failure.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class SignUpWithEmailAndPassword {
  final AuthRepository repository;

  SignUpWithEmailAndPassword({
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
