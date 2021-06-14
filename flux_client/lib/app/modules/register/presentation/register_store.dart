import 'package:mobx/mobx.dart';

part 'register_store.g.dart';

class RegisterStore = _RegisterStoreBase with _$RegisterStore;

abstract class _RegisterStoreBase with Store {
  @observable
  bool loading = false;

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
  Future<void> register() async {
    loading = true;
    print(email);
    print(name);
    print(password);
    Future.delayed(Duration(seconds: 4), () => loading = false);
    if (password != confirmPassword) {
      print('please complete');
      passwordNotMatch = true;
    } else {
      print('hello');
    }
  }
}
