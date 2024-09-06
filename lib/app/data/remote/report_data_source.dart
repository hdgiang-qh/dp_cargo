import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../model/response/report_response.dart';

part 'report_data_source.g.dart';

@RestApi()
abstract class ReportDataSource {
  factory ReportDataSource(Dio dio, {String baseUrl}) = _ReportDataSource;

  @GET('/api/warehouses/warehouse-config/')
  Future<ListWarehouseResponse> getListWarehouse(
    @Query('warehouseId') String? warehouseId,
  );

  @GET('/api/report/revenue/warehouse/')
  Future<WarehouseResponse> getReportWarehouse(
    @Query('fromDate') String? fromDate,
    @Query('toDate') String? toDate,
    @Query('warehouseId') String? warehouseId,
    @Query('warehouse_id') String? warehouseIds,
  );

  @GET('/api/report/revenue/warehouse/{id}/detail-by-type')
  Future<WarehouseDetailResponse> getReportWarehouseDetail(
    @Path('id') String id,
    @Query('fromDate') String? fromDate,
    @Query('toDate') String? toDate,
    @Query('warehouseId') String? warehouseId,
  );

  @GET('/api/report/revenue/delivery_bill/sale')
  Future<BillSaleResponse> getReportBillSale(
      @Query('page') int? page,
      @Query('pageSize') int? pageSize,
      @Query('orderBy') String? orderBy,
      @Query('fromDate') String? fromDate,
      @Query('toDate') String? toDate,
      @Query("warehouseId") String? warehouseId,
      @Query('warehouse_id') String? warehouseIds,);

  @GET('/api/report/revenue/delivery_bill/sale/{id}')
  Future<BillSaleDetailResponse> getReportBillSaleDetail(
      @Query('fromDate') String? fromDate,
      @Query('toDate') String? toDate,
      @Path('id') String id);

  @GET('/api/report/revenue/delivery_bill/customer')
  Future<BillCustomResponse> getReportBillCustom(
      @Query('page') int? page,
      @Query('pageSize') int? pageSize,
      @Query('orderBy') String? orderBy,
      @Query('fromDate') String? fromDate,
      @Query('toDate') String? toDate,
      @Query("warehouseId") String? warehouseId,
      @Query('warehouse_id') String? warehouseIds,);

  @GET('/api/report/revenue/tracking')
  Future<ChartResponse> getChartValue(
    @Query('fromDate') String? fromDate,
    @Query('toDate') String? toDate,
  );

  @GET('/api/report/exploitation')
  Future<ExploitationResponse> getExploitation(
    @Query('page') int? page,
    @Query('pageSize') int? pageSize,
    @Query('fromDate') String? fromDate,
    @Query('toDate') String? toDate,
    @Query('employee_id') String? employeeId,
  );

  @GET('/api/employees/get-employee-exploit?search=')
  Future<ExploitationEmployeeResponse> getExploitationEmployee();

  @GET('/api/report/revenue/awb')
  Future<AwbResponse> getAwb(
    @Query('page') int? page,
    @Query('pageSize') int? pageSize,
    @Query('fromDate') String? fromDate,
    @Query('toDate') String? toDate,
    @Query('warehouseId') String? warehouseId,
  );
}
