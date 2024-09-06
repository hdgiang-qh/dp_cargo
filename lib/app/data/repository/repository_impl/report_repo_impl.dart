

import 'package:get/get.dart';

import '../../../core/base/base_repo_handle.dart';
import '../../model/response/report_response.dart';
import '../../remote/report_data_source.dart';
import '../report_repository.dart';

class ReportRepoImpl extends BaseRepoSource implements ReportRepository {
  final ReportDataSource _dataSource = Get.find<ReportDataSource>();

  @override
  Future<ListWarehouseResponse> getListWarehouse({String? warehouseId}) {
    return callApiWithErrorHandleRepo(_dataSource.getListWarehouse(warehouseId));
  }

  @override
  Future<WarehouseResponse> getListReportWarehouse(
      {String? fromDate, String? toDate, String? warehouseId, String? warehouseIds}) {
    return callApiWithErrorHandleRepo(
        _dataSource.getReportWarehouse(fromDate, toDate, warehouseId,warehouseIds));
  }

  @override
  Future<WarehouseDetailResponse> getListReportWarehouseDetail(
      {required String id, String? fromDate, String? toDate, String? warehouseId}) {
    return callApiWithErrorHandleRepo(
        _dataSource.getReportWarehouseDetail(id, fromDate, toDate, warehouseId));
  }

  @override
  Future<BillSaleResponse> getListReportBillSale(
      {int? page,
      int? pageSize,
      String? orderBy,
      String? fromDate,
      String? toDate,
        String? warehouseId,String? warehouseIds}) {
    return callApiWithErrorHandleRepo(_dataSource.getReportBillSale(
        page, pageSize, orderBy, fromDate, toDate,warehouseId,warehouseIds));
  }
  @override
  Future<BillSaleDetailResponse> getListReportBillSaleDetail(
      {String? fromDate,
        String? toDate,required String id}) {
    return callApiWithErrorHandleRepo(_dataSource.getReportBillSaleDetail(fromDate, toDate,id));
  }

  @override
  Future<BillCustomResponse> getListReportBillCustom(
      {int? page,
      int? pageSize,
      String? orderBy,
      String? fromDate,
      String? toDate,
        String? warehouseId,
        String? warehouseIds}) {
    return callApiWithErrorHandleRepo(_dataSource.getReportBillCustom(
        page, pageSize, orderBy, fromDate, toDate,warehouseId,warehouseIds));
  }

  @override
  Future<ChartResponse> getChartValue({String? fromDate, String? toDate}) {
    return callApiWithErrorHandleRepo(
        _dataSource.getChartValue(fromDate, toDate));
  }

  @override
  Future<ExploitationResponse> getExploitation(
      {int? page, int? pageSize, String? fromDate, String? toDate,String? employeeId}) {
    return callApiWithErrorHandleRepo(
        _dataSource.getExploitation(page, pageSize, fromDate, toDate,employeeId));
  }

  @override
  Future<ExploitationEmployeeResponse> getExploitationEmployee() {
    return callApiWithErrorHandleRepo(
        _dataSource.getExploitationEmployee());
  }

  @override
  Future<AwbResponse> getAwb(
      {int? page,
      int? pageSize,
      String? fromDate,
      String? toDate,
      String? warehouseId}) {
    return callApiWithErrorHandleRepo(
        _dataSource.getAwb(page, pageSize, fromDate, toDate, warehouseId));
  }
}
