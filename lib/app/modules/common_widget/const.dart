import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension ToStringTime on DateTime {
  String toDateTimeString() {
    return " $year-${day.toString().padLeft(2, '0')}-${month.toString().padLeft(2, '0')} ${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}:00";
  }

  String toDateTimeStringWithoutHour() {
    return " ${day.toString().padLeft(2, '0')}/${month.toString().padLeft(2, '0')}/$year ";
  }
  String toDateTimeStringWithoutHour2() {
    return " ${day.toString().padLeft(2, '0')}-${month.toString().padLeft(2, '0')}-$year ";
  }
}

class Const {
  static final format = NumberFormat("#,##0.##", "en-US");

  static bool isNumeric(String result) {
    return double.tryParse(result) != null;
  }
  static convertPrice(
    dynamic price,
  ) {
    if (price != null) {
      return "${format.format(double.parse(price.toString()))} ₫";
    }
    return "0 ₫";
  }
  static convertPrice2(
    dynamic price,
  ) {
    if (price != null) {
      return format.format(double.parse(price.toString()));
    }
    return "0";
  }
  static convertPriceDouble(
      String price,
      ) {
    if (price.isNotEmpty) {
      return double.parse(price);
    }
    return 0.0;
  }
  static convertWeight(
      dynamic weight,
      ) {
    if (weight != null) {
      return "${double.parse(weight.toString()).toStringAsFixed(2)} kg";
    }
    return "0";
  }
  static convertWeight2(
      dynamic weight,
      ) {
    if (weight != null) {
      return format.format(double.parse(weight.toString()));
    }
    return "0";
  }
  static formatNumberEng(String numberString) {
    int number = int.parse(numberString);
    bool isNegative = number < 0;
    number = number.abs(); // Lấy giá trị tuyệt đối của số

    String formattedNumber;

    if(number != null){
      if (number >= 1000000000) {
        formattedNumber = '${(number / 1000000000).toStringAsFixed(1)}B';
      } else if (number >= 1000000) {
        formattedNumber = '${(number / 1000000).toStringAsFixed(1)}M';
      } else if (number >= 1000) {
        formattedNumber = '${(number / 1000).toStringAsFixed(1)}K';
      } else {
        formattedNumber = number.toString();
      }
      return isNegative ? '-$formattedNumber' : formattedNumber;
    }
    return "";
  }
  static convertDate(
      dynamic date,
      ){
    if (date != null) {
      DateTime dateTime = DateTime.parse(date.toString()).toLocal();
      return DateFormat('dd/MM/yyyy HH:mm:ss').format(dateTime);
    }
    return "--";
  }

  static convertDateWithoutHour(
      dynamic date,
      ){
    if (date != null) {
      DateTime dateTime = DateTime.parse(date.toString()).toLocal();
      return DateFormat('dd-MM-yyyy').format(dateTime);
    }
    return "--";
  }
}

class ColorApp {
  static const Color whiteFA = Color(0xfffafafa);
  static const Color greyA9 = Color(0xffA9A9A9);
  static const Color grey7F = Color(0xff7f7f7f);
  static const Color grey74 = Color(0xff747474);
  static const Color greyD7 = Color(0xffd7d7d7);
  static const Color greyF2 = Color(0xffF2F2F2);
  static const Color greyC4 = Color(0xffc4c4c4);
  static const Color grey77 = Color(0xff777e90);
  static const Color yellowFF = Color(0xffffd754);
  static const Color yellowE8 = Color(0xffe8b100);
  static const Color blueED = Color(0xffedeff5);
  static const Color whiteA1 = Color(0xfff9f9f9);

  static const Color blueB0 = Color(0xffb0ceff);
  static const Color blue48 = Color(0xff485691);
  static const Color blue00 = Color(0xff0057e8);
  static const Color blue002 = Color(0xff00286b);
  static const Color green1B = Color(0xff1b7437);
  static const Color green08 = Color(0xff08b123);
  static const Color green36 = Color(0xff367a56);
  static const Color green26 = Color(0xff26a44d);
  static const Color green23 = Color(0xff239546);
  static const Color green62 = Color(0xff629e7e);
  static const Color greenBC = Color(0xffBCE3C8);
  static const Color redE7 = Color(0xffefc0c0);
  static const Color red75 = Color(0xff751414);
  static const Color redB6 = Color(0xffb62222);
  static const Color black1F = Color(0xff1f1f1f);
  static const Color black23 = Color(0xff23262f);

  static const Color orangeF2 = Color(0xfff2994a);
  static const Color purpleB5 = Color(0xffb573c7);
  static const Color blue70 = Color(0xff70bbfd);
  static const Color blue4D = Color(0xff4dacc8);
  static const Color blue36 = Color(0xff365683);
  static const Color yellowFFC = Color(0xffffcb00);
  static const Color green4C = Color(0xff4cdaaf);
  static const Color blueB5 = Color(0xffb5cdef);
}

const Color primaryColor = Color(0xffb92f2e);
const Color textPrimary = Color(0xff353535);
