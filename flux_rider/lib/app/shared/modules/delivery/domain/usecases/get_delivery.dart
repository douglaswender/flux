import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../../data/models/delivery_model.dart';
import '../repositories/delivery_repository.dart';

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
