import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../../shared/modules/delivery/data/models/delivery_model.dart';
import '../../../../../shared/modules/delivery/domain/usecases/delete_delivery.dart';
import '../../../../../shared/modules/delivery/domain/usecases/get_delivery.dart';
part 'order_item_store.g.dart';

class OrderItemStore = _OrderItemStoreBase with _$OrderItemStore;

abstract class _OrderItemStoreBase with Store {
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
  removeDelivery({required String deliveryId, required String userId}) async {
    loading = true;

    final removeDelivery = Modular.get<DeleteDelivery>();

    await removeDelivery(
      deliveryId: deliveryId,
      userId: userId,
    );

    await Future.delayed(Duration(seconds: 2));

    Modular.to.pop();

    loading = false;
  }
}
