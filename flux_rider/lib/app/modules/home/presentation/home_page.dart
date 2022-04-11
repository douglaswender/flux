import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flux_rider/app/modules/home/presentation/home_store.dart';
import 'package:flux_rider/app/modules/home/presentation/widgets/order_item/order_item_widget.dart';

import '../../../core/styles/app_sizes.dart';
import '../../../shared/modules/delivery/data/models/delivery_model.dart';
import '../../../shared/widgets/app_bar/app_bar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault(
        onTap: () {
          Modular.to.pushNamed('/menu');
        },
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
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        child: Column(
                          children: [
                            for (DeliveryModel item
                                in controller.listOrderItens!)
                              Column(
                                children: [
                                  SizedBox(
                                    height: AppSizes.s16,
                                  ),
                                  OrderItemWidget(delivery: item)
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
