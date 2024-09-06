import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../model/model/bank_response.dart';
import '../model/model/transaction_detail.dart';
import '../model/response/api_response_data.dart';
import '../model/response/list_transaction_response.dart';

part 'transaction_data_source.g.dart';

@RestApi()
abstract class TransactionDataSource {
  factory TransactionDataSource(Dio dio, {String baseUrl}) = _TransactionDataSource;

  @GET('/api/transactions')
  Future<TransactionListResponse> getListTransaction({
    @Query('page') int? page,
    @Query('pageSize') int? pageSize,
    @Query('customer_id') int? customer_id,
    @Query('type') String? status,
    @Query('fromDate') DateTime? fromDate,
    @Query('toDate') DateTime? toDate,
  });

  @GET('/api/transactions/{id}')
  Future<ApiResponseData<TransactionDetail>> getTransactionDetail(@Path('id') int id);

  @PUT('/api/transactions/{id}')
  Future<ApiResponseData> updateTransaction(@Path('id') int id, @Field('status') String status);

  @GET('/api/general_configs/list?key=BANK_ACCOUNT_CONFIG')
  Future<ApiResponseData<List<BankData>>> getListBank();

  @POST('/api/transactions')
  Future createTransaction(
      @Part(name: 'customer_id') String customerId,
      @Part(name: 'customer_transaction_type') String customer_transaction_type,
      @Part(name: 'customer_transaction_money') String customer_transaction_money,
      @Part(name: 'customer_transaction_note') String customer_transaction_note,
      @Part(name: 'bank_account') String? bank_account,
      {@Part(name: 'file') File? file});
}



