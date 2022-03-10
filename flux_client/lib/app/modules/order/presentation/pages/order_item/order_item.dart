import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flux_client/app/modules/order/presentation/pages/order_item/order_item_store.dart';
import 'package:flux_client/app/shared/modules/auth/data/repositories/auth_repository_impl.dart';
import 'package:flux_client/app/shared/widgets/app_bar/app_bar_widget.dart';

import '../../../../../shared/shared.dart';

class OrderItem extends StatefulWidget {
  final String orderId;
  const OrderItem({Key? key, required this.orderId}) : super(key: key);

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends ModularState<OrderItem, OrderItemStore> {
  final auth = Modular.get<AuthRepositoryImpl>();
  @override
  void initState() {
    super.initState();
    controller.getInfos(
      deliveryId: widget.orderId,
      userId: auth.userModel!.id!,
    );
    print(widget.orderId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault(
        isBackButton: true,
        onTap: () => Modular.to.pop(),
      ),
      body: Column(
        children: [
          Center(
            child: Text(widget.orderId),
          ),
          Observer(
            builder: (_) => controller.loading
                ? CircularProgressIndicator()
                : Column(
                    children: [
                      Text(controller.delivery!.createdAt!),
                      Text(controller.delivery!.destinationAddress!),
                      Text(controller.delivery!.driverId!),
                      Text(controller.delivery!.originAddress!),
                      Text(controller.delivery!.userId!),
                      Text(controller.delivery!.userName!),
                      Text(controller.delivery!.valueOfRun!.reais())
                    ],
                  ),
          )
        ],
      ),
    );
  }
}
