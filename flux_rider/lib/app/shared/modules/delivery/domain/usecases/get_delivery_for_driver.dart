import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../repositories/delivery_repository.dart';

class GetDeliveryForDriver {
  final DeliveryRepository repository;

  GetDeliveryForDriver({required this.repository});

  Future<Either<Failure, bool>> call({
    required String deliveryId,
    required String userId,
  }) async {
    return await repository.getDeliveryForDriver(
      deliveryId: deliveryId,
      userId: userId,
    );
  }
}
