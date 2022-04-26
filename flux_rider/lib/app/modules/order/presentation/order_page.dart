import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:flux_rider/app/core/core.dart';
import 'package:flux_rider/app/modules/order/presentation/order_store.dart';
import 'package:flux_rider/app/shared/modules/delivery/domain/usecases/set_delivery_concluded.dart';
import 'package:map_launcher/map_launcher.dart';

import '../../../shared/modules/auth/data/repositories/auth_repository_impl.dart';
import '../../../shared/preferences/config.dart';
import '../../../shared/widgets/app_bar/app_bar_widget.dart';
import '../../../shared/widgets/primary_button/primary_button_widget.dart';
import '../../../shared/widgets/secondary_button/secondary_button_widget.dart';

class OrderPage extends StatefulWidget {
  final String deliveryId;
  final String userId;
  const OrderPage({
    Key? key,
    required this.deliveryId,
    required this.userId,
  }) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderItemState();
}

class _OrderItemState extends ModularState<OrderPage, OrderStore> {
  final auth = Modular.get<AuthRepositoryImpl>();
  final setDeliveryConcluded = Modular.get<SetDeliveryConcluded>();
  @override
  void initState() {
    super.initState();
    controller.getInfos(
      deliveryId: widget.deliveryId,
      userId: widget.userId,
    );
    print(widget.deliveryId);
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
                                Text(widget.deliveryId
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
                                onPress: () async {
                                  final availableMaps =
                                      await MapLauncher.installedMaps;
                                  print(
                                      availableMaps); // [AvailableMap { mapName: Google Maps, mapType: google }, ...]

                                  controller.getDeliveryForDriver(
                                      deliveryId:
                                          controller.delivery!.deliveryId!,
                                      userId: widget.userId);

                                  await availableMaps.first.showMarker(
                                    coords: Coords(
                                      controller
                                          .delivery!.originLocation!.latitude!,
                                      controller
                                          .delivery!.originLocation!.longitude!,
                                    ),
                                    title:
                                        "Corrida de ${controller.delivery!.userName}",
                                  );
                                },
                                text: "Buscar"),
                            SizedBox(
                              width: AppSizes.s16,
                            ),
                            SecondaryButtonWidget(
                                onPress: () async {
                                  final availableMaps =
                                      await MapLauncher.installedMaps;
                                  print(availableMaps);

                                  await availableMaps.first
                                      .showMarker(
                                        coords: Coords(
                                          controller.delivery!
                                              .destinationLocation!.latitude!,
                                          controller.delivery!
                                              .destinationLocation!.longitude!,
                                        ),
                                        title:
                                            "Corrida de ${controller.delivery!.userName}",
                                      )
                                      .then((value) => showModalBottomSheet(
                                          context: context,
                                          builder: (_) => Container(
                                                height: 200,
                                                child: Expanded(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Text(
                                                          "A corrida foi finalizada?"),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          ElevatedButton(
                                                              onPressed: () {
                                                                Modular.to
                                                                    .pop();
                                                                setDeliveryConcluded(
                                                                    deliveryId: controller
                                                                        .delivery!
                                                                        .deliveryId!,
                                                                    userId: controller
                                                                        .delivery!
                                                                        .userId!);
                                                                Modular.to
                                                                    .pop();
                                                              },
                                                              child:
                                                                  Text('Sim')),
                                                          ElevatedButton(
                                                              onPressed: () {
                                                                Modular.to
                                                                    .pop();
                                                              },
                                                              child:
                                                                  Text('Não'))
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )));
                                },
                                text: "Levar")
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
