class CreateDeliveryBillRequest {
  int? customerId;
  List<TrackingIds>? trackingIds;
  String? address;
  String? phone;
  String? description;
  String? note;
  String? customerName;

  CreateDeliveryBillRequest(
      {this.customerId,
        this.trackingIds,
        this.address,
        this.phone,
        this.description,
        this.note,
        this.customerName});

  CreateDeliveryBillRequest.fromJson(Map<String, dynamic> json) {
    customerId = json['customerId'];
    if (json['trackingIds'] != null) {
      trackingIds = <TrackingIds>[];
      json['trackingIds'].forEach((v) {
        trackingIds!.add(TrackingIds.fromJson(v));
      });
    }
    address = json['address'];
    phone = json['phone'];
    description = json['description'];
    note = json['note'];
    customerName = json['customerName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['customerId'] = customerId;
    if (trackingIds != null) {
      data['trackingIds'] = trackingIds!.map((v) => v.toJson()).toList();
    }
    data['address'] = address;
    data['phone'] = phone;
    data['description'] = description;
    data['note'] = note;
    data['customerName'] = customerName;
    return data;
  }
}

class TrackingIds {
  String? id;

  TrackingIds({this.id});

  TrackingIds.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    return data;
  }
}
