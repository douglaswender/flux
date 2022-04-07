import 'package:connectivity/connectivity.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/network/network_info.dart';
import '../datasource/remote_data_source.dart';
import '../models/user_model.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';

typedef Future<UserModel> _GetUserModel();

class AuthRepositoryImpl implements AuthRepository {
  final RemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  UserModel? userModel;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });
  @override
  Future<Either<Failure, bool>> logout() async {
    try {
      final result = await remoteDataSource.logout();
      // Obtain shared preferences.
      final prefs = await SharedPreferences.getInstance();

      // Remove data for the 'email' key.
      await prefs.remove('email');
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
      {required String password, required UserModel user}) async {
    return _auth(
      () => remoteDataSource.signUpWithEmailAndPassword(
        password: password,
        user: user,
      ),
    );
  }

  Future<Either<Failure, User>> _auth(_GetUserModel getUserModel) async {
    if (await networkInfo.isConnected != ConnectivityResult.none) {
      try {
        final result = await getUserModel();
        this.userModel = result;
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

  @override
  Future<Either<Failure, User?>> getUser() async {
    return Right(userModel);
  }
}
