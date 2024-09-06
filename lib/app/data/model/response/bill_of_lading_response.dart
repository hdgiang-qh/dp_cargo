

import 'package:vncss/app/data/model/response/pagination.dart';

import '../model/bill_of_lading.dart';

class BillOfLadingResponse {
  Meta? meta;
  List<BillOfLading>? billOfLading;
  String? message;

  BillOfLadingResponse({ this.billOfLading, this.message,this.meta});

  BillOfLadingResponse.fromJson(Map<String, dynamic> json) {
    if (json['data']['data'] != null) {
      billOfLading = <BillOfLading>[];
      json['data']['data'].forEach((v) {
        billOfLading!.add(BillOfLading.fromJson(v));
      });
    }
    meta = json['data']['meta'] != null ? Meta.fromJson(json['data']['meta']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (billOfLading != null) {
      data['data']['data'] = billOfLading!.map((v) => v.toJson()).toList();
    }
    if (meta != null) {
      data['data']['meta'] = meta!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class DeliveryUnitsResponse {
  Meta? meta;
  List<BillOfLadingVnDeliveryUnit>? listDeliveryUnits;
  String? message;

  DeliveryUnitsResponse({ this.listDeliveryUnits, this.message,this.meta});

  DeliveryUnitsResponse.fromJson(Map<String, dynamic> json) {
    if (json['data']['data'] != null) {
      listDeliveryUnits = <BillOfLadingVnDeliveryUnit>[];
      json['data']['data'].forEach((v) {
        listDeliveryUnits!.add(BillOfLadingVnDeliveryUnit.fromJson(v));
      });
    }
    meta = json['data']['meta'] != null ? Meta.fromJson(json['data']['meta']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (listDeliveryUnits != null) {
      data['data']['data'] = listDeliveryUnits!.map((v) => v.toJson()).toList();
    }
    if (meta != null) {
      data['data']['meta'] = meta!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class BillOfLadingDetailResponse {

  BillOfLading? billOfLadingDetail;
  String? message;

  BillOfLadingDetailResponse({this.billOfLadingDetail, this.message});

  BillOfLadingDetailResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      billOfLadingDetail = BillOfLading.fromJson(json['data']);
    }
    message = json['message'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (billOfLadingDetail != null) {
      data['data'] = billOfLadingDetail!;
    }
    data['message'] = message;
    return data;
  }
}

class DetailDeliveryUnitsResponse {

  BillOfLadingVnDeliveryUnit? detailDeliveryUnit;
  String? message;

  DetailDeliveryUnitsResponse({this.detailDeliveryUnit, this.message});

  DetailDeliveryUnitsResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      detailDeliveryUnit = BillOfLadingVnDeliveryUnit.fromJson(json['data']);
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (detailDeliveryUnit != null) {
      data['data'] = detailDeliveryUnit!;
    }
    data['message'] = message;
    return data;
  }
}