import '../model/model/exploit_tracking.dart';
import '../model/model/tracking.dart';
import '../model/model/tracking_new.dart';
import '../model/request/create_tracking_request.dart';
import '../model/response/list_trackings_response.dart';

abstract class TrackingsRepository {
  Future<ListTrackingsResponse> getListTracking(
      {String? exploitStatus,
      String? code,
      int? page,
      int? pageSize,
      String? fromDate,
      String? toDate,
        String? customer,
        bool? undefinedCustomer,
        String? filterDateBy,
        String? warehouse_id
      });

  Future<SearchTrackingResponse> getListSearchTracking({
    String? code,String? warehouseID
  });

  Future<ListTrackingsResponse> getListPublicTrackings({
    String? code,
    String? customerPhoneNumber,
    int? page,
    int? pageSize,
  });

  Future<ListDetailTrackingResponse> getTrackingsDetail({required int id});

  Future<UpdateTracking> updateTrackingDelivery(
      {required int id, required Map<String, dynamic> updateFields});

  Future updateTrackingDetail(
      {required int id, required Map<String, dynamic> updateFields});

  Future checkRequest(
      {required int id, required Map<String, dynamic> payload});

  Future<Trackings> updateBoxTracking(
      {required int id, required Map<String, dynamic> updateFields});

  Future createBoxTracking(
      {required int id, required Map<String, dynamic> createFields});

  Future createTracking(
      {required dynamic createFields});

  Future syncTracking();

  Future deleteTracking({required int? id});

  Future<ExploitTracking> exploitTracking(
      {required int id, required Map<String, dynamic> exploitFields});

  Future<ListDetailTrackingResponse> getAwbTracking({required int id});

  Future<ListTrackingCustomerResponse> getTrackingCustomerDetail(
      {required int id});

  Future<ListTrackingTypeResponse> getTrackingType();

  Future<String> addTracking({required CreateTrackingRequest request});

  Future<String> deletedTracking({required int id});
}
