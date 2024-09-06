import '../model/response/report_response.dart';

abstract class ReportRepository {
  Future<ListWarehouseResponse> getListWarehouse({String? warehouseId});

  Future<WarehouseResponse> getListReportWarehouse(
      {String? fromDate, String? toDate, String? warehouseId, String? warehouseIds});

  Future<WarehouseDetailResponse> getListReportWarehouseDetail(
      {required String id, String? fromDate, String? toDate, String? warehouseId});

  Future<BillSaleResponse> getListReportBillSale(
      {int? page,
      int? pageSize,
      String? orderBy,
      String? fromDate,
      String? toDate,
      String? warehouseId,
        String? warehouseIds});

  Future<BillSaleDetailResponse> getListReportBillSaleDetail(
      {String? fromDate, String? toDate,required String id});

  Future<BillCustomResponse> getListReportBillCustom(
      {int? page,
      int? pageSize,
      String? orderBy,
      String? fromDate,
      String? toDate,
      String? warehouseId,String? warehouseIds});

  Future<ChartResponse> getChartValue({String? fromDate, String? toDate});

  Future<ExploitationResponse> getExploitation(
      {int? page, int? pageSize, String? fromDate, String? toDate, String? employeeId});

  Future<ExploitationEmployeeResponse> getExploitationEmployee();

  Future<AwbResponse> getAwb(
      {int? page,
      int? pageSize,
      String? fromDate,
      String? toDate,
      String? warehouseId});
}
