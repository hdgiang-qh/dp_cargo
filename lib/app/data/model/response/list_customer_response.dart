import '../model/customers.dart';
import '../model/data_customers.dart';
import 'pagination.dart';

class ListDataCustomerResponse {
  List<DataCustomers>? data;
  Meta? meta;
  String? errorMessage;
  String? message;

  ListDataCustomerResponse({this.data, this.errorMessage, this.message});

  ListDataCustomerResponse.fromJson(Map<String, dynamic> json) {
    meta = json['data']['pagination'] != null ? Meta.fromJson(json['data']['pagination']) : null;
    if (json['data']['data'] != null) {
      data = <DataCustomers>[];
      json['data']['data'].forEach((v) {
        data?.add(DataCustomers.fromJson(v));
      });
    }
    errorMessage = json['error_message'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (meta != null) {
      data['pagination'] = meta!.toJson();
    }
    if (this.data != null) {
      data['data']['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListCustomerResponse {
  List<DataCustomers>? data;
  Meta? meta;

  ListCustomerResponse({this.data});

  ListCustomerResponse.fromJson(Map<String, dynamic> json) {
    meta =
        json['pagination'] != null ? Meta.fromJson(json['pagination']) : null;
    if (json['data'] != null) {
      data = <DataCustomers>[];
      json['data'].forEach((v) {
        data?.add(DataCustomers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (meta != null) {
      data['pagination'] = meta!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DetailCustomerResponse {

  Customers? customer;
  String? message;
  String? error_message;

  DetailCustomerResponse({this.customer, this.message,this.error_message});

  DetailCustomerResponse.fromJson(Map<String, dynamic> json) {
    if (json['data']!= null) {
      customer = Customers.fromJson(json['data']);
    }
    message = json['message'];
    error_message = json['error_message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (customer != null) {
      data['data'] = customer!;
    }
    data['message'] = message;
    data['error_message'] = error_message;
    return data;
  }
}
