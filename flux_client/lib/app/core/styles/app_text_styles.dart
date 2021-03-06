import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyles {
  static final TextStyle heading36 = GoogleFonts.roboto(
      color: AppColors.black, fontSize: 36, fontWeight: FontWeight.bold);

  static final TextStyle title = GoogleFonts.roboto(
      color: AppColors.black, fontSize: 16, fontWeight: FontWeight.w400);

  static final TextStyle titleSecondary = GoogleFonts.roboto(
      color: AppColors.white, fontSize: 16, fontWeight: FontWeight.w400);

  static final TextStyle buttonPrimary = GoogleFonts.roboto(
      color: AppColors.white, fontSize: 14, fontWeight: FontWeight.w900);

  static final TextStyle buttonSecondary = GoogleFonts.roboto(
      color: AppColors.black, fontSize: 14, fontWeight: FontWeight.w900);

  static final TextStyle body = GoogleFonts.roboto(
      color: AppColors.black, fontSize: 14, fontWeight: FontWeight.w400);

  static final TextStyle bodySecondary = GoogleFonts.roboto(
      color: AppColors.grey, fontSize: 14, fontWeight: FontWeight.w400);

  static final TextStyle bodyMarker = GoogleFonts.roboto(
      color: AppColors.darkGreen, fontSize: 14, fontWeight: FontWeight.bold);
}
