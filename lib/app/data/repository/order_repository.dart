import '../model/response/list_order_response.dart';

abstract class OrderRepository {
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
      });

  Future<ListOrderDetailResponse> getOrderDetail({required int id});

  Future createOrder(
      {required Map<String, dynamic> payload});

  Future<ListOrderDetailResponse> updateOrderDetail(
      {required int id, required Map<String, dynamic> updateFields});

  Future deletedOrder({required int id});

}
