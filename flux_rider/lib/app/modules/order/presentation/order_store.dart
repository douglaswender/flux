import 'package:flutter_modular/flutter_modular.dart';

import 'package:mobx/mobx.dart';

import '../../../shared/modules/delivery/data/models/delivery_model.dart';
import '../../../shared/modules/delivery/domain/usecases/get_delivery_for_driver.dart';
import '../../../shared/modules/delivery/domain/usecases/get_delivery.dart';

part 'order_store.g.dart';

class OrderStore = _OrderStoreBase with _$OrderStore;

abstract class _OrderStoreBase with Store {
  @observable
  bool loading = true;

  @observable
  DeliveryModel? delivery;

  @action
  getInfos({required String deliveryId, required String userId}) async {
    final getDeliveryInfos = Modular.get<GetDelivery>();

    final response = await getDeliveryInfos(
      deliveryId: deliveryId,
      userId: userId,
    );

    response.fold((l) => print(l), (r) => delivery = r);
    loading = false;
  }

  @action
  getDeliveryForDriver(
      {required String deliveryId, required String userId}) async {
    loading = true;

    final getDeliveryForDriver = Modular.get<GetDeliveryForDriver>();

    await getDeliveryForDriver(
      deliveryId: deliveryId,
      userId: userId,
    );

    await Future.delayed(Duration(seconds: 2));

    loading = false;
  }
}
