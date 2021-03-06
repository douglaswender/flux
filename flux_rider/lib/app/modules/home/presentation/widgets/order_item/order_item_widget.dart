import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../core/core.dart';
import '../../../../../shared/modules/delivery/data/models/delivery_model.dart';
import '../../../../../shared/preferences/config.dart';
import '../../home_store.dart';

class OrderItemWidget extends StatefulWidget {
  final DeliveryModel delivery;
  const OrderItemWidget({Key? key, required this.delivery}) : super(key: key);

  @override
  _OrderItemWidgetState createState() => _OrderItemWidgetState();
}

class _OrderItemWidgetState extends State<OrderItemWidget> {
  final homeStore = Modular.get<HomeStore>();
  String? driverName;
  String? status;

  @override
  void initState() {
    if (widget.delivery.driverId == 'waiting') {
      driverName = 'A definir';

      //status possíveis
      //postado
      //a caminho
      //enviado
      //entregue

      status = 'Postado';
    } else {
      driverName = widget.delivery.driverName;
      if (widget.delivery.status == 'finished') {
        status = 'Entregue';
      } else {
        status = 'Você é responsável!';
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        print(widget.delivery.deliveryId);
        await Modular.to.pushNamed('/order', arguments: {
          "order_id": widget.delivery.deliveryId,
          "user_id": widget.delivery.userId,
        }).then((value) => homeStore.getAllDeliveries());
      },
      child: Container(
        height: AppSizes.s128,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(6)),
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: AppSizes.s128,
                width: AppSizes.s128,
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(color: Colors.black, width: 2),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(AppSizes.s8),
                  child: Image.network(
                    Config.urlImagePackage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.all(AppSizes.s8),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "CÓD.: " +
                            "${widget.delivery.deliveryId}"
                                .toUpperCase()
                                .simplifyCodeId(),
                        style: AppTextStyles.title,
                      ),
                      SizedBox(
                        height: AppSizes.s8,
                      ),
                      Text(
                        "${widget.delivery.deliveryDescription!.toLowerCase()}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.body,
                      ),
                      SizedBox(
                        height: AppSizes.s8,
                      ),
                      if (widget.delivery.driverId != 'waiting')
                        Text(
                          "Motorista: ${driverName!.toUpperCase()}",
                          overflow: TextOverflow.clip,
                          style: AppTextStyles.body,
                        ),
                      Text(
                        "Destinatário: ${widget.delivery.deliveryReceiver!.toUpperCase()}",
                        overflow: TextOverflow.clip,
                        style: AppTextStyles.body,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "$status".toUpperCase(),
                            overflow: TextOverflow.clip,
                            style: AppTextStyles.body,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
