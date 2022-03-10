import 'package:dartz/dartz.dart';
import 'package:flux_client/app/core/errors/failure.dart';
import 'package:flux_client/app/shared/modules/delivery/data/models/delivery_model.dart';
import 'package:flux_client/app/shared/modules/delivery/domain/repositories/delivery_repository.dart';

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
