import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTextStyle {
  static TextStyle H1 = GoogleFonts.roboto(fontStyle: FontStyle.normal, fontSize: 64.sp, letterSpacing: 0);
  static TextStyle H2 = GoogleFonts.roboto(fontStyle: FontStyle.normal, fontSize: 40.sp, letterSpacing: 0);
  static TextStyle H3 = GoogleFonts.roboto(fontStyle: FontStyle.normal, fontSize: 36.sp, letterSpacing: 0);
  static TextStyle H4 = GoogleFonts.roboto(fontStyle: FontStyle.normal, fontSize: 28.sp, letterSpacing: 0);
  static TextStyle H5 = GoogleFonts.roboto(fontStyle: FontStyle.normal, fontSize: 24.sp, letterSpacing: 0);
  static TextStyle H6 = GoogleFonts.roboto(fontStyle: FontStyle.normal, fontSize: 21.sp, letterSpacing: 0);
  static TextStyle body1 = GoogleFonts.roboto(fontSize: 16.sp, height: 24.sp / 16.sp);
  static TextStyle body2 = GoogleFonts.roboto(fontSize: 16.sp, height: 24.sp / 16.sp);
  static TextStyle body3 = GoogleFonts.roboto(fontStyle: FontStyle.normal, fontSize: 16.sp, letterSpacing: 0);
  static TextStyle body4 = GoogleFonts.roboto(fontStyle: FontStyle.normal, fontSize: 14.sp, letterSpacing: 0);
  static TextStyle captionLarge =
      GoogleFonts.roboto(fontSize: 16.sp, fontWeight: FontWeight.w500, height: 24.sp / 16.sp, letterSpacing: 0.5);
  static TextStyle captionMedium =
      GoogleFonts.roboto(fontSize: 14.sp, fontWeight: FontWeight.w500, height: 24.sp / 14.sp, letterSpacing: 0.5);
  static TextStyle captionSmall =
      GoogleFonts.roboto(fontSize: 12.sp, fontWeight: FontWeight.w500, height: 18.sp / 12.sp, letterSpacing: 0.5);
  static TextStyle outline = GoogleFonts.roboto(fontStyle: FontStyle.normal, fontSize: 11.sp, letterSpacing: 0);
  static TextStyle button = GoogleFonts.roboto(
      fontSize: 16.sp, fontWeight: FontWeight.w400, height: 24.sp / 16.sp, color: AppColors.greyScale);
}

extension AppThemesExtension on ThemeData {
  TextStyle get BodyText1 => GoogleFonts.roboto(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
      );

  TextStyle get BodyText4 => GoogleFonts.inter(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
      );

  TextStyle get BodyText1Red =>
      GoogleFonts.roboto(fontSize: 16.sp, fontWeight: FontWeight.w400, color: AppColors.primary);

  TextStyle get BodyText1White =>
      GoogleFonts.roboto(fontSize: 16.sp, fontWeight: FontWeight.w400, color: AppColors.neutralsWhite);

  TextStyle get BodyText1GreyScale =>
      GoogleFonts.roboto(fontSize: 16.sp, fontWeight: FontWeight.w300, color: AppColors.greyScale);
  //
  // TextStyle get BodyText2GreyScale =>
  //     GoogleFonts.roboto(fontSize: 16.sp, fontWeight: FontWeight.w300, color: AppColors.greyScale2);

  TextStyle get BodyText1Second =>
      GoogleFonts.roboto(fontSize: 16.sp, fontWeight: FontWeight.w400, color: AppColors.second);

  TextStyle get BodyText1Neutrals500 =>
      GoogleFonts.roboto(fontSize: 16.sp, fontWeight: FontWeight.w400, color: AppColors.neutrals500);

  TextStyle get BodyText2Bold => GoogleFonts.roboto(
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
      );

  TextStyle get TitleStyle => GoogleFonts.roboto(
        fontSize: 18.sp,
        fontWeight: FontWeight.w700,
      );

  TextStyle get ForgotPasswordTextStyle =>
      GoogleFonts.inter(fontSize: 14.sp, fontWeight: FontWeight.w500, color: AppColors.second400);

  TextStyle get heading3 => GoogleFonts.roboto(fontSize: 24.sp, fontWeight: FontWeight.w700, color: AppColors.black);

  TextStyle get labelNavBarStyle =>
      GoogleFonts.roboto(fontSize: 12.sp, fontWeight: FontWeight.w400, color: AppColors.black);

  TextStyle get neutralTextTile =>
      GoogleFonts.roboto(fontSize: 16.sp, fontWeight: FontWeight.w700, color: AppColors.black);

  TextStyle get Subtitle2Medium =>
      GoogleFonts.roboto(fontSize: 15.sp, fontWeight: FontWeight.w500, color: AppColors.status6);

  TextStyle get Subtitle1Medium =>
      GoogleFonts.roboto(fontSize: 15.sp, fontWeight: FontWeight.w700, color: AppColors.status6);
}
