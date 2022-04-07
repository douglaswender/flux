import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flux_rider/app/shared/modules/auth/domain/entities/user.dart';
import 'package:flux_rider/app/shared/modules/auth/domain/usecases/usecases.dart';

import '../../../core/errors/errors.dart';

import 'package:mobx/mobx.dart';

import '../../../shared/modules/auth/data/models/user_model.dart';

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
  String phoneNumber = "";

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
    RegisterUser register = Modular.get<RegisterUser>();
    UserModel user =
        UserModel(email: email, name: name, phoneNumber: phoneNumber);
    if (password != confirmPassword) {
      print('please complete');
      passwordNotMatch = true;
      loading = false;
    } else {
      Either<Failure, User> response =
          await register(password: password, user: user);
      print(response);

      Modular.to.pop();
    }
  }
}
