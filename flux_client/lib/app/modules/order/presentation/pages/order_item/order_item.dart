import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flux_client/app/core/core.dart';
import 'package:flux_client/app/modules/order/presentation/pages/order_item/order_item_store.dart';
import 'package:flux_client/app/shared/modules/auth/data/repositories/auth_repository_impl.dart';
import 'package:flux_client/app/shared/preferences/config.dart';
import 'package:flux_client/app/shared/widgets/app_bar/app_bar_widget.dart';
import 'package:flux_client/app/shared/widgets/primary_button/primary_button_widget.dart';
import 'package:flux_client/app/shared/widgets/secondary_button/secondary_button_widget.dart';

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
          Observer(
            builder: (_) => controller.loading
                ? CircularProgressIndicator()
                : Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppSizes.s16),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.network(
                              Config.urlImagePackage,
                              height: AppSizes.s64,
                              fit: BoxFit.cover,
                            ),
                            Column(
                              children: [
                                Text(widget.orderId
                                    .simplifyCodeId()
                                    .toUpperCase()),
                                Text(controller.delivery!.createdAt!
                                    .dateFormat()),
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                  "Origem: ${controller.delivery!.originAddress!}"),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: AppSizes.s16,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                  "Destino: ${controller.delivery!.destinationAddress!}"),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: AppSizes.s16,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                  "Remetente: ${controller.delivery!.userName!}"),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: AppSizes.s16,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                  "Destinatário: ${controller.delivery!.deliveryReceiver!}"),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: AppSizes.s16,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                  "Valor da Corrida: ${controller.delivery!.valueOfRun!.reais()}"),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: AppSizes.s16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            PrimaryButtonWidget(
                                onPress: () {}, text: "Rastrear"),
                            SizedBox(
                              width: AppSizes.s16,
                            ),
                            SecondaryButtonWidget(
                                onPress: () {
                                  controller.removeDelivery(
                                      deliveryId:
                                          controller.delivery!.deliveryId!,
                                      userId: auth.userModel!.id!);
                                },
                                text: "Remover")
                          ],
                        ),
                      ],
                    ),
                  ),
          )
        ],
      ),
    );
  }
}
