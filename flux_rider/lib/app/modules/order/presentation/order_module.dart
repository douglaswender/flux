import 'package:flutter_modular/flutter_modular.dart';
import 'package:flux_rider/app/shared/modules/delivery/domain/usecases/set_delivery_concluded.dart';
import '../../../shared/modules/delivery/domain/repositories/delivery_repository.dart';
import '../../../shared/modules/delivery/domain/usecases/get_delivery_for_driver.dart';
import '../../../shared/modules/delivery/domain/usecases/get_deliveries.dart';
import '../../../shared/modules/delivery/domain/usecases/get_delivery.dart';
import 'order_store.dart';
import 'widgets/filter_buttons/filter_buttons_store.dart';

import 'order_page.dart';

class OrderModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => OrderStore()),
    Bind((i) => FilterButtonStore()),

    //! Usecases
    Bind((i) => GetDelivery(repository: i<DeliveryRepository>())),
    Bind((i) => GetDeliveries(repository: i<DeliveryRepository>())),
    Bind((i) => GetDeliveryForDriver(repository: i<DeliveryRepository>())),
    Bind(((i) => SetDeliveryConcluded(repository: i<DeliveryRepository>()))),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/',
        child: (_, args) => OrderPage(
              deliveryId: args.data['order_id'],
              userId: args.data['user_id'],
            )),
  ];
}
