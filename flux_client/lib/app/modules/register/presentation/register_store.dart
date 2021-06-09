import 'package:mobx/mobx.dart';

part 'register_store.g.dart';

class RegisterStore = _RegisterStoreBase with _$RegisterStore;

abstract class _RegisterStoreBase with Store {
  @observable
  int value = 0;

  @observable
  String email = "";

  @observable
  String name = "";

  @observable
  String password = "";

  @observable
  String confirmPassword = "";

  @observable
  bool passwordNotMatch = false;

  @computed
  bool get fieldsNotNull =>
      email.isNotEmpty &&
      name.isNotEmpty &&
      password.isNotEmpty &&
      confirmPassword.isNotEmpty;

  @action
  void register() {
    print('test');
    if (password != confirmPassword) {
      print('please complete');
      passwordNotMatch = true;
    } else {
      print('hello');
    }
  }
}
