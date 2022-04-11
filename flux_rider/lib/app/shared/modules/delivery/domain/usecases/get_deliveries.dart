import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../../data/models/delivery_model.dart';
import '../repositories/delivery_repository.dart';

class GetDeliveries {
  final DeliveryRepository repository;

  GetDeliveries({required this.repository});

  Future<Either<Failure, List<DeliveryModel>>> call({
    required String userId,
  }) async {
    return await repository.getDeliveries(
      userId: userId,
    );
  }
}
