import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flux_client/app/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flux_client/app/modules/order/presentation/widgets/filter_buttons/filter_buttons_widget.dart';
import 'package:flux_client/app/modules/order/presentation/widgets/order_item/order_item_widget.dart';

import 'package:flux_client/app/shared/widgets/app_bar/app_bar_widget.dart';
import 'package:flux_client/app/shared/widgets/soft_button/soft_button_model.dart';

import 'order_store.dart';

class OrderPage extends StatefulWidget {
  final String title;
  const OrderPage({Key? key, this.title = 'OrderPage'}) : super(key: key);
  @override
  OrderPageState createState() => OrderPageState();
}

class OrderPageState extends State<OrderPage> {
  final OrderStore store = Modular.get();
  int currentIndex = 0;

  final listOrderItens = [
    OrderItemWidget(),
    OrderItemWidget(),
    OrderItemWidget(),
    OrderItemWidget(),
    OrderItemWidget(),
    OrderItemWidget(),
  ];
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
                FilterButtons(
                  iconButtonAction: () {},
                  softButtonsModels: [
                    SoftButtonModel(
                        label: 'entregue',
                        onTap: () {
                          print("olá, vim do model");
                        }),
                    SoftButtonModel(label: 'publicado'),
                    SoftButtonModel(label: 'enviado'),
                  ],
                ),
                SizedBox(
                  height: AppSizes.s16,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      child: Column(
                        children: [
                          for (OrderItemWidget item in listOrderItens)
                            Column(
                              children: [
                                SizedBox(
                                  height: AppSizes.s16,
                                ),
                                item
                              ],
                            )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
