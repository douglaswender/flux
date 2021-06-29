import 'package:dartz/dartz.dart';
import 'package:flux_client/app/core/errors/failure.dart';
import 'package:flux_client/app/shared/modules/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> signUpWithEmailAndPassword(
      {required String email, required String password, required String name});
  Future<Either<Failure, User>> signInWithEmailAndPassword(
      {required String email, required String password});
  Future<Either<Failure, User>> signInWithGoogle();
  Future<Either<Failure, bool>> logout();
}
