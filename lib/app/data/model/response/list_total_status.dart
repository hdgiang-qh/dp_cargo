import '../model/delivery_bill.dart';
import '../model/tracking_status_model.dart';

class ListTrackingStatusResponse {
  List<TrackingStatusModel>? listTrackingStatus;
  String? message;

  ListTrackingStatusResponse({this.listTrackingStatus, this.message});

  ListTrackingStatusResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      listTrackingStatus = <TrackingStatusModel>[];
      json['data'].forEach((v) {
        listTrackingStatus!.add(TrackingStatusModel.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (listTrackingStatus != null) {
      data['data'] = listTrackingStatus!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class ListOrderStatusResponse {
  List<TrackingStatusModel>? listOrderStatus;
  String? message;

  ListOrderStatusResponse({this.listOrderStatus, this.message});

  ListOrderStatusResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      listOrderStatus = <TrackingStatusModel>[];
      json['data'].forEach((v) {
        listOrderStatus!.add(TrackingStatusModel.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (listOrderStatus != null) {
      data['data'] = listOrderStatus!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}
class ListAwbStatusResponse {
  List<TotalBillModel>? listAwbStatus;
  String? message;

  ListAwbStatusResponse({this.listAwbStatus, this.message});

  ListAwbStatusResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      listAwbStatus = <TotalBillModel>[];
      json['data'].forEach((v) {
        listAwbStatus!.add(TotalBillModel.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (listAwbStatus != null) {
      data['data'] = listAwbStatus!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}