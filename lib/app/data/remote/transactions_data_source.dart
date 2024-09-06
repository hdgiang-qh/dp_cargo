import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../model/model/transaction.dart';
import '../model/response/transaction_response.dart';

part 'transactions_data_source.g.dart';

@RestApi()
abstract class TransactionsDataSource {
  factory TransactionsDataSource(Dio dio, {String baseUrl}) =
      _TransactionsDataSource;

  @GET('/api/transactions')
  Future<TransactionResponse> getListTransactions(
    @Query('page') int? page,
    @Query('pageSize') int? pageSize,
    @Query('type') String? type,
    @Query('customer_id') String? customerId,
    @Query('fromDate') String? fromDate,
    @Query('toDate') String? toDate,
    @Query('status') String? status,
    @Query('warehouse_id') String? warehouseId,
  );

  @POST('/api/transactions')
  Future createTransactions(@Body() Map<String, dynamic> payload);

  @GET('/api/customers/search')
  Future<TransactionNameResponse> getTransactionName(
    @Query('keyword') String? keyword,
    @Query('warehouse_id') String? warehouseId,
  );

  @GET('/api/general_configs/list')
  Future<BankResponse> getBank(
    @Query('key') String? key,
      @Query('warehouse_id') String? warehouseId,
  );

  @GET('/api/transactions/{id}/')
  Future<TransactionResponseDetailResponse> getTransactionDetail(
    @Path('id') int id,
      @Query('warehouse_id') String? warehouseId,
  );

  @PUT('/api/transactions/{id}/')
  Future changeTransaction(
      @Path('id') int id, @Body() Map<String, dynamic> payload);

  @GET('/api/transactions/{id}/customer-detail')
  Future<ListTransactionCustomerDetailResponse> getTransactionCustomerDetail(
    @Path('id') int id,
  );
}
