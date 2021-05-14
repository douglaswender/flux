import 'package:flutter/material.dart';
import 'package:flux_client/app/core/app_colors.dart';
import 'package:flux_client/app/core/core.dart';

class PrimaryButtonWidget extends StatelessWidget {
  final VoidCallback onPress;
  final String text;

  const PrimaryButtonWidget(
      {Key? key, required this.onPress, required this.text})
      : super(key: key);

  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: AppColors.black, textStyle: AppTextStyles.buttonPrimary),
      onPressed: onPress,
      child: Text(text.toUpperCase()),
    );
  }
}
