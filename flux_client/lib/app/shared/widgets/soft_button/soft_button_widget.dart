import 'package:flutter/material.dart';
import '../primary_button/primary_button_widget.dart';
import '../secondary_button/secondary_button_widget.dart';

class SoftButtonWidget extends StatefulWidget {
  final bool selected;
  final VoidCallback onPress;
  final String text;

  const SoftButtonWidget({
    Key? key,
    required this.selected,
    required this.onPress,
    required this.text,
  }) : super(key: key);

  @override
  _SoftButtonWidgetState createState() => _SoftButtonWidgetState();
}

class _SoftButtonWidgetState extends State<SoftButtonWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget.selected) {
      return PrimaryButtonWidget(
        onPress: widget.onPress,
        text: widget.text,
      );
    } else {
      return SecondaryButtonWidget(
        onPress: widget.onPress,
        text: widget.text,
      );
    }
  }
}
