class CreateTrackingRequest {
  String? trackingCode;
  String? productName;
  String? note;
  int? trackingType;
  int? trackingAmount;
  int? price;
  int? warehouseVnId;

  CreateTrackingRequest(
      {this.trackingCode,
      this.productName,
      this.note,
      this.trackingType,
      this.trackingAmount,
      this.price,
      this.warehouseVnId});

  CreateTrackingRequest.fromJson(Map<String, dynamic> json) {
    trackingCode = json['tracking_code'];
    productName = json['product_name'];
    note = json['note'];
    trackingType = json['tracking_type'];
    trackingAmount = json['tracking_amount'];
    price = json['price'];
    warehouseVnId = json['warehouse_vn_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tracking_code'] = trackingCode;
    data['product_name'] = productName;
    data['note'] = note;
    data['tracking_type'] = trackingType;
    data['tracking_amount'] = trackingAmount;
    data['price'] = price;
    data['warehouse_vn_id'] = warehouseVnId;
    return data;
  }
}
