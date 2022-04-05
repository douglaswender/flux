import 'package:connectivity/connectivity.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flux_rider/screens/main_page.dart';

import 'core/network/network_info.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    //* External
    Bind((i) => Connectivity()),

    //! Core
    Bind((i) => NetworkInfoImpl(i())),

    //! DataSource

    //* Repository

    //? UseCases
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => MainPage()),
  ];
}
