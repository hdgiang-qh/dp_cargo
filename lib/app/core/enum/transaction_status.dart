import 'dart:ui';

import '../../modules/common_widget/const.dart';

enum TransactionStatuses {
  all('Tất cả', primaryColor),
  pay('Thanh toán', ColorApp.blue00),
  recharge("Nạp tiền", ColorApp.blueB5),
  refund("Hoàn tiền", ColorApp.green23),
  withdrawMoney('Rút tiền', ColorApp.orangeF2);

  final String value;
  final Color color;

  const TransactionStatuses(this.value, this.color);

  static TransactionStatuses? fromValue(String? value) {
    if (value == null) return null;
    try {
      return TransactionStatuses.values.firstWhere(
        (status) => status.value == value,
      );
    } catch (e) {
      return null;
    }
  }
}

enum TransactionStatusesUpper {
  all('TẤT CẢ', primaryColor),
  pay('THANH TOÁN', ColorApp.blue00),
  recharge("NẠP TIỀN", ColorApp.blueB5),
  refund("HOÀN TIỀN", ColorApp.green23),
  withdrawMoney('RÚT TIỀN', ColorApp.orangeF2);

  final String value;
  final Color color;

  const TransactionStatusesUpper(this.value, this.color);

  static TransactionStatusesUpper? fromValue(String? value) {
    if (value == null) return null;
    try {
      return TransactionStatusesUpper.values.firstWhere(
        (customerTransactionType) => customerTransactionType.value == value,
      );
    } catch (e) {
      return null;
    }
  }
}

enum TransactionStatusesUpper2 {
  pay('THANH TOÁN', ColorApp.blue00),
  recharge("NẠP TIỀN", ColorApp.blueB5),
  refund("HOÀN TIỀN", ColorApp.green23),
  withdrawMoney('RÚT TIỀN', ColorApp.orangeF2);

  final String value;
  final Color color;

  const TransactionStatusesUpper2(this.value, this.color);

}

enum ActionStatuses {
  complete('hoàn thành','Hoàn thành', ColorApp.green23,ColorApp.green23,),
  pending("chờ duyệt","Chờ duyệt", ColorApp.blue4D,ColorApp.blue4D),
  cancel("hủy", "Hủy",primaryColor,primaryColor);

  final String value;
  final String valueUp;
  final Color color;
  final Color textColor;

  const ActionStatuses(this.value, this.valueUp,this.color,this.textColor);

  static ActionStatuses? fromValue(String? value) {
    if (value == null) return null;
    try {
      return ActionStatuses.values.firstWhere(
        (status) => status.value == value,
      );
    } catch (e) {
      return null;
    }
  }
}

