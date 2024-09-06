import 'package:get/get.dart';

import '../../../core/base/base_repo_handle.dart';
import '../../model/response/list_total_status.dart';
import '../../remote/awb_data_source.dart';
import '../../remote/orders_data_source.dart';
import '../../remote/tracking_data_source.dart';
import '../total_status_repository.dart';

class TotalStatusRepoImpl extends BaseRepoSource implements TotalStatusRepository {
  final TrackingsDataSource _dataSourceTracking = Get.find<TrackingsDataSource>();
  final OrderDataSource _dataSourceOrder = Get.find<OrderDataSource>();
  final AWBDataSource _dataSourceAwb = Get.find<AWBDataSource>();


  @override
  Future<ListTrackingStatusResponse> getListTrackingStatus(
      {String? code,
        String? exploitStatus,
        String? customer,
        bool? undefinedCustomer,
        String? fromDate,
        String? toDate,
        String? filterDateBy
      }) {
    return callApiWithErrorHandleRepo(_dataSourceTracking.getListTrackingStatus(
        exploitStatus, code, customer, undefinedCustomer, fromDate, toDate, filterDateBy));
  }

  Future<ListOrderStatusResponse> getListOrderStatus(
      {int? page,
        int? pageSize,
        String? code,
        String? trackingCode,
        String? fromDate,
        String? toDate,
        String? filterDateBy,
        int? exploitStatus,
        bool? isGettingOrder,

      }) {
      return callApiWithErrorHandleRepo(_dataSourceOrder.getOrderStatus(
        page,
        pageSize,
        code,
        trackingCode,
        fromDate,
        toDate,
        filterDateBy,
        exploitStatus,
        isGettingOrder
         ));
  }

  Future<ListAwbStatusResponse> getListAwbStatus(
      {String? keyWords,
        int? exploitStatus,
        String? boxCode,
        String? trackingCode,
      }) {
    return callApiWithErrorHandleRepo(_dataSourceAwb.getListAwbStatus(
      keyWords,
      exploitStatus,
      boxCode,
      trackingCode,
    ));
  }
}
