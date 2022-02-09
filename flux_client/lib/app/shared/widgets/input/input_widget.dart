import 'package:flutter/material.dart';
import '../../../core/core.dart';

class InputWidget extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final void Function(String)? onChange;
  final String? type;
  final bool? isPassword;
  final bool? isCapitalization;
  final TextInputAction? textInputAction;
  final VoidCallback? onTap;
  final FocusNode? focusNode;
  final bool readOnly;
  final String? Function(String?)? validator;

  InputWidget({
    Key? key,
    required this.label,
    this.controller,
    this.type = "normal",
    this.isPassword = false,
    this.onChange,
    this.isCapitalization = false,
    this.textInputAction = TextInputAction.done,
    this.onTap,
    this.focusNode,
    this.readOnly = false,
    this.validator,
  }) : assert(['normal', 'email', 'number'].contains(type));

  final keyBoard = {
    'normal': TextInputType.text,
    'email': TextInputType.emailAddress,
    'number': TextInputType.number
  };

  TextInputType get keyboardType => keyBoard[type]!;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      focusNode: focusNode,
      onTap: onTap,
      textInputAction: textInputAction,
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
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.black, width: 2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.black, width: 2),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.black, width: 2),
        ),
        labelText: label,
        labelStyle: AppTextStyles.body,
      ),
      obscureText: isPassword ?? false,
      readOnly: readOnly,
    );
  }
}
