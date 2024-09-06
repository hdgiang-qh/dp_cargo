import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color primary = Color(0xffb72323);
  static const Color bluePrimary = Color(0xff056CF2);
  static const Color primaryOpaction = Color(0xffFFF0F0);
  static const Color primaryDisable = Color(0xffF1EDED);
  static const Color neutralsWhite = Color(0xfff5f5f5);
  static const Color neutrals500 = Color(0xff25324b);
  static const Color pageBackground = Color(0xfff9f9f9);
  static const Color backgroundLighter = Color(0xfff9f9f9);
  static const Color backgroundDarker = Color(0xff000000);
  static const Color backgroundWhite = Color(0xffF9F9F9);

  static const Color statusBarColor = Color(0xFF38686A);
  static const Color appBarColor = Color(0xFF38686A);
  static const Color appBarIconColor = Color(0xFFFFFFFF);
  static const Color appBarTextColor = Color(0xFFFFFFFF);
  static const Color second = Color(0xff202b60);
  static const Color second400 = Color(0xff4f5e9f);
  static const Color second500 = Color(0xff202b60);
  static const Color secondary = Color(0xff08C727);
  static const Color secondary2 = Color(0xffFF451B);
  static const Color pending100 = Color(0xffFFF6EC);

  static const Color centerTextColor = Colors.grey;
  static const MaterialColor colorPrimarySwatch = Colors.cyan;
  static const Color colorPrimary = Color(0xFF38686A);
  static const Color colorAccent = Color(0xFF38686A);
  static const Color colorLightGreen = Color(0xFF00EFA7);
  static const Color colorWhite = Color(0xFFFFFFFF);
  static const Color lightGreyColor = Color(0xFFC4C4C4);
  static const Color errorColor = Color(0xFFAB0B0B);
  static const Color colorDark = Color(0xFF323232);

  static const Color buttonBgColor = colorPrimary;
  static const Color disabledButtonBgColor = Color(0xFFBFBFC0);
  static const Color defaultRippleColor = Color(0x0338686A);

  static const Color text_black = Color(0xff1E2323);
  static const Color text_white = Color(0xffFFFFFF);
  static const Color text_grey = Color(0xffC5C6D2);
  static const Color text_hint = Color(0xff52535C);
  static const Color text_hint_1 = Color(0xff8B8C9B);
  static const Color text_hint_2 = Color(0xffa7abc3);
  static const Color button_gray = Color(0xffe6e8ec);

  static const Color textColorPrimary = Color(0xFF323232);
  static const Color textColorSecondary = Color(0xFF9FA4B0);
  static const Color textColorTag = colorPrimary;
  static const Color textColorGreyLight = Color(0xFFABABAB);
  static const Color textColorGreyDark = Color(0xFF979797);
  static const Color textColorGrey = Color(0xFF82869E);
  static const Color textColorBlueGreyDark = Color(0xFF939699);
  static const Color textColorCyan = Color(0xFF38686A);
  static const Color textColorWhite = Color(0xFFFFFFFF);
  static Color searchFieldTextColor = const Color(0xFF323232).withOpacity(0.5);
  static Color textGray = const Color(0xff38383D);

  static const Color iconColorDefault = Colors.grey;

  static Color barrierColor = const Color(0xFF000000).withOpacity(0.5);

  static Color timelineDividerColor = const Color(0x5438686A);

  static Color lineColor = const Color(0xffF6F9FC);

  static Color lineColorBold = const Color(0xffEEF2FA);

  static const Color gradientStartColor = Colors.black87;
  static const Color gradientEndColor = Colors.transparent;
  static const Color silverAppBarOverlayColor = Color(0x80323232);

  static const Color switchActiveColor = colorPrimary;
  static const Color switchInactiveColor = Color(0xFFABABAB);
  static Color elevatedContainerColorOpacity = Colors.grey.withOpacity(0.5);
  static const Color suffixImageColor = Colors.grey;

  static const Color orange = Colors.orange;

  static const Color greyScale500 = Color(0xFF96A0B5);
  static const Color greyScale = Color(0xFF111827);
  static const Color black = Color(0xFF16162E);
  static const Color circleBackground1 = Color(0xFFF2D9D8);
  static const Color circleBackground2 = Color(0xFFC34544);
  static const Color bordersFlat = Color(0xFFE0E6EB);
  static const Color neutral300 = Color(0xFFD1D5DB);
  static const Color neutral06 = Color(0xff777E90);
  static const Color neutral04 = Color(0xFFE6E8EC);
  static const Color neutral03 = Color(0xFFF4F5F6);
  static const Color neutral02 = Color(0xFFFCFCFD);
  static const Color aZShopPrimary = Color(0xFFF83142);
  static const Color radioColor = Color(0xFFB62222);
  static const Color iconBarColor = Color(0xFF6A737D);
  static const Color activeIconBarColor = Color(0xffb62222);
  static const Color status6 = Color(0xFF27AE60);
  static const Color status5 = Color(0xFFF2994A);
  static const Color status3 = Color(0xFF4CDAAF);
  static const Color status2 = Color(0xFF70BBFD);
  static const Color status1 = Color(0xFFF6DA6E);
  static const Color textStatus1 = Color(0xFF365683);
  static const Color borderPXK = Color(0xFFC9C9C9);
  static const Color neutrals06 = Color(0xFF777E90);
  static const Color neutrals08 = Color(0xFF23262F);
  static const Color divider = Color(0xFFE1E1E1);
  static const Color neutral = Color(0xFF434657);
  static const Color neutralTextTitle = Color(0xFF1B1D29);
  static const Color neutralDivider = Color(0xFFE4E5F0);
  static const Color waitingForWarehouseUS = Color(0xffF2994A);
  static const Color waitingForWarehouseUSSelected = Color(0x33F2994A);
  static const Color enteredWarehouseUS = Color(0xffB573C7);
  static const Color enteredWarehouseUSSelected = Color(0x33B573C7);
  static const Color yellow1 = Color(0xffFBC800);
  static const Color transportingToVN = Color(0xff70BBFD);
  static const Color transportingToVNSelected = Color(0x3370BBFD);
  static const Color enteredWarehouseVN = Color(0xff4DACC8);
  static const Color enteredWarehouseVNSelected = Color(0x334DACC8);
  static const Color exploited = Color(0xff2D346F);
  static const Color exploitedSelected = Color(0x332D346F);
  static const Color packed = Color(0xff2D346F);
  static const Color packedSelected = Color(0x332D346F);
  static const Color green1 = Color(0xff08B123);
  static const Color delivering = Color(0xffFFCB00);
  static const Color completed = Color(0xff27AE60);
  static const Color completedSelected = Color(0x3327AE60);
  static const Color deliveringSelected = Color(0x33FFCB00);
  static const Color canceled = Color(0xffCC3333);
  static const Color canceledSelected = Color(0x33CC3333);
  static const Color cancelled = Color(0xff365683);
  static const Color allTracking = Color(0xffB92F2E);
  static const Color allTrackingSelected = Color(0x33B92F2E);
  static const Color dottedBorder = Color(0xff1990FF);
  static const Color blueColorBack = Color(0xffE8F4FF);
  static const Color textNeutral = Color(0xff82869E);
  static const Color neutralBack = Color(0xffF8F8FC);
  static const Color greyScale1 = Color(0xff4B5563);
  static const Color blueAction = Color(0xff1666D1);
  static const Color listTileBorder = Color(0xffDDDDDD);
  static const Color backButtonColor = Color(0x80c6c6c6);
}
