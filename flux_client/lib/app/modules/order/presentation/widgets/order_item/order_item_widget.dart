import 'package:flutter/material.dart';
import 'package:flux_client/app/core/core.dart';
import 'package:flux_client/app/shared/preferences/config.dart';

class OrderItemWidget extends StatefulWidget {
  const OrderItemWidget({Key? key}) : super(key: key);

  @override
  _OrderItemWidgetState createState() => _OrderItemWidgetState();
}

class _OrderItemWidgetState extends State<OrderItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                      "encomenda nº 0002".toUpperCase(),
                      style: AppTextStyles.title,
                    ),
                    SizedBox(
                      height: AppSizes.s8,
                    ),
                    Text(
                      "Objeto de porte pequeno com destino a Ji-Paraná.",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.body,
                    ),
                    SizedBox(
                      height: AppSizes.s8,
                    ),
                    Text(
                      "Motorista: Mathias",
                      overflow: TextOverflow.clip,
                      style: AppTextStyles.body,
                    ),
                    Text(
                      "Destinatário: Neide",
                      overflow: TextOverflow.clip,
                      style: AppTextStyles.body,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "enviado".toUpperCase(),
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
    );
  }
}
