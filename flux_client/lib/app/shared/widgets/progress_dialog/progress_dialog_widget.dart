import 'package:flutter/material.dart';
import '../../../core/core.dart';

class ProgressDialog extends StatelessWidget {
  final String status;
  const ProgressDialog({Key? key, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.width * 0.5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(
              width: AppSizes.s16,
            ),
            Text(
              status,
              style: AppTextStyles.body,
            ),
          ],
        ),
      ),
    );
  }
}
