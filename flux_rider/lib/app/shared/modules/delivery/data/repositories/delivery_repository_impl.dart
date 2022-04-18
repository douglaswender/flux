import 'package:connectivity/connectivity.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/network/network_info.dart';
import '../../domain/entities/address.dart';
import '../../domain/repositories/delivery_repository.dart';
import '../datasource/delivery_datasource.dart';
import '../models/delivery_model.dart';

class DeliveryRepositoryImpl implements DeliveryRepository {
  final DeliveryDatasource datasource;
  final NetworkInfo networkInfo;

  DeliveryRepositoryImpl({
    required this.datasource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, String>> publishDelivery({
    required Address originAddreess,
    required Address destinationAddreess,
    required String phoneNumber,
    required String userName,
    required String userId,
    required int valueOfRun,
    required String deliveryReceiver,
    required String deliveryDocument,
    required String deliveryDescription,
  }) async {
    if (await networkInfo.isConnected != ConnectivityResult.none) {
      try {
        final result = await datasource.publishDelivery(
          originAddress: originAddreess,
          destinationAddress: destinationAddreess,
          phoneNumber: phoneNumber,
          userName: userName,
          userId: userId,
          valueOfRun: valueOfRun,
          deliveryDescription: deliveryDescription,
          deliveryDocument: deliveryDocument,
          deliveryReceiver: deliveryReceiver,
        );

        return Right(result);
      } catch (e) {
        return Left(ServerFailure(e.toString()));
      }
    } else {
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, DeliveryModel>> getDelivery(
      {required String deliveryId, required String userId}) async {
    if (await networkInfo.isConnected != ConnectivityResult.none) {
      try {
        final result = await datasource.getDelivery(
          deliveryId: deliveryId,
          userId: userId,
        );

        return Right(result);
      } catch (e) {
        print(e);
        return Left(ServerFailure(e.toString()));
      }
    } else {
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, List<DeliveryModel>>> getDeliveries(
      {required String userId}) async {
    if (await networkInfo.isConnected != ConnectivityResult.none) {
      try {
        final result = await datasource.getDeliveries();

        return Right(result);
      } catch (e) {
        print(e);
        return Left(ServerFailure(e.toString()));
      }
    } else {
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> deleteDelivery(
      {required String deliveryId, required String userId}) async {
    if (await networkInfo.isConnected != ConnectivityResult.none) {
      try {
        await datasource.deleteDelivery(
          deliveryId: deliveryId,
          userId: userId,
        );

        return Right(true);
      } catch (e) {
        print(e);
        return Left(ServerFailure(e.toString()));
      }
    } else {
      return Left(ConnectionFailure());
    }
  }
}
