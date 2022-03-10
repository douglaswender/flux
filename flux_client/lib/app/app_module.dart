import 'package:connectivity/connectivity.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flux_client/app/shared/modules/delivery/data/datasource/delivery_datasource.dart';
import 'package:flux_client/app/shared/modules/delivery/data/repositories/delivery_repository_impl.dart';
import 'core/network/network_info.dart';
import 'modules/config/presentation/config_page.dart';
import 'modules/home/home_module.dart';
import 'modules/login/login_module.dart';
import 'modules/menu/presentation/menu_page.dart';
import 'modules/order/presentation/order_module.dart';
import 'modules/register/register_module.dart';
import 'shared/modules/auth/data/datasource/remote_data_source.dart';
import 'shared/modules/auth/data/repositories/auth_repository_impl.dart';
import 'shared/modules/auth/domain/usecases/usecases.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    //* External
    Bind((i) => Connectivity()),

    //! Core
    Bind((i) => NetworkInfoImpl(i())),

    //! DataSource
    Bind((i) => RemoteDataSourceImpl()),
    Bind((i) => DeliveryDatasourceImpl()),

    //* Repository
    Bind((i) => AuthRepositoryImpl(
          networkInfo: i(),
          remoteDataSource: i(),
        )),
    Bind((i) => DeliveryRepositoryImpl(
          datasource: i(),
          networkInfo: i(),
        )),

    //? UseCases
    Bind((i) => LogoutUser(repository: i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: LoginModule()),
    ModuleRoute('/login', module: LoginModule()),
    ModuleRoute('/home', module: HomeModule()),
    ModuleRoute('/register', module: RegisterModule()),
    ChildRoute('/menu', child: (context, args) => MenuPage()),
    ChildRoute('/config', child: (context, args) => ConfigPage()),
    ModuleRoute('/orders/', module: OrderModule()),
  ];
}
