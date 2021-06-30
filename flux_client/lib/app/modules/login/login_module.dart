import 'package:flutter_modular/flutter_modular.dart';
import 'package:flux_client/app/modules/login/presentation/login_page.dart';
import 'package:flux_client/app/modules/login/presentation/login_store.dart';
import 'package:flux_client/app/shared/modules/auth/domain/usecases/sign_in_with_google.dart';
import 'package:flux_client/app/shared/modules/auth/domain/usecases/sing_in_with_email_and_password.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => LoginStore()),

    //? UseCases
    Bind((i) => SignInWithEmailAndPassword(repository: i())),
    Bind((i) => SignInWithGoogle(repository: i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => LoginPage()),
  ];
}
