import 'package:flux_client/app/modules/home/data/models/address_model.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  @observable
  AddressModel pickupAddress = AddressModel();

  @action
  void updatePickupAddress(AddressModel pickup) {
    pickupAddress = pickup;
  }
}
