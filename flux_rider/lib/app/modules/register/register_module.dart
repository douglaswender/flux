import 'package:flutter_modular/flutter_modular.dart';
import 'presentation/register_page.dart';
import 'presentation/register_store.dart';
import '../../shared/modules/auth/domain/usecases/register_user.dart';

class RegisterModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => RegisterStore()),

    //? Repository

    //? UseCases
    Bind((i) => RegisterUser(repository: i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => RegisterPage()),
  ];
}
