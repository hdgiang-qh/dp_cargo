import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_text_styles.dart';

import 'app_colors.dart';

class AppThemes {
  AppThemes._();

  //Primary
  static const Color _lightPrimaryColor = AppColors.primary;

  //Secondary
  // static const Color _lightSecondaryColor = Color(0xFFd74315);
  // static const Color _darkSecondaryColor = Color(0xFFd74315);

  //Background
  static const Color _lightBackgroundColor = AppColors.backgroundLighter;
  static const Color _darkBackgroundColor = AppColors.backgroundDarker;

  //Text
  static const Color _lightTextColor = AppColors.text_black;
  static const Color _darkTextColor = AppColors.text_white;

  //Border
  // static const Color _lightBorderColor = Colors.grey;
  // static const Color _darkBorderColor = Colors.grey;

  //Icon
  static const Color _lightIconColor = AppColors.text_black;
  static const Color _darkIconColor = AppColors.text_white;

  //Fill
  // static const _lightFillColor = AppColors.black;
  // static const _darkFillColor = AppColors.white;

  //Text themes
  static final TextTheme lightTextTheme = TextTheme(
    displayLarge: AppTextStyle.H1.copyWith(color: _lightTextColor),
    displayMedium: AppTextStyle.H2.copyWith(color: _lightTextColor),
    displaySmall: AppTextStyle.H3.copyWith(color: _lightTextColor),
    headlineMedium: AppTextStyle.H4.copyWith(color: _lightTextColor),
    headlineSmall: AppTextStyle.H5.copyWith(color: _lightTextColor),
    titleLarge: AppTextStyle.H6.copyWith(color: _lightTextColor),
    bodyLarge: AppTextStyle.body1.copyWith(color: _lightTextColor),
    bodyMedium: AppTextStyle.body2.copyWith(color: _lightTextColor),
    bodySmall: AppTextStyle.captionLarge.copyWith(color: _lightTextColor),
    labelLarge: AppTextStyle.button.copyWith(color: _lightTextColor),
    titleMedium: AppTextStyle.body4.copyWith(color: _lightTextColor),
    titleSmall: AppTextStyle.outline.copyWith(color: _lightTextColor),
    labelMedium: AppTextStyle.body3.copyWith(color: _lightTextColor),
  );

  static final TextTheme _dartTextTheme = TextTheme(
    displayLarge: AppTextStyle.H1.copyWith(color: _darkTextColor),
    displayMedium: AppTextStyle.H2.copyWith(color: _darkTextColor),
    displaySmall: AppTextStyle.H3.copyWith(color: _darkTextColor),
    headlineMedium: AppTextStyle.H4.copyWith(color: _darkTextColor),
    headlineSmall: AppTextStyle.H5.copyWith(color: _darkTextColor),
    titleLarge: AppTextStyle.H6.copyWith(color: _darkTextColor),
    bodyLarge: AppTextStyle.body1.copyWith(color: _darkTextColor),
    bodyMedium: AppTextStyle.body2.copyWith(color: _darkTextColor),
    bodySmall: AppTextStyle.captionLarge.copyWith(color: _darkTextColor),
    labelLarge: AppTextStyle.button.copyWith(color: _darkTextColor),
    titleMedium: AppTextStyle.body4.copyWith(color: _darkTextColor),
    titleSmall: AppTextStyle.outline.copyWith(color: _darkTextColor),
    labelMedium: AppTextStyle.body3.copyWith(color: _darkTextColor),
  );

