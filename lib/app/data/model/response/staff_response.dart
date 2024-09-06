import 'package:vncss/app/data/model/response/pagination.dart';


import '../model/staff.dart';
import '../model/staff_detail.dart';

class ListStaffResponse {
  Meta? meta;
  List<Staff>? staff;
  String? message;
  String? error_message;

  ListStaffResponse({this.meta, this.staff, this.message,this.error_message});

  ListStaffResponse.fromJson(Map<String, dynamic> json) {
    meta = json['paginations'] != null ? Meta.fromJson(json['paginations']) : null;
    if (json['data'] != null) {
      staff = <Staff>[];
      json['data'].forEach((v) {
        staff!.add(Staff.fromJson(v));
      });
    }
    message = json['message'];
    error_message = json['error_message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (meta != null) {
      data['paginations'] = meta!.toJson();
    }
    if (staff != null) {
      data['data'] = staff!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    data['error_message'] = error_message;
    return data;
  }
}

class DetailStaffResponse {

  StaffDetailModel? detailStaff;
  String? message;
  String? error_message;

  DetailStaffResponse({this.detailStaff, this.message,this.error_message});

  DetailStaffResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      detailStaff = StaffDetailModel.fromJson(json['data']);
    }
    message = json['message'];
    error_message = json['error_message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (detailStaff != null) {
      data['data'] = detailStaff!;
    }
    data['message'] = message;
    data['error_message'] = error_message;
    return data;
  }
}

class ListStaffNameResponse {
  List<StaffRoleName>? staffRoleName;
  String? message;

  ListStaffNameResponse({this.staffRoleName, this.message});
  ListStaffNameResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      staffRoleName = <StaffRoleName>[];
      json['data'].forEach((v) {
        staffRoleName!.add(StaffRoleName.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (staffRoleName != null) {
      data['data'] = staffRoleName!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;

    return data;
  }
}

