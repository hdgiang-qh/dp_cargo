enum TrackingReportBill {
  all('Tất cả', ""),
  tracking_mining_weight_asc('TLKT tăng dần', "tracking_mining_weight-asc"),
  tracking_mining_weight_desc('TLKT giảm dần', "tracking_mining_weight-desc"),
  tracking_calculation_weight_asc(
      'TLTT tăng dần', "tracking_calculation_weight-asc"),
  tracking_calculation_weight_desc(
      'TLTT giảm dần', " tracking_calculation_weight-desc"),
  tracking_total_money_asc('Tổng tiền tăng dần', "tracking_total_money-asc"),
  tracking_total_money_desc('Tổng tiền tăng dần', "tracking_total_money-desc");

  final String title;
  final String valueText;

  const TrackingReportBill(this.title,this.valueText);
}
