import 'package:vncss/app/data/model/model/orders_detail.dart';
import 'package:vncss/app/data/model/model/search_tracking.dart';

import '../model/tracking.dart';
import '../model/tracking_bill.dart';
import '../model/tracking_customer_detail_model.dart';
import '../model/tracking_type.dart';
import 'pagination.dart';


class ListTrackingsResponse {
  Meta? meta;
  List<Trackings>? trackings;
  String? message;

  ListTrackingsResponse({this.meta, this.trackings, this.message});

  ListTrackingsResponse.fromJson(Map<String, dynamic> json) {
    meta = json['pagination'] != null ? Meta.fromJson(json['pagination']) : null;
    if (json['data'] != null) {
      trackings = <Trackings>[];
      json['data'].forEach((v) {
        trackings!.add(Trackings.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (meta != null) {
      data['pagination'] = meta!.toJson();
    }
    if (trackings != null) {
      data['data'] = trackings!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class ListTrackingCustomerResponse {
  Meta? pagination;
  List<TrackingCustomerDetailModel>? listTrackingCustomer;
  String? message;

  ListTrackingCustomerResponse({this.pagination, this.listTrackingCustomer, this.message});

  ListTrackingCustomerResponse.fromJson(Map<String, dynamic> json) {
    pagination = json['pagination'] != null ? Meta.fromJson(json['pagination']) : null;
    if (json['data'] != null) {
      listTrackingCustomer = <TrackingCustomerDetailModel>[];
      json['data'].forEach((v) {
        listTrackingCustomer!.add(TrackingCustomerDetailModel.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (pagination != null) {
      data['meta'] = pagination!.toJson();
    }
    if (listTrackingCustomer != null) {
      data['data'] = listTrackingCustomer!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class SearchTrackingResponse {
  List<SearchTracking>? listSearchTracking;
  String? message;

  SearchTrackingResponse({this.listSearchTracking, this.message});

  SearchTrackingResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      listSearchTracking = <SearchTracking>[];
      json['data'].forEach((v) {
        listSearchTracking!.add(SearchTracking.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (listSearchTracking != null) {
      data['data'] = listSearchTracking!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class ListDetailTrackingResponse{
  Trackings? detailTracking;
  String? message;
  List<OrdersDetailStatusLogs>? listStatusLog;

  ListDetailTrackingResponse({this.detailTracking, this.message,this.listStatusLog});

  ListDetailTrackingResponse.fromJson(Map<String, dynamic> json) {
    if (json['data']['statusLogs'] != null) {
      listStatusLog = <OrdersDetailStatusLogs>[];
      json['data']['statusLogs'].forEach((v) {
        listStatusLog!.add(OrdersDetailStatusLogs.fromJson(v));
      });
    }
    if (json['data'] != null) {
      detailTracking = Trackings.fromJson(json['data']);
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (detailTracking != null) {
      data['data'] = detailTracking;
    }
    if (listStatusLog != null) {
      data['data'] = listStatusLog!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class ListTrackingTypeResponse {
  List<TrackingsType>? listTrackingType;
  String? message;

  ListTrackingTypeResponse({this.listTrackingType, this.message});

  ListTrackingTypeResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      listTrackingType = <TrackingsType>[];
      json['data'].forEach((v) {
        listTrackingType!.add(TrackingsType.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (listTrackingType != null) {
      data['data'] = listTrackingType!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}