class BillDeliveryExpensive {
   double trackingOtherFee;
   double trackingShippingFee;
   double trackingSurcharge;

  BillDeliveryExpensive({
    required this.trackingShippingFee,
    required this.trackingSurcharge,
    required this.trackingOtherFee,
  });

}

extension BillDeliveryExpensiveExt on BillDeliveryExpensive {
   double get trackingTotalMoney  {
    return trackingShippingFee + trackingOtherFee + trackingSurcharge;
  }
}