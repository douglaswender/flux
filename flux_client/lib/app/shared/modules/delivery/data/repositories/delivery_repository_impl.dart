import 'package:connectivity/connectivity.dart';
import 'package:flux_client/app/core/network/network_info.dart';
import 'package:flux_client/app/modules/home/domain/entities/address.dart';
import 'package:flux_client/app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flux_client/app/shared/modules/delivery/data/datasource/delivery_datasource.dart';
import 'package:flux_client/app/shared/modules/delivery/domain/repositories/delivery_repository.dart';

class DeliveryRepositoryImpl implements DeliveryRepository {
  final DeliveryDatasource datasource;
  final NetworkInfo networkInfo;

  DeliveryRepositoryImpl({
    required this.datasource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, bool>> publishDelivery({
    required Address originAddreess,
    required Address destinationAddreess,
    required String phoneNumber,
    required String userName,
  }) async {
    if (await networkInfo.isConnected != ConnectivityResult.none) {
      try {
        final result = await datasource.publishDelivery(
          originAddreess: originAddreess,
          destinationAddress: destinationAddreess,
          phoneNumber: phoneNumber,
          userName: userName,
        );

        return Right(true);
      } catch (e) {
        return Left(ServerFailure(e.toString()));
      }
    } else {
      return Left(ConnectionFailure());
    }
  }
}
