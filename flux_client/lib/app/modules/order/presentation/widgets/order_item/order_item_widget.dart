import 'package:flutter/material.dart';
import 'package:flux_client/app/core/core.dart';

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
    );
  }
}
