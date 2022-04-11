import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/errors/errors.dart';
import '../../../shared/modules/auth/domain/entities/user.dart';
import '../../../shared/modules/auth/domain/usecases/sing_in_with_email_and_password.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  @observable
  late String email = '';

  @observable
  late String password = '';

  @observable
  bool loading = false;

  @observable
  bool error = false;

  @action
  Future<void> login() async {
    print(email);
    print(password);
    final prefs = await SharedPreferences.getInstance();

    loading = true;
    SignInWithEmailAndPassword signInWithEmailAndPassword = Modular.get();

    Either<Failure, User> response;
    if (prefs.getString('email') == null) {
      response =
          await signInWithEmailAndPassword(email: email, password: password);
      prefs.setString('email', email);
      prefs.setString('password', password);
    } else {
      response = await signInWithEmailAndPassword(
          email: prefs.getString('email')!,
          password: prefs.getString('password')!);
    }

    loading = false;

    if (response.isRight()) {
      Modular.to.navigate('/home/');
    } else {
      error = true;
    }
  }
}
