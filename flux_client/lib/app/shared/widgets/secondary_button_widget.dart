import 'package:flutter/material.dart';
import 'package:flux_client/app/core/core.dart';

class SecondaryButtonWidget extends StatelessWidget {
  final VoidCallback onPress;
  final String text;

  const SecondaryButtonWidget(
      {Key? key, required this.onPress, required this.text})
      : super(key: key);

  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: AppColors.lightWhite,
            textStyle: AppTextStyles.buttonSecondary,
            side: BorderSide(color: AppColors.black, width: 2)),
        onPressed: onPress,
        child: Text(
          text.toUpperCase(),
          style: TextStyle(color: AppColors.black),
        ),
      ),
    );
  }
}
