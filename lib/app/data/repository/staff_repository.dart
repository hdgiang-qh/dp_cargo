import '../model/request/staff_request.dart';
import '../model/response/list_sale_employee.dart';
import '../model/response/staff_response.dart';

abstract class StaffRepository {
  Future<ListStaffResponse> getListStaff({
    int? page,
    int? pageSize,
    String? fullname,
    String? phone,
    String? email,
    String? role,
    String? warehouseVN,
    String? warehouseId,
  });

  Future<ListStaffResponse> getListShipper({
    int? page,
    int? pageSize,
    String? status,
    String? type,
  });

  Future addStaff({required Map<String, dynamic> payload});

  Future<ListStaffNameResponse> getStaffRoleName(
      {String? isAdmin, String? warehouseId});

  Future<DetailStaffResponse> getStaffDetail({required int id});

  Future deleteStaff({required int id});

  Future updateStaff({required int id, required Map<String, dynamic> payload});

  Future<ListSaleEmployeeResponse> getListSaleEmployee({String? search, String? idRole});
}
