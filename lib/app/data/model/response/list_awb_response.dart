import 'package:vncss/app/data/model/response/pagination.dart';

import '../model/awb.dart';
import '../model/warehouse.dart';

class ListAWBResponse {
  Meta? meta;
  List<AWBModel>? awbs;
  String? message;

  ListAWBResponse({this.meta, this.awbs, this.message});

  ListAWBResponse.fromJson(Map<String, dynamic> json) {
    meta = json['data']['meta'] != null ? Meta.fromJson(json['data']['meta']) : null;
    if (json['data'] != null) {
      awbs = <AWBModel>[];
      json['data']['data'].forEach((v) {
        awbs!.add(AWBModel.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (meta != null) {
      data['data']['meta'] = meta!.toJson();
    }
    if (awbs != null) {
      data['data']['data'] = awbs!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class listWareHouse {
  List<WareHouse>? warehouse;
  String? message;

  listWareHouse({this.warehouse, this.message});

  listWareHouse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      warehouse = <WareHouse>[];
      json['data'].forEach((v) {
        warehouse!.add(WareHouse.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (warehouse != null) {
      data['data'] = warehouse!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class ListAWBDetailResponse {
  AwbBoxData? listAwbDetail;

  ListAWBDetailResponse({ this.listAwbDetail});

  ListAWBDetailResponse.fromJson(Map<String, dynamic> json) {

    if (json['data'] != null) {
      listAwbDetail = AwbBoxData.fromJson(json['data']);
    }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (listAwbDetail != null) {
      data['data'] = listAwbDetail!;
    }
    return data;
  }
}