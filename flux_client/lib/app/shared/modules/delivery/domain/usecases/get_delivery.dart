import 'package:dartz/dartz.dart';
import 'package:flux_client/app/core/errors/failure.dart';
import 'package:flux_client/app/shared/modules/delivery/data/models/delivery_model.dart';
import 'package:flux_client/app/shared/modules/delivery/domain/repositories/delivery_repository.dart';

class GetDelivery {
  final DeliveryRepository repository;

  GetDelivery({required this.repository});

  Future<Either<Failure, DeliveryModel>> call({
    required String deliveryId,
    required String userId,
  }) async {
    return await repository.getDelivery(
      deliveryId: deliveryId,
      userId: userId,
    );
  }
}