  static final ElevatedButtonThemeData _elevatedButtonThemeData = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: AppColors.text_white,
      backgroundColor: AppColors.primary,
      disabledBackgroundColor: AppColors.primaryDisable,
      disabledForegroundColor: AppColors.text_white,
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      textStyle: AppTextStyle.button.copyWith(fontWeight: FontWeight.w700, height: 1.2),
    ),
  );

  static final OutlinedButtonThemeData _outlinedButtonThemeData = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: AppColors.primary,
      side: const BorderSide(color: AppColors.primary),
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      textStyle: AppTextStyle.button.copyWith(fontWeight: FontWeight.w700, height: 1.2),
    ),
  );

  static final AppBarTheme _appBarTheme = AppBarTheme(
    backgroundColor: AppColors.text_white,
    titleTextStyle: AppTextStyle.body3.copyWith(color: const Color(0xff3E4958)),
    iconTheme: const IconThemeData(
      color: AppColors.text_black,
    ),
    // systemOverlayStyle: const SystemUiOverlayStyle(
    //   statusBarColor: AppColors.text_white,
    //   statusBarIconBrightness: Brightness.dark,
    //   statusBarBrightness: Brightness.dark,
    // ),
  );

  static final BottomNavigationBarThemeData _bottomNavigationBarThemeData = BottomNavigationBarThemeData(
      backgroundColor: AppColors.text_white,
      selectedItemColor: AppColors.primary,
      selectedIconTheme: const IconThemeData(color: AppColors.primary),
      unselectedItemColor: AppColors.text_grey,
      selectedLabelStyle: AppTextStyle.outline.copyWith(color: AppColors.primary.withOpacity(0.1)),
      unselectedLabelStyle: AppTextStyle.outline.copyWith(fontSize: 16));

  static OutlineInputBorder _defaultBorder() {
    return OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide(color: AppColors.lineColor, width: 1));
  }

  static final InputDecorationTheme _inputDecorationLightTheme = InputDecorationTheme(
      isDense: true,
      labelStyle: AppTextStyle.body4.copyWith(color: AppColors.text_black),
      hintStyle: AppTextStyle.body4.copyWith(color: AppColors.text_grey, fontWeight: FontWeight.w400),
      errorStyle: AppTextStyle.body4.copyWith(color: AppColors.errorColor),
      border: _defaultBorder(),
      focusedBorder:
          _defaultBorder().copyWith(borderSide: const BorderSide(color: AppColors.colorPrimarySwatch, width: 1)),
      enabledBorder: _defaultBorder(),
      disabledBorder: _defaultBorder(),
      filled: true,
      fillColor: AppColors.lineColor,
      errorBorder: _defaultBorder().copyWith(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          borderSide: const BorderSide(color: AppColors.errorColor, width: 1)),
      focusedErrorBorder: _defaultBorder().copyWith(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          borderSide: const BorderSide(color: AppColors.errorColor, width: 1)));

  ///Light theme
  static final ThemeData lightTheme = ThemeData(
      useMaterial3: false,
      brightness: Brightness.light,
      fontFamily: 'Inter',
      elevatedButtonTheme: _elevatedButtonThemeData,
      outlinedButtonTheme: _outlinedButtonThemeData,
      primaryColor: _lightPrimaryColor,
      scaffoldBackgroundColor: _lightBackgroundColor,
      bottomNavigationBarTheme: _bottomNavigationBarThemeData,
      textTheme: lightTextTheme,
      colorScheme: const ColorScheme.light(
        outline: AppColors.secondary,
      ),
      appBarTheme: _appBarTheme,
      inputDecorationTheme: _inputDecorationLightTheme);

  ///Dark theme
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    elevatedButtonTheme: _elevatedButtonThemeData,
    outlinedButtonTheme: _outlinedButtonThemeData,
    cardColor: AppColors.text_white,
    primaryColor: _lightPrimaryColor,
    scaffoldBackgroundColor: _darkBackgroundColor,
    bottomNavigationBarTheme: _bottomNavigationBarThemeData,
    appBarTheme: AppBarTheme(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: AppColors.neutral02,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        iconTheme: const IconThemeData(color: _darkIconColor),
        titleTextStyle: AppTextStyle.H6,
        backgroundColor: _lightPrimaryColor),
    iconTheme: const IconThemeData(
      color: _lightIconColor,
    ),
    textTheme: _dartTextTheme,
  );
}
