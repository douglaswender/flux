import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../core/errors/errors.dart';
import '../../../shared/modules/auth/domain/entities/user.dart';
import '../../../shared/modules/auth/domain/usecases/sign_in_with_google.dart';
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
    loading = true;
    SignInWithEmailAndPassword signInWithEmailAndPassword = Modular.get();
    Either<Failure, User> response =
        await signInWithEmailAndPassword(email: email, password: password);
    print(response);
    loading = false;
    if (response.isRight()) {
      Modular.to.navigate('/home');
    } else {
      error = true;
    }
  }

  @action
  Future<void> loginWithGoogle() async {
    SignInWithGoogle signInWithGoogle = Modular.get();

    try {
      Either<Failure, User> response = await signInWithGoogle();
      print(response);
      if (response.isRight()) {
        Modular.to.navigate('/home');
      } else {
        error = true;
      }
    } catch (error) {
      print(error);
    }
  }
}
