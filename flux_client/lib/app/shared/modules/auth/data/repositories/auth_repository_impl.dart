import 'package:connectivity/connectivity.dart';
import 'package:dartz/dartz.dart';
import 'package:flux_client/app/core/errors/exceptions.dart';
import 'package:flux_client/app/core/errors/failure.dart';
import 'package:flux_client/app/core/network/network_info.dart';
import 'package:flux_client/app/shared/modules/auth/data/datasource/remote_data_source.dart';
import 'package:flux_client/app/shared/modules/auth/data/models/user_model.dart';
import 'package:flux_client/app/shared/modules/auth/domain/entities/user.dart';
import 'package:flux_client/app/shared/modules/auth/domain/repositories/auth_repository.dart';

typedef Future<UserModel> _GetUserModel();

class AuthRepositoryImpl implements AuthRepository {
  final RemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });
  @override
  Future<Either<Failure, bool>> logout() async {
    try {
      final result = await remoteDataSource.logout();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on LogoutException {
      return Left(LogoutFailure());
    }
  }

  @override
  Future<Either<Failure, User>> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    return _auth(
      () => remoteDataSource.signInWithEmailandPassword(
        email: email,
        password: password,
      ),
    );
  }

  @override
  Future<Either<Failure, User>> signUpWithEmailAndPassword(
      {required String email,
      required String password,
      required String name}) async {
    return _auth(
      () => remoteDataSource.signUpWithEmailAndPassword(
        email: email,
        password: password,
        name: name,
      ),
    );
  }

  Future<Either<Failure, User>> _auth(_GetUserModel getUserModel) async {
    if (await networkInfo.isConnected != ConnectivityResult.none) {
      try {
        final result = await getUserModel();
        return Right(result);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      } on SignUpException {
        return Left(SignUpFailure());
      }
    } else {
      return Left(ConnectionFailure());
    }
  }
}
