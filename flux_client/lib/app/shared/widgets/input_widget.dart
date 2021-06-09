import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flux_client/app/core/core.dart';

class InputWidget extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final void Function(String)? onChange;
  final String? type;
  final bool? isPassword;
  final bool? isCapitalization;

  InputWidget({
    Key? key,
    required this.label,
    this.controller,
    this.type = "normal",
    this.isPassword = false,
    this.onChange,
    this.isCapitalization = false,
  }) : assert(['normal', 'email', 'number'].contains(type));

  final keyBoard = {
    'normal': TextInputType.text,
    'email': TextInputType.emailAddress,
    'number': TextInputType.number
  };

  TextInputType get keyboardType => keyBoard[type]!;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      controller: controller,
      onChanged: onChange,
      textCapitalization: isCapitalization!
          ? TextCapitalization.words
          : TextCapitalization.none,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.black, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.black, width: 2),
        ),
        labelText: label,
        labelStyle: AppTextStyles.body,
      ),
      obscureText: isPassword ?? false,
    );
  }
}
