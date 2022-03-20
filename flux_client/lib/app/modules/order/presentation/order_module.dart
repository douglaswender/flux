import 'package:flutter_modular/flutter_modular.dart';
import 'package:flux_client/app/modules/order/presentation/pages/order_item/order_item.dart';
import 'package:flux_client/app/modules/order/presentation/pages/order_item/order_item_store.dart';
import 'package:flux_client/app/shared/modules/delivery/domain/repositories/delivery_repository.dart';
import 'package:flux_client/app/shared/modules/delivery/domain/usecases/delete_delivery.dart';
import 'package:flux_client/app/shared/modules/delivery/domain/usecases/get_deliveries.dart';
import 'package:flux_client/app/shared/modules/delivery/domain/usecases/get_delivery.dart';
import 'order_store.dart';
import 'widgets/filter_buttons/filter_buttons_store.dart';

import 'order_page.dart';

class OrderModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => OrderStore()),
    Bind((i) => OrderItemStore()),
    Bind((i) => FilterButtonStore()),

    //! Usecases
    Bind((i) => GetDelivery(repository: i<DeliveryRepository>())),
    Bind((i) => GetDeliveries(repository: i<DeliveryRepository>())),
    Bind((i) => DeleteDelivery(repository: i<DeliveryRepository>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => OrderPage()),
    ChildRoute('/order',
        child: (_, args) => OrderItem(
              orderId: args.data['order_id'],
            ))
  ];
}
