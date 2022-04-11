import 'package:flutter_modular/flutter_modular.dart';
import 'presentation/login_page.dart';
import 'presentation/login_store.dart';
import '../../shared/modules/auth/domain/usecases/sing_in_with_email_and_password.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => LoginStore()),

    //? UseCases
    Bind((i) => SignInWithEmailAndPassword(repository: i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => LoginPage()),
  ];
}
