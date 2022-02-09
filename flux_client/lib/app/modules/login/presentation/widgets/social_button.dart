import 'package:flutter/material.dart';
import '../../../../core/core.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialButton extends StatelessWidget {
  final VoidCallback? onPress;
  final String text;
  const SocialButton({Key? key, this.onPress, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: AppColors.grey,
          textStyle: AppTextStyles.buttonPrimary,
        ),
        onPressed: onPress,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Center(
                child: FaIcon(FontAwesomeIcons.google),
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                text.toUpperCase(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
