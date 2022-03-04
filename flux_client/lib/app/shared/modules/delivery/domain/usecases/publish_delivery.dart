import 'package:dartz/dartz.dart';
import 'package:flux_client/app/core/errors/failure.dart';
import 'package:flux_client/app/modules/home/domain/entities/address.dart';
import 'package:flux_client/app/shared/modules/delivery/domain/repositories/delivery_repository.dart';

class PublishDelivery {
  final DeliveryRepository repository;

  PublishDelivery({required this.repository});

  Future<Either<Failure, bool>> call({
    required Address originAddreess,
    required Address destinationAddreess,
    required String phoneNumber,
    required String userName,
  }) async {
    return await repository.publishDelivery(
        originAddreess: originAddreess,
        destinationAddreess: destinationAddreess,
        phoneNumber: phoneNumber,
        userName: userName);
  }
}
