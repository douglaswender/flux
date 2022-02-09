import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../repositories/auth_repository.dart';

class LogoutUser {
  final AuthRepository repository;

  LogoutUser({required this.repository});

  Future<Either<Failure, bool>> call() {
    return repository.logout();
  }
}
