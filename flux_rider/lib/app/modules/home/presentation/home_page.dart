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
  void initState() {
    controller.getAllDeliveries();
    super.initState();
  }

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
                //         label: 'โ',
                //         onTap: () {
                //           print("olรก, vim do model");
                //         }),
                //     SoftButtonModel(label: '๐ '),
                //     SoftButtonModel(label: '๐'),
                //   ],
                // ),
                SizedBox(
                  height: AppSizes.s16,
                ),
                if (!controller.loading)
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: () async {
                        print('refreshing');
                        controller.getAllDeliveries();
                      },
                      child: Expanded(
                        child: ListView.builder(
                            itemCount: controller.listOrderItens!.length,
                            itemBuilder: (_, int index) {
                              return Column(
                                children: [
                                  SizedBox(
                                    height: AppSizes.s16,
                                  ),
                                  OrderItemWidget(
                                      delivery:
                                          controller.listOrderItens![index])
                                ],
                              );
                            }),
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
