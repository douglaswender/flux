import 'package:dartz/dartz.dart';
import 'package:flux_rider/app/shared/modules/delivery/domain/repositories/delivery_repository.dart';

import '../../../../../core/errors/failure.dart';
import '../../data/models/address_model.dart';

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
    required String deliveryReceiver,
    required String deliveryDocument,
    required String deliveryDescription,
  }) async {
    return await repository.publishDelivery(
      originAddreess: originAddreess,
      destinationAddreess: destinationAddreess,
      phoneNumber: phoneNumber,
      userName: userName,
      userId: userId,
      valueOfRun: valueOfRun,
      deliveryDescription: deliveryDescription,
      deliveryDocument: deliveryDocument,
      deliveryReceiver: deliveryReceiver,
    );
  }
}
