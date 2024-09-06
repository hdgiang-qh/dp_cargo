import 'dart:io';

import '../model/model/bank_response.dart';
import '../model/model/transaction.dart';
import '../model/model/transaction_detail.dart';
import '../model/response/list_transaction_response.dart';
import '../model/response/transaction_response.dart';

abstract class TransactionRepository {
  Future<TransactionListResponse> getListTransaction({
    int page,
    int pageSize,
    int? customer_id,
    String? status,
    DateTime? fromDate,
    DateTime? toDate,
  });

  Future<TransactionDetail> getTransactionDetail(int id);

  Future updateTransaction(int id, String status);

  Future<BankData> getBankData();

  Future createTransaction(
    File? file,
    String customerId,
    String customer_transaction_type,
    String customer_transaction_money,
    String customer_transaction_note,
    String? bank_account,
  );
}

abstract class TransactionsRepository {
  Future<TransactionResponse> getListTransactions(
      {int? page,
      int? pageSize,
      String? type,
      String? customerId,
      String? fromDate,
      String? toDate,
      String? status, String? warehouseId});

  Future createTransactions(
      {required Map<String,dynamic> payload} );

  Future<TransactionNameResponse> getTransactionName(
      { String? keyword ,String? warehouseId});

  Future<BankResponse> getBank(
      { String? key,String? warehouseId});

  Future<TransactionResponseDetailResponse> getTransactionDetail(
      {required int id,String? warehouseId});

  Future changeTransaction(
      {required int id,required Map<String,dynamic> payload});

  Future<ListTransactionCustomerDetailResponse> getTransactionCustomerDetail(
      {required int id});
}
