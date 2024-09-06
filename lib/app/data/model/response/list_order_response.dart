import 'package:vncss/app/data/model/model/orders.dart';

import '../model/orders_detail.dart';
import 'pagination.dart';


class ListOrderResponse {
  Meta? meta;
  List<Orders>? order;
  String? message;

  ListOrderResponse({this.meta, this.order, this.message});

  ListOrderResponse.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    if (json['data'] != null) {
      order = <Orders>[];
      json['data'].forEach((v) {
        order!.add(Orders.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    if (order != null) {
      data['data'] = order!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class ListOrderDetailResponse{
  List<OrdersDetailStatusLogs>? statusLog;
  OrdersDetail? orderDetail;
  String? message;

  ListOrderDetailResponse({ this.orderDetail, this.message,this.statusLog});

  ListOrderDetailResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      if(json['data']['statusLogs'] != null){
        statusLog = <OrdersDetailStatusLogs>[];
        json['data']['statusLogs'].forEach((v) {
          statusLog!.add(OrdersDetailStatusLogs.fromJson(v));
        });
      }
      orderDetail = OrdersDetail.fromJson(json['data']);
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (orderDetail != null) {
      data['data'] = orderDetail;
    }
    if (statusLog != null) {
      data['data']['statusLogs'] = statusLog;
    }
    data['message'] = message;
    return data;
  }
}