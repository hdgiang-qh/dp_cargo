import 'package:get/get.dart';

import '../../../core/base/base_repo_handle.dart';
import '../../model/model/customers.dart';
import '../../model/response/list_customer_response.dart';
import '../../remote/customers_data_source.dart';
import '../customer_repository.dart';

class CustomerRepoImpl extends BaseRepoSource implements CustomerRepository {
  final CustomersDataSource _dataSource = Get.find<CustomersDataSource>();

  @override
  Future<ListDataCustomerResponse> getListCustomer(
      {int? page,
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

      }) {
    return callApiWithErrorHandleRepo(_dataSource.getListCustomer(
        page,
        pageSize,
        fullname,
        nickName,
        sale,
        isDebt,
        undefinedSale,
        isCard,
        isBlocked,
        orderBy,
        warehouse_id
    ));
  }

  @override
  Future<Customers> getCustomerDetail({required int id}) async {
    return callApiWithErrorHandleApiData(_dataSource.getCustomerDetail(id));
  }

  Future updateCustomerDetail({required int id, required Map<String, dynamic> payload}) async {
    return callApiWithErrorHandleRepo(_dataSource.updateCustomerDetail(id, payload));
  }

  Future createCustomer({required Map<String, dynamic> payload}) async {
    return callApiWithErrorHandleRepo(_dataSource.createCustomer(payload));
  }

  @override
  Future deleteCustomer({required int? id}) {
    return callApiWithErrorHandleRepo(_dataSource.deleteCustomer(id));
  }
}
