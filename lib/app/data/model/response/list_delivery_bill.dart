
import '../model/bill_customer_detail.dart';
import '../model/create_bill_custom_model.dart';
import '../model/delivery_bill.dart';
import '../model/delivery_bill_detail.dart';
import 'pagination.dart';


class ListDeliveryBillResponse {
  Meta? meta;
  List<DeliveryBill>? deliveryBills;
  String? message;

  ListDeliveryBillResponse({this.meta, this.deliveryBills, this.message});

  ListDeliveryBillResponse.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    if (json['data'] != null) {
      deliveryBills = <DeliveryBill>[];
      json['data'].forEach((v) {
        deliveryBills!.add(DeliveryBill.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    if (deliveryBills != null) {
      data['data'] = deliveryBills!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class ListDeliveryBillCustomerResponse {
  Meta? pagination;
  List<BillCustomerDetail>? listBillCustom;
  String? message;

  ListDeliveryBillCustomerResponse({this.pagination, this.listBillCustom, this.message});

  ListDeliveryBillCustomerResponse.fromJson(Map<String, dynamic> json) {
    pagination = json['pagination'] != null ? Meta.fromJson(json['pagination']) : null;
    if (json['data'] != null) {
      listBillCustom = <BillCustomerDetail>[];
      json['data'].forEach((v) {
        listBillCustom!.add(BillCustomerDetail.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (pagination != null) {
      data['meta'] = pagination!.toJson();
    }
    if (listBillCustom != null) {
      data['data'] = listBillCustom!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class TotalDeliveryBill{
  List<TotalBillModel>? listTotal;
  TotalDeliveryBill({this.listTotal});

  TotalDeliveryBill.fromJson(Map<String, dynamic> json) {

    if (json['data'] != null) {
      listTotal = <TotalBillModel>[];
      json['data'].forEach((v) {
        listTotal!.add(TotalBillModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (listTotal != null) {
      data['data'] = listTotal!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListCreateBillResponse {
  Meta? pagination;
  List<CreateBillModel>? listBillCreate;
  String? message;

  ListCreateBillResponse({this.pagination, this.listBillCreate, this.message});

  ListCreateBillResponse.fromJson(Map<String, dynamic> json) {
    pagination = json['pagination'] != null ? Meta.fromJson(json['pagination']) : null;
    if (json['data'] != null) {
      listBillCreate = <CreateBillModel>[];
      json['data'].forEach((v) {
        listBillCreate!.add(CreateBillModel.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (pagination != null) {
      data['pagination'] = pagination!.toJson();
    }
    if (listBillCreate != null) {
      data['data'] = listBillCreate!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class ListTrackingCustomerDetail{
  List<TrackingCustom>? listTrackingCustomerDetail;
  String? message;

  ListTrackingCustomerDetail({ this.listTrackingCustomerDetail, this.message});

  ListTrackingCustomerDetail.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      listTrackingCustomerDetail = <TrackingCustom>[];
      json['data'].forEach((v) {
        listTrackingCustomerDetail!.add(TrackingCustom.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (listTrackingCustomerDetail != null) {
      data['data'] = listTrackingCustomerDetail!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class TrackingCustomerDetailResponse {

  CreateBCTModel? createBCTModel;
  String? message;
  String? error_message;

  TrackingCustomerDetailResponse({this.createBCTModel, this.message,this.error_message});

  TrackingCustomerDetailResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      createBCTModel = CreateBCTModel.fromJson(json['data']);
    }
    message = json['message'];
    error_message = json['error_message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (createBCTModel != null) {
      data['data'] = createBCTModel!;
    }
    data['message'] = message;
    data['error_message'] = error_message;
    return data;
  }
}

class ListCodePackedResponse {
  List<AddTrackingDeliveryBill>? listCodePacked;
  String? message;

  ListCodePackedResponse({ this.listCodePacked, this.message});

  ListCodePackedResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      listCodePacked = <AddTrackingDeliveryBill>[];
      json['data'].forEach((v) {
        listCodePacked!.add(AddTrackingDeliveryBill.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (listCodePacked != null) {
      data['data'] = listCodePacked!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}