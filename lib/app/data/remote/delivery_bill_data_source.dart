import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

import '../../modules/barcode/model/receive_model.dart';
import '../../modules/barcode/model/success_model.dart';
import '../model/model/delivery_bill_detail.dart';
import '../model/request/create_delivery_bill_request.dart';
import '../model/response/list_delivery_bill.dart';

part 'delivery_bill_data_source.g.dart';

@RestApi()
abstract class DeliveryBillDataSource {
  factory DeliveryBillDataSource(Dio dio, {String baseUrl}) =
      _DeliveryBillDataSource;

  @GET('/api/delivery_bills')
  Future<ListDeliveryBillResponse> getListDeliveryBill(
    @Query('deliveryBillStatus') String? deliveryBillStatus,
    @Query('code') String? code,
    @Query('page') int? page,
    @Query('pageSize') int? pageSize,
    @Query('fromDate') DateTime? fromDate,
    @Query('toDate') DateTime? toDate,
    @Query('customer') String? customer,
    @Query('warehouse_id') String? warehouseId,
  );

  @GET('/api/delivery_bills/waiting_create_delivery_bills')
  Future<ListCreateBillResponse> getListBillCreate(
    @Query('page') int? page,
    @Query('pageSize') int? pageSize,
    @Query('customer') int? customId,
  );

  @GET('/api/customers/{id}')
  Future<TrackingCustomerDetailResponse> getBillCustomTracking(
      @Path('id') int id);

  @GET('/api/delivery_bills/status')
  Future<TotalDeliveryBill> getTotalDelivery(
    @Query('page') int? page,
    @Query('pageSize') int? pageSize,
    @Query('code') String? code,
    @Query('btnFilterStatus') String? btnFilterStatus,
    @Query('deliveryBillStatus') String? deliveryBillStatus,
    @Query('fromDate') DateTime? fromDate,
    @Query('toDate') DateTime? toDate,
    @Query('customer') String? customer,
      @Query('warehouse_id') String? warehouseId,
  );

  @GET('/api/delivery_bills/{id}')
  Future<DeliveryBillDetail> getDeliveryBillDetail(
    @Path('id') int id,
      @Query('warehouse_id') String? warehouseId,
  );

  @PUT('/api/delivery_bills/{id}')
  Future<DeliveryBillDetail> updateDeliveryBillDetail(
    @Path('id') int id,
    @Body() Map<String, dynamic> updateFields,
  );

  @GET('/api/delivery_bills/{id}/tracking_customer_detail')
  Future<ListTrackingCustomerDetail> getListTrackingCustomerDetail(
    @Path('id') int id,
  );

  @GET('/api/delivery_bills/{id}/bill_customer_detail')
  Future<ListDeliveryBillCustomerResponse> getBillCustomerDetail(
    @Path('id') int id,
  );

  @POST('/api/delivery_bills')
  Future addDeliveryBill(@Body() CreateDeliveryBillRequest request);

  @POST('/api/delivery_bills/{id}/create_many_tracking_in_bill')
  Future<AddTrackingDeliveryBill> addTrackingDeliveryBill(
      @Path('id') int id, @Body() Map<String, dynamic> payload);

  @POST('/api/delivery_bills')
  Future<AddTrackingDeliveryBill> createDeliveryBill(
      @Body() Map<String, dynamic> payload);

  @DELETE('/api/delivery_bills/{id}/delete_tracking_in_bill')
  Future<AddTrackingDeliveryBill> deleteTrackingDeliveryBill(
      @Path('id') int id, @Body() Map<String, dynamic> payload);

  @PUT('/api/vn_delivery_boxes/receiving')
  Future receiveBox(@Body() ReceiveModel receiveModel);

  @PUT('/api/vn_delivery_boxes/success')
  Future successBox(@Body() SuccessModel successModel);

  @PUT('/api/delivery_bills/{id}/delivered_image')
  Future uploadDeliveredImage(
    @Path('id') int id,
    @Field('deliveredImageUrl') String deliveredImageUrl,
    @Field('shipper_note') String shipper_note,
  );

  @PUT('/api/delivery_bills/{id}/cancel_delivery_bills')
  Future<AddTrackingDeliveryBill> cancelDeliveryBill(
    @Path('id') int id,
  );

  @PUT('/api/delivery_bills/{id}/skip_approval')
  Future<AddTrackingDeliveryBill> skipApproveDeliveryBill(
    @Path('id') int id,
  );

  @PUT('/api/delivery_bills/{id}/print_delivery_bills')
  Future<AddTrackingDeliveryBill> customApproveDeliveryBill(
    @Path('id') int id,
  );

  @PUT('/api/delivery_bills/{id}/sale_approve_delivery_bills')
  Future<AddTrackingDeliveryBill> saleApproveDeliveryBill(
    @Path('id') int id,
  );

  @PUT('/api/delivery_bills/{id}/accountant_approve_delivery_bills')
  Future<AddTrackingDeliveryBill> accountantApproveDeliveryBill(
    @Path('id') int id,
  );

  @PUT('/api/delivery_bills/{id}/pack_tracking_in_bill')
  Future<AddTrackingDeliveryBill> packTrackingDeliveryBill(
      @Path('id') int id, @Body() Map<String, dynamic> payload);

  @PUT('/api/delivery_bills/{id}/pack_delivery_bills')
  Future<AddTrackingDeliveryBill> packDeliveryBill(
      @Path('id') int id);

  @PUT('/api/delivery_bills/{id}/export_delivery_bills')
  Future<AddTrackingDeliveryBill> exportDeliveryBill(
      @Path('id') int id, @Body() Map<String, dynamic> payload);

  @GET('/api/delivery_bills/search')
  Future<ListCodePackedResponse> searchKeyword(
      @Query('keyword') String? keyword);

  @PUT('/api/delivery_bills/{id}/assign_shipper')
  Future assignShipper(
      @Path('id') int id, @Body() Map<String, dynamic> payload);

  @PUT('/api/delivery_bills/{id}/failed_delivery_bills')
  Future<String> failedDeliveryBill(
    @Path('id') int id,
  );

  @PUT('/api/delivery_bills/{id}/finish_delivery_bills')
  Future finishDeliveryBill(
    @Path('id') int id,
  );
}
