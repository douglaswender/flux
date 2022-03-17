import 'package:connectivity/connectivity.dart';
import 'package:flux_client/app/core/network/network_info.dart';
import 'package:flux_client/app/modules/home/domain/entities/address.dart';
import 'package:flux_client/app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flux_client/app/shared/modules/delivery/data/datasource/delivery_datasource.dart';
import 'package:flux_client/app/shared/modules/delivery/data/models/delivery_model.dart';
import 'package:flux_client/app/shared/modules/delivery/domain/repositories/delivery_repository.dart';

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
        final result = await datasource.getDeliveries(
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
}
