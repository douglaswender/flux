import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flux_client/app/shared/modules/delivery/data/models/delivery_model.dart';
import '../../../core/core.dart';
import 'package:flutter/material.dart';
import 'widgets/order_item/order_item_widget.dart';

import '../../../shared/widgets/app_bar/app_bar_widget.dart';

import 'order_store.dart';

class OrderPage extends StatefulWidget {
  final String title;
  const OrderPage({Key? key, this.title = 'OrderPage'}) : super(key: key);
  @override
  OrderPageState createState() => OrderPageState();
}

class OrderPageState extends ModularState<OrderPage, OrderStore> {
  // final listOrderItens = [
  //   OrderItemWidget(),
  //   OrderItemWidget(),
  //   OrderItemWidget(),
  //   OrderItemWidget(),
  //   OrderItemWidget(),
  //   OrderItemWidget(),
  // ];

  @override
  void initState() {
    super.initState();
    controller.getUserDeliveries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault(
        isBackButton: true,
        onTap: () => Modular.to.pop(),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.s16),
          child: Observer(
            builder: (_) => Column(
              children: <Widget>[
                // FilterButtons(
                //   iconButtonAction: () {},
                //   softButtonsModels: [
                //     SoftButtonModel(
                //         label: '✅',
                //         onTap: () {
                //           print("olá, vim do model");
                //         }),
                //     SoftButtonModel(label: '🏠'),
                //     SoftButtonModel(label: '🚗'),
                //   ],
                // ),
                SizedBox(
                  height: AppSizes.s16,
                ),
                if (!controller.loading)
                  controller.listOrderItens != null
                      ? Expanded(
                          child: RefreshIndicator(
                              onRefresh: () async {
                                print('refreshing');
                                controller.getUserDeliveries();
                              },
                              child: Expanded(
                                child: ListView.builder(
                                    itemCount:
                                        controller.listOrderItens!.length,
                                    itemBuilder: (_, int index) {
                                      return Column(
                                        children: [
                                          OrderItemWidget(
                                              delivery: controller
                                                  .listOrderItens![index]),
                                          SizedBox(
                                            height: AppSizes.s8,
                                          )
                                        ],
                                      );
                                    }),
                              )
                              // Column(
                              //   children: [
                              //     for (DeliveryModel item
                              //         in controller.listOrderItens!)
                              //       Column(
                              //         children: [
                              //           OrderItemWidget(delivery: item),
                              //           SizedBox(
                              //             height: AppSizes.s8,
                              //           )
                              //         ],
                              //       ),
                              //  ],
                              //),
                              ),
                        )
                      : Text("não há encomendas"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
