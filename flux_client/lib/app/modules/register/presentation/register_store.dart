import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flux_client/app/core/errors/errors.dart';
import 'package:flux_client/app/shared/modules/auth/domain/entities/user.dart';
import 'package:flux_client/app/shared/modules/auth/domain/usecases/usecases.dart';
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
    //Future.delayed(Duration(seconds: 4), () => loading = false);
    SignUpWithEmailAndPassword userOrFailure = Modular.get();
    Either<Failure, User> response =
        await userOrFailure(email: email, password: password, name: name);
    if (password != confirmPassword) {
      print('please complete');
      passwordNotMatch = true;
      print(response);
    } else {
      print('hello');
    }
  }
}
