import 'package:vncss/app/data/model/response/pagination.dart';

import '../model/report_detail_model.dart';
import '../model/report_model.dart';
import '../model/warehouse.dart';

class ListWarehouseResponse {
  List<WareHouse>? listWarehouse;
  String? message;

  ListWarehouseResponse({this.listWarehouse, this.message});

  ListWarehouseResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      listWarehouse = <WareHouse>[];
      json['data'].forEach((v) {
        listWarehouse!.add(WareHouse.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (listWarehouse != null) {
      data['data'] = listWarehouse!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class WarehouseResponse {
  List<WareHouseModel>? listWarehouse;
  String? message;

  WarehouseResponse({this.listWarehouse, this.message});

  WarehouseResponse.fromJson(Map<String, dynamic> json) {
    if (json['data']['warehouses'] != null) {
      listWarehouse = <WareHouseModel>[];
      json['data']['warehouses'].forEach((v) {
        listWarehouse!.add(WareHouseModel.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (listWarehouse != null) {
      data['data']['warehouses'] =
          listWarehouse!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class WarehouseDetailResponse {
  List<ReportWareHouseDetailModel>? listWarehouseDetail;
  String? message;

  WarehouseDetailResponse({this.listWarehouseDetail, this.message});

  WarehouseDetailResponse.fromJson(Map<String, dynamic> json) {
    if (json['data']['trackingTypes'] != null) {
      listWarehouseDetail = <ReportWareHouseDetailModel>[];
      json['data']['trackingTypes'].forEach((v) {
        listWarehouseDetail!.add(ReportWareHouseDetailModel.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (listWarehouseDetail != null) {
      data['data']['trackingTypes'] =
          listWarehouseDetail!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class BillSaleResponse {
  Meta? pagination;
  List<BillSaleModel>? listBillSale;
  String? message;

  BillSaleResponse({this.listBillSale, this.message});

  BillSaleResponse.fromJson(Map<String, dynamic> json) {
    pagination = json['data']['paginations'] != null
        ? Meta.fromJson(json['data']['paginations'])
        : null;
    if (json['data']['data'] != null) {
      listBillSale = <BillSaleModel>[];
      json['data']['data'].forEach((v) {
        listBillSale!.add(BillSaleModel.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (pagination != null) {
      data['data']['paginations'] = pagination!.toJson();
    }
    if (listBillSale != null) {
      data['data']['data'] = listBillSale!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class BillSaleDetailResponse {
  ReportDetailModel? reportDetailValue;
  List<ReportDetailModelStatisticByDeliveryBill>? listStaticByDeliveryBill;
  String? message;

  BillSaleDetailResponse(
      {this.reportDetailValue,this.listStaticByDeliveryBill,
      this.message});

  BillSaleDetailResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      reportDetailValue = ReportDetailModel.fromJson(json['data']);
    }
    if (json['data']['statisticByDeliveryBill'] != null) {
      listStaticByDeliveryBill = <ReportDetailModelStatisticByDeliveryBill>[];
      json['data']['statisticByDeliveryBill'].forEach((v) {
        listStaticByDeliveryBill!
            .add(ReportDetailModelStatisticByDeliveryBill.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (reportDetailValue != null) {
      data['data'] = reportDetailValue!;
    }
    if (listStaticByDeliveryBill != null) {
      data['data']['statisticByDeliveryBill'] =
          listStaticByDeliveryBill!.map((v) => v.toJson()).toList();
    }

    data['message'] = message;
    return data;
  }
}

class BillCustomResponse {
  Meta? pagination;
  List<BillCustomModel>? listBillCustom;
  String? message;

  BillCustomResponse({this.listBillCustom, this.message});

  BillCustomResponse.fromJson(Map<String, dynamic> json) {
    pagination = json['data']['paginations'] != null
        ? Meta.fromJson(json['data']['paginations'])
        : null;
    if (json['data']['data'] != null) {
      listBillCustom = <BillCustomModel>[];
      json['data']['data'].forEach((v) {
        listBillCustom!.add(BillCustomModel.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (pagination != null) {
      data['data']['paginations'] = pagination!.toJson();
    }
    if (listBillCustom != null) {
      data['data']['data'] = listBillCustom!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class ChartResponse {
  ReportChartModel? listChartValue;
  String? message;

  ChartResponse({this.listChartValue, this.message});

  ChartResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      listChartValue = ReportChartModel.fromJson(json['data']);
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (listChartValue != null) {
      data['data'] = listChartValue!;
    }
    data['message'] = message;
    return data;
  }
}

class ExploitationResponse {
  Meta? pagination;
  List<Exploitation>? listExploitation;
  String? message;

  ExploitationResponse({this.listExploitation, this.message, this.pagination});

  ExploitationResponse.fromJson(Map<String, dynamic> json) {
    pagination = json['data']['paginations'] != null
        ? Meta.fromJson(json['data']['paginations'])
        : null;
    if (json['data']['data'] != null) {
      listExploitation = <Exploitation>[];
      json['data']['data'].forEach((v) {
        listExploitation!.add(Exploitation.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (pagination != null) {
      data['data']['pagination'] = pagination!.toJson();
    }
    if (listExploitation != null) {
      data['data']['data'] = listExploitation!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class ExploitationEmployeeResponse {
  List<ExploitationEmployee>? listExploitationEmployee;
  String? message;

  ExploitationEmployeeResponse({this.listExploitationEmployee, this.message});

  ExploitationEmployeeResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      listExploitationEmployee = <ExploitationEmployee>[];
      json['data'].forEach((v) {
        listExploitationEmployee!.add(ExploitationEmployee.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (listExploitationEmployee != null) {
      data['data'] = listExploitationEmployee!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class AwbResponse {
  Meta? pagination;
  List<Awb>? listAwb;
  String? message;

  AwbResponse({this.listAwb, this.message, this.pagination});

  AwbResponse.fromJson(Map<String, dynamic> json) {
    pagination = json['data']['paginations'] != null
        ? Meta.fromJson(json['data']['paginations'])
        : null;
    if (json['data']['data'] != null) {
      listAwb = <Awb>[];
      json['data']['data'].forEach((v) {
        listAwb!.add(Awb.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (pagination != null) {
      data['data']['pagination'] = pagination!.toJson();
    }
    if (listAwb != null) {
      data['data']['data'] = listAwb!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}
