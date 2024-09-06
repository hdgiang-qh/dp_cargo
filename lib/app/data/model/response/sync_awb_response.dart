import '../model/sync_awb.dart';

class SyncAwbResponse{
  SyncAwb? syncAwb;
  String? message;

  SyncAwbResponse({this.syncAwb, this.message});

  SyncAwbResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      syncAwb = SyncAwb.fromJson(json['data']);
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (syncAwb != null) {
      data['data'] = syncAwb!;
    }
    data['message'] = message;
    return data;
  }
}