import 'package:dartz/dartz.dart';
import 'package:flux_client/app/core/errors/failure.dart';
import 'package:flux_client/app/modules/home/domain/entities/address.dart';
import 'package:flux_client/app/shared/modules/delivery/data/models/delivery_model.dart';

abstract class DeliveryRepository {
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
  });
  Future<Either<Failure, DeliveryModel>> getDelivery({
    required String deliveryId,
    required String userId,
  });

  Future<Either<Failure, List<DeliveryModel>>> getDeliveries({
    required String userId,
  });
}
