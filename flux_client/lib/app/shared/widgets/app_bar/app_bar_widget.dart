import 'package:flutter/material.dart';
import 'package:flux_client/app/core/styles/app_images.dart';
import 'package:flux_client/app/core/styles/app_sizes.dart';

class AppBarDefault extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onTap;
  final bool isBackButton;
  const AppBarDefault({
    Key? key,
    required this.onTap,
    this.isBackButton = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Image.asset(
        AppImages.logoLine,
        height: AppSizes.s32,
      ),
      leading: GestureDetector(
        onTap: onTap,
        child: Icon(
          isBackButton ? Icons.arrow_back_ios_new : Icons.menu,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppSizes.s56);
}
