import '../model/awb.dart';

class ListBoxesTrackingResponse {

  AwbBoxData? awbBoxData;
  String? message;

  ListBoxesTrackingResponse({this.awbBoxData, this.message});

  ListBoxesTrackingResponse.fromJson(Map<String, dynamic> json) {
    if (json['data']!= null) {
      awbBoxData = AwbBoxData.fromJson(json['data']);
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (awbBoxData != null) {
      data['data']['boxInfo'] = awbBoxData!;
    }
    data['message'] = message;
    return data;
  }
}