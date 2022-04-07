import 'package:connectivity/connectivity.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flux_rider/app/modules/register/register_module.dart';
import 'package:flux_rider/app/shared/modules/auth/data/datasource/remote_data_source.dart';
import 'package:flux_rider/app/shared/modules/auth/data/repositories/auth_repository_impl.dart';
import 'package:flux_rider/app/shared/modules/auth/domain/usecases/logout.dart';
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
    Bind((i) => RemoteDataSourceImpl()),

    //* Repository
    Bind((i) => AuthRepositoryImpl(
          networkInfo: i(),
          remoteDataSource: i(),
        )),
    //? UseCases
    Bind((i) => LogoutUser(repository: i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: RegisterModule()),
  ];
}
