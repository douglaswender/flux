import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../shared/modules/auth/data/repositories/auth_repository_impl.dart';
import '../../../shared/modules/delivery/data/models/delivery_model.dart';
import '../../../shared/modules/delivery/domain/usecases/get_deliveries.dart';
part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  @observable
  List<DeliveryModel>? listOrderItens;

  @observable
  bool loading = true;

  @action
  getAllDeliveries() async {
    loading = true;
    final auth = Modular.get<AuthRepositoryImpl>();
    final getDeliveries = Modular.get<GetDeliveries>();
    final response = await getDeliveries(userId: auth.userModel!.id!);

    loading = false;

    response.fold((l) => null, (r) => listOrderItens = r);
  }
}
