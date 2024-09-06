import 'package:get/get.dart';

import '../../../core/base/base_repo_handle.dart';
import '../../model/response/list_order_response.dart';
import '../../remote/orders_data_source.dart';
import '../order_repository.dart';

class OrderRepoImpl extends BaseRepoSource implements OrderRepository {
  final OrderDataSource _dataSource = Get.find<OrderDataSource>();

  @override
  Future<ListOrderResponse> getListOrder(
      {String? fromDate,
        String? toDate,
      String? code,
      String? trackingCode,
      int? exploitedBy,
      String? filterDateBy,
      String? customer,
      int? exploitStatus,
      int? page,
      int? pageSize,
        String? warehouse_id
      }) async {
    return callApiWithErrorHandleRepo(_dataSource.getListOrder(
      fromDate,
      toDate,
      code,
      trackingCode,
      exploitedBy,
      filterDateBy,
      customer,
      exploitStatus,
      page,
      pageSize,
      warehouse_id
    ));
  }

  @override
  Future<ListOrderDetailResponse> getOrderDetail({required int id}) async {
    return callApiWithErrorHandleRepo(_dataSource.getOrderDetail(id));
  }

  @override
  Future<ListOrderDetailResponse> updateOrderDetail(
      {required int id, required Map<String, dynamic> updateFields}) {
    return callApiWithErrorHandleRepo(
        _dataSource.updateOrderDetail(id, updateFields));
  }

  @override
  Future createOrder(
      {required Map<String, dynamic> payload}) {
    return callApiWithErrorHandleRepo(
        _dataSource.createOrder(payload));
  }

  @override
  Future deletedOrder({required int id}) {
    return callApiWithErrorHandleRepo(_dataSource.deletedOrder(id));
  }
}
