import '../model/sale_employee.dart';

class ListSaleEmployeeResponse {
  List<SaleEmployee>? listSaleEmployeee;
  String? message;
  String? errorMessage;

  ListSaleEmployeeResponse({this.listSaleEmployeee, this.message});

  ListSaleEmployeeResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      listSaleEmployeee = <SaleEmployee>[];
      json['data'].forEach((v) {
        listSaleEmployeee!.add(SaleEmployee.fromJson(v));
      });
    }
    message = json['message'];
    errorMessage = json['errorMessage'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (listSaleEmployeee != null) {
      data['data'] = listSaleEmployeee!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    data['error_message'] = errorMessage;
    return data;
  }
}