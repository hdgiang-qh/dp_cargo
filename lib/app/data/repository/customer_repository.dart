
import '../model/model/customers.dart';
import '../model/response/list_customer_response.dart';

abstract class CustomerRepository {
  Future<ListDataCustomerResponse> getListCustomer(
      { int? page,
        int? pageSize,
        String? fullname,
        String? nickName,
        String? sale,
        bool? isDebt,
        bool? undefinedSale,
        bool? isCard,
        bool? isBlocked,
            String? orderBy,
        String? warehouse_id

        });
  Future<Customers> getCustomerDetail({required int id});

  Future updateCustomerDetail({required int id, required Map<String,dynamic> payload});

  Future createCustomer({required Map<String,dynamic> payload});

  Future deleteCustomer({required int? id});

}
