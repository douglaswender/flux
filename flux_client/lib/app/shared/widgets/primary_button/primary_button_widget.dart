import 'package:flutter/material.dart';
import 'package:flux_client/app/core/core.dart';

class PrimaryButtonWidget extends StatelessWidget {
  final VoidCallback? onPress;
  final String text;
  final double? width;

  const PrimaryButtonWidget({
    Key? key,
    required this.onPress,
    required this.text,
    this.width,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: width ?? double.maxFinite,
      child: (onPress != null)
          ? ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: AppColors.black,
                textStyle: AppTextStyles.buttonPrimary,
              ),
              onPressed: onPress,
              child: Text(text.toUpperCase()),
            )
          : ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: AppColors.black,
                textStyle: AppTextStyles.buttonPrimary,
              ),
              onPressed: null,
              child: Text(text.toUpperCase()),
            ),
    );
  }
}
