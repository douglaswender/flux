import 'package:mobx/mobx.dart';

part 'filter_buttons_store.g.dart';

class FilterButtonStore = _FilterButtonStoreBase with _$FilterButtonStore;

abstract class _FilterButtonStoreBase with Store {
  @observable
  int index = 10;

  @action
  void setIndex(int newIndex) {
    if (newIndex != index) {
      index = newIndex;
    }
  }

  @action
  void clearIndex() {
    index = 10;
  }
}
