import 'package:flutter_modular/flutter_modular.dart';
import 'package:flux_client/app/shared/modules/auth/data/repositories/auth_repository_impl.dart';
import 'package:flux_client/app/shared/modules/delivery/data/models/delivery_model.dart';
import 'package:flux_client/app/shared/modules/delivery/domain/usecases/get_deliveries.dart';
import 'package:mobx/mobx.dart';

part 'order_store.g.dart';

class OrderStore = _OrderStoreBase with _$OrderStore;

abstract class _OrderStoreBase with Store {
  @observable
  int index = 10;

  @observable
  List<DeliveryModel>? listOrderItens;

  @observable
  bool loading = true;

  @action
  getUserDeliveries() async {
    loading = true;
    final auth = Modular.get<AuthRepositoryImpl>();
    final getDeliveries = Modular.get<GetDeliveries>();
    final response = await getDeliveries(userId: auth.userModel!.id!);

    loading = false;

    response.fold((l) => null, (r) => listOrderItens = r);
  }
}
