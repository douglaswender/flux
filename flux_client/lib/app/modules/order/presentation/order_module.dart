import 'package:flutter_modular/flutter_modular.dart';
import 'order_store.dart';
import 'widgets/filter_buttons/filter_buttons_store.dart';

import 'order_page.dart';

class OrderModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => OrderStore()),
    Bind((i) => FilterButtonStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => OrderPage()),
  ];
}
