import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../../data/models/delivery_model.dart';
import '../entities/address.dart';

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

  Future<Either<Failure, bool>> deleteDelivery({
    required String deliveryId,
    required String userId,
  });
}
