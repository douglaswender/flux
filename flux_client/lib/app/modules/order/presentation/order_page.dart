import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flux_client/app/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flux_client/app/modules/order/presentation/widgets/filter_buttons/filter_buttons_widget.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault(
        isBackButton: true,
        onTap: () => Modular.to.pop(),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: AppSizes.s24,
          ),
          Observer(
            builder: (_) => Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.s16),
              child: FilterButtons(
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
            ),
          ),
        ],
      ),
    );
  }
}
