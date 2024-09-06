import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import '../model/response/staff_response.dart';

import '../model/request/staff_request.dart';
import '../model/response/list_sale_employee.dart';

part 'staff_data_source.g.dart';

@RestApi()
abstract class StaffDataSource {
  factory StaffDataSource(Dio dio, {String baseUrl}) = _StaffDataSource;

  @GET('/api/employees')
  Future<ListStaffResponse> getListStaff(
    @Query('page') int? page,
    @Query('pageSize') int? pageSize,
    @Query('fullname') String? fullname,
    @Query('phone') String? phone,
    @Query('email') String? email,
    @Query('role') String? role,
    @Query('warehouseVn') String? warehouseVN,
    @Query('warehouse_id') String? warehouseId,
  );

  @GET('/api/employees')
  Future<ListStaffResponse> getListShipper(
    @Query('page') int? page,
    @Query('pageSize') int? pageSize,
    @Query('status') String? status,
    @Query('type') String? type,
  );

  @POST('/api/employees')
  Future addStaff(@Body() Map<String, dynamic> payload);

  @GET('/api/roles/list')
  Future<ListStaffNameResponse> getStaffRoleName(
      @Query('isAdmin') String? isAdmin,
      @Query('warehouse_id') String? warehouseId);

  @GET('/api/employees/{id}')
  Future<DetailStaffResponse> getStaffDetail(
    @Path('id') int id,
  );

  @DELETE('/api/employees/{id}')
  Future deleteStaff(
    @Path('id') int id,
  );

  @PUT('/api/employees/{id}')
  Future updateStaff(@Path('id') int id, @Body() Map<String, dynamic> payload);

  @GET('/api/employees/get-sale')
  Future<ListSaleEmployeeResponse> getListSaleEmployee(
    @Query('search') String? search,
      @Query('role_id') String? idRole,

  );
}
