
import '../model/response/list_total_status.dart';

abstract class TotalStatusRepository {

  Future<ListTrackingStatusResponse> getListTrackingStatus({
    String? code,
    String? exploitStatus,
    String? customer,
    bool? undefinedCustomer,
    String? fromDate,
    String? toDate,
    String? filterDateBy
  });

  Future<ListOrderStatusResponse> getListOrderStatus({
    int? page,
    int? pageSize,
    String? code,
    String? trackingCode,
    String? fromDate,
    String? toDate,
    String? filterDateBy,
    int? exploitStatus,
    bool? isGettingOrder,
  });

  Future<ListAwbStatusResponse> getListAwbStatus({
    String? keyWords,
    int? exploitStatus,
    String? boxCode,
    String? trackingCode,

  });
}
