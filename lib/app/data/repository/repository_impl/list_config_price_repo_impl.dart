import 'package:get/get.dart';

import '../../../core/base/base_repo_handle.dart';
import '../../model/response/list_config_price_response.dart';
import '../../model/response/list_config_response.dart';
import '../../remote/list_config_price_data_source.dart';
import '../list_config_price_repository.dart';

class ListConfigPriceRepoImpl extends BaseRepoSource
    implements ListConfigPriceRepository {
  final ListConfigPriceDataSource _dataSource = Get.find<ListConfigPriceDataSource>();

  @override
  Future<ListConfigPriceResponse> getListConfigPrice() {
    return callApiWithErrorHandleRepo(_dataSource.getListConfigPrice());
  }

  @override
  Future<ListeBoxCoeffecientConfigResponse> getListBoxCoefficientConfig() {
    return callApiWithErrorHandleRepo(_dataSource.getListBoxCoefficientConfig());
  }


}
