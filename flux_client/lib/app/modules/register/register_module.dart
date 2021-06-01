import 'package:flutter_modular/flutter_modular.dart';
import 'package:flux_client/app/modules/register/presentation/register_page.dart';
import 'package:flux_client/app/modules/register/presentation/register_store.dart';
import 'package:flux_client/app/shared/modules/auth/domain/usecases/sing_up_with_email_and_password.dart';

class RegisterModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => RegisterStore()),

    //? UseCases
    Bind((i) => SignUpWithEmailAndPassword(repository: i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => RegisterPage()),
  ];
}
