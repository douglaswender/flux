import 'package:mobx/mobx.dart';

part 'order_store.g.dart';

class OrderStore = _OrderStoreBase with _$OrderStore;

abstract class _OrderStoreBase with Store {
  @observable
  int index = 10;

  @action
  void setIndex(int newIndex) {
    if (newIndex != index) {
      index = newIndex;
    }
  }
}
