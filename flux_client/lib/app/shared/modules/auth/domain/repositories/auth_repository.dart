import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> signUpWithEmailAndPassword(
      {required String email, required String password, required String name});
  Future<Either<Failure, User>> signInWithEmailAndPassword(
      {required String email, required String password});
  Future<Either<Failure, User>> signInWithGoogle();
  Future<Either<Failure, bool>> logout();
}
