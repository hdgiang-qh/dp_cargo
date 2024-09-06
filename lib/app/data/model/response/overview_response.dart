import '../model/overview.dart';

class OverviewResponse {
  OverviewModel? overviewModel;
  String? message;

  OverviewResponse({this.overviewModel, this.message});

  OverviewResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      overviewModel = OverviewModel.fromJson(json['data']);
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (overviewModel != null) {
      data['data'] = overviewModel!;
    }
    data['message'] = message;
    return data;
  }
}
