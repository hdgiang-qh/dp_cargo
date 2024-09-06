import '../model/response/list_config_price_response.dart';
import '../model/response/list_config_response.dart';

abstract class ListConfigPriceRepository {
  Future<ListConfigPriceResponse> getListConfigPrice();

  Future<ListeBoxCoeffecientConfigResponse> getListBoxCoefficientConfig();
}
