import 'package:get/get.dart';
import 'package:vncss/app/data/model/request/staff_request.dart';
import 'package:vncss/app/data/model/response/staff_response.dart';

import '../../../core/base/base_repo_handle.dart';
import '../../model/response/list_sale_employee.dart';
import '../../remote/staff_data_source.dart';
import '../staff_repository.dart';

class StaffRepoImpl extends BaseRepoSource implements StaffRepository {
  final StaffDataSource _dataSource = Get.find<StaffDataSource>();

  @override
  Future<ListStaffResponse> getListStaff(
      {int? page,
      int? pageSize,
      String? fullname,
      String? phone,
      String? email,
      String? role,
        String? warehouseVN,
      String? warehouseId,

      }) {
    return callApiWithErrorHandleRepo(_dataSource.getListStaff(
        page, pageSize, fullname, phone, email, role, warehouseVN,warehouseId,));
  }

  @override
  Future<ListStaffResponse> getListShipper(
      {int? page, int? pageSize, String? status, String? type}) {
    return callApiWithErrorHandleRepo(
        _dataSource.getListShipper(page, pageSize, status, type));
  }

  @override
  Future addStaff({required Map<String, dynamic> payload}) {
    return callApiWithErrorHandleRepo(_dataSource.addStaff(payload));
  }

  @override
  Future<ListStaffNameResponse> getStaffRoleName({String? isAdmin,String? warehouseId}) async {
    return callApiWithErrorHandleRepo(_dataSource.getStaffRoleName(isAdmin,warehouseId));
  }

  @override
  Future<DetailStaffResponse> getStaffDetail({required int id}) async {
    return callApiWithErrorHandleRepo(_dataSource.getStaffDetail(id));
  }

  @override
  Future<ListSaleEmployeeResponse> getListSaleEmployee({String? search, String? idRole}) async {
    return callApiWithErrorHandleRepo(_dataSource.getListSaleEmployee(search, idRole));
  }

  @override
  Future deleteStaff({required int id}) {
    return callApiWithErrorHandleRepo(_dataSource.deleteStaff(id));
  }

  @override
  Future updateStaff({required int id, required Map<String, dynamic> payload}) {
    return callApiWithErrorHandleRepo(_dataSource.updateStaff(id, payload));
  }

// @override
// Future<List<TrackingsBill>> getDeliveryBillTracking() async {
//   return callApiWithErrorHandleApiData(_dataSource.getDeliveryBillTracking());
// }

// @override
// Future addDeliveryBill({required CreateDeliveryBillRequest request}) {
//   return callApiWithErrorHandleRepo(_dataSource.addDeliveryBill(request));
// }
//
// @override
// Future<String> cancelDeliveryBill({required int id}) {
//   return callApiWithErrorHandleRepo(_dataSource.cancelDeliveryBill(id));
// }
//
// @override
// Future receive({required ReceiveModel receiveModel}) {
//   return callApiWithErrorHandleRepo(_dataSource.receiveBox(receiveModel));
// }
//
// @override
// Future uploadDeliveredImage({required int id, required String deliveredImageUrl, required String shipper_note}) {
//   return callApiWithErrorHandleRepo(_dataSource.uploadDeliveredImage(id, deliveredImageUrl, shipper_note));
// }
//
// @override
// Future success({required SuccessModel successModel}) {
//   return callApiWithErrorHandleRepo(_dataSource.successBox(successModel));
// }
}
