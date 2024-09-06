import '../model/transaction.dart';
import '../model/transaction_customer_detail_model.dart';
import 'pagination.dart';

class TransactionResponse {
  Meta? paginations;
  List<Transactions>? transaction;
  String? message;

  TransactionResponse({this.paginations, this.transaction, this.message});

  TransactionResponse.fromJson(Map<String, dynamic> json) {
    paginations =
        json['paginations'] != null ? Meta.fromJson(json['paginations']) : null;
    if (json['data'] != null) {
      transaction = <Transactions>[];
      json['data'].forEach((v) {
        transaction!.add(Transactions.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (paginations != null) {
      data['meta'] = paginations!.toJson();
    }
    if (transaction != null) {
      data['data'] = transaction!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class TransactionResponseDetailResponse {
  Transactions? transaction;
  String? message;

  TransactionResponseDetailResponse({this.transaction, this.message});

  TransactionResponseDetailResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      transaction = Transactions.fromJson(json['data']);
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (transaction != null) {
      data['data'] = transaction;
    }
    data['message'] = message;
    return data;
  }
}

class ListTransactionCustomerDetailResponse {
  Meta? pagination;
  List<TransactionCustomerDetailModel>? transactionCustomerDetail;
  String? message;

  ListTransactionCustomerDetailResponse(
      {this.pagination, this.transactionCustomerDetail, this.message});

  ListTransactionCustomerDetailResponse.fromJson(Map<String, dynamic> json) {
    pagination =
        json['pagination'] != null ? Meta.fromJson(json['pagination']) : null;
    if (json['data'] != null) {
      transactionCustomerDetail = <TransactionCustomerDetailModel>[];
      json['data'].forEach((v) {
        transactionCustomerDetail!
            .add(TransactionCustomerDetailModel.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (pagination != null) {
      data['meta'] = pagination!.toJson();
    }
    if (transactionCustomerDetail != null) {
      data['data'] = transactionCustomerDetail!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class TransactionNameResponse {
  List<TransactionName>? transactionName;
  String? message;

  TransactionNameResponse({this.transactionName, this.message});

  TransactionNameResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      transactionName = <TransactionName>[];
      json['data'].forEach((v) {
        transactionName!.add(TransactionName.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (transactionName != null) {
      data['data'] = transactionName!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class BankResponse {
  List<BankModel>? listBank;
  List<BankModelConfigValueConfig>? listConfig;
  String? message;

  BankResponse({this.listBank, this.listConfig, this.message});

  BankResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      listBank = <BankModel>[];
      json['data'].forEach((v) {
        listBank!.add(BankModel.fromJson(v));
      });
    }

    if (json['data'][0]['configValue']['config'] != null) {
      listConfig = <BankModelConfigValueConfig>[];
      json['data'][0]['configValue']['config'].forEach((v) {
        listConfig!.add(BankModelConfigValueConfig.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (listBank != null) {
      data['data'] = listBank!.map((v) => v.toJson()).toList();
    }
    if (listConfig != null) {
      data['data'][0]['configValue']['config'] =
          listConfig!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}
