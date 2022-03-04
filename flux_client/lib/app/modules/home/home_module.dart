import 'package:flutter_modular/flutter_modular.dart';
import 'package:flux_client/app/shared/modules/delivery/domain/usecases/publish_delivery.dart';
import 'presentation/home_page.dart';
import 'presentation/home_store.dart';
import 'presentation/pages/search_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeStore()),

    //? UseCases
    Bind((i) => PublishDelivery(repository: i()))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (context, args) => HomePage()),
    ChildRoute('/search_page',
        child: (context, args) => SearchPage(
              addressInputType: args.data['addressInputType'],
            )),
  ];
}
