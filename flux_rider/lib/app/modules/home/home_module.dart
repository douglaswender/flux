import 'package:flutter_modular/flutter_modular.dart';
import 'package:flux_rider/app/modules/home/presentation/home_page.dart';
import 'package:flux_rider/app/modules/home/presentation/home_store.dart';

import '../../shared/modules/auth/domain/usecases/sing_in_with_email_and_password.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeStore()),

    //? UseCases
    Bind((i) => SignInWithEmailAndPassword(repository: i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => HomePage()),
  ];
}
