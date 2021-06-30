import 'package:flutter_modular/flutter_modular.dart';
import 'package:flux_client/app/modules/home/presentation/home_page.dart';
import 'package:flux_client/app/modules/home/presentation/home_store.dart';
import 'package:flux_client/app/modules/home/presentation/widgets/map_widget_store.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeStore()),
    Bind((i) => MapWidgetStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => HomePage()),
  ];
}
