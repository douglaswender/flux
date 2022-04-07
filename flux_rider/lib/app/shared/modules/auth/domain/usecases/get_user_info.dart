import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class GetUserInfo {
  final AuthRepository repository;

  GetUserInfo({required this.repository});

  Future<Either<Failure, User?>> call() async {
    return repository.getUser();
  }
}
