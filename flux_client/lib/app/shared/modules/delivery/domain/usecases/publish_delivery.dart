import 'package:dartz/dartz.dart';
import 'package:flux_client/app/core/errors/failure.dart';
import 'package:flux_client/app/modules/home/data/models/address_model.dart';
import 'package:flux_client/app/shared/modules/delivery/domain/repositories/delivery_repository.dart';

class PublishDelivery {
  final DeliveryRepository repository;

  PublishDelivery({required this.repository});

  Future<Either<Failure, String>> call({
    required AddressModel originAddreess,
    required AddressModel destinationAddreess,
    required String phoneNumber,
    required String userName,
    required String userId,
    required int valueOfRun,
  }) async {
    return await repository.publishDelivery(
      originAddreess: originAddreess,
      destinationAddreess: destinationAddreess,
      phoneNumber: phoneNumber,
      userName: userName,
      userId: userId,
      valueOfRun: valueOfRun,
    );
  }
}
