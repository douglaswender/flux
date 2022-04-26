import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../repositories/delivery_repository.dart';

class SetDeliveryConcluded {
  final DeliveryRepository repository;

  SetDeliveryConcluded({required this.repository});

  Future<Either<Failure, bool>> call({
    required String deliveryId,
    required String userId,
  }) async {
    return await repository.setDeliveryConcluded(
      deliveryId: deliveryId,
      userId: userId,
    );
  }
}
