import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../repositories/delivery_repository.dart';

class DeleteDelivery {
  final DeliveryRepository repository;

  DeleteDelivery({required this.repository});

  Future<Either<Failure, bool>> call({
    required String deliveryId,
    required String userId,
  }) async {
    return await repository.deleteDelivery(
      deliveryId: deliveryId,
      userId: userId,
    );
  }
}
