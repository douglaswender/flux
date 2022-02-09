import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../core/styles/app_images.dart';
import '../../../core/styles/app_sizes.dart';

class AppBarDefault extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onTap;
  final bool isBackButton;
  const AppBarDefault({
    Key? key,
    this.onTap,
    this.isBackButton = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      title: Image.asset(
        AppImages.logoLine,
        height: AppSizes.s32,
      ),
      leading: GestureDetector(
        onTap: isBackButton ? () => Modular.to.pop() : onTap,
        child: Icon(
          isBackButton ? Icons.arrow_back_ios_new : Icons.menu,
          color: Colors.black,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppSizes.s56);
}
