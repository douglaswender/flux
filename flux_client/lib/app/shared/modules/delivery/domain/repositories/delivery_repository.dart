import 'package:dartz/dartz.dart';
import 'package:flux_client/app/core/errors/failure.dart';
import 'package:flux_client/app/modules/home/domain/entities/address.dart';

abstract class DeliveryRepository {
  Future<Either<Failure, bool>> publishDelivery({
    required Address originAddreess,
    required Address destinationAddreess,
    required String phoneNumber,
    required String userName,
  });
}
