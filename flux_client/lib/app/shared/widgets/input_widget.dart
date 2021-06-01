import 'package:flutter/material.dart';
import 'package:flux_client/app/core/core.dart';

class InputWidget extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final void Function(String)? onChange;
  final String? type;
  final bool? isPassword;

  InputWidget({
    Key? key,
    required this.label,
    required this.controller,
    this.type,
    this.isPassword = false,
    this.onChange,
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
