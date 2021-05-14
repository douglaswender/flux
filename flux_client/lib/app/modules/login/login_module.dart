import 'package:flutter_modular/flutter_modular.dart';
import 'package:flux_client/app/modules/login/presentation/login_page.dart';
import 'package:flux_client/app/modules/login/presentation/login_store.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => LoginStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => LoginPage()),
  ];
}
