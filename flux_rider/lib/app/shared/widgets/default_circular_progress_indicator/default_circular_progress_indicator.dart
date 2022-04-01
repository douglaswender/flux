import 'package:flutter/material.dart';
import '../../../core/core.dart';

class DefaultProgressIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(AppColors.black),
    );
  }
}
