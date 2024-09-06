import 'package:get/get.dart';
import 'package:vncss/app/data/remote/configuration_data_source.dart';

import '../data/remote/authentication_data_source.dart';
import '../data/remote/awb_data_source.dart';
import '../data/remote/bill_of_lading_data_source.dart';
import '../data/remote/boxes_tracking_data_source.dart';
import '../data/remote/customer_data_source.dart';
import '../data/remote/customers_data_source.dart';
import '../data/remote/delivery_bill_data_source.dart';
import '../data/remote/list_config_price_data_source.dart';
import '../data/remote/orders_data_source.dart';
import '../data/remote/overview_data_source.dart';
import '../data/remote/staff_data_source.dart';
import '../data/remote/tracking_data_source.dart';
import '../data/remote/transaction_data_source.dart';
import '../data/remote/transactions_data_source.dart';
import '../data/remote/report_data_source.dart';
import '../network/dio_provider.dart';

class RemoteSourceBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthenticationDataSource>(
        () => AuthenticationDataSource(DioProvider.getDio()),
        fenix: true);
    Get.lazyPut<OrderDataSource>(() => OrderDataSource(DioProvider.getDio()),
        fenix: true);
    Get.lazyPut<DeliveryBillDataSource>(
        () => DeliveryBillDataSource(DioProvider.getDio()),
        fenix: true);
    Get.lazyPut<TrackingsDataSource>(
        () => TrackingsDataSource(DioProvider.getDio()),
        fenix: true);
    Get.lazyPut<ReportDataSource>(
        () => ReportDataSource(DioProvider.getDio()),
        fenix: true);
    Get.lazyPut<TransactionDataSource>(
        () => TransactionDataSource(DioProvider.getDio()),
        fenix: true);
    Get.lazyPut<TransactionsDataSource>(
            () => TransactionsDataSource(DioProvider.getDio()),
        fenix: true);
    Get.lazyPut<CustomerDataSource>(
            () => CustomerDataSource(DioProvider.getDio()),
        fenix: true);
    Get.lazyPut<StaffDataSource>(
            () => StaffDataSource(DioProvider.getDio()),
        fenix: true);
    Get.lazyPut<BillOfLadingDataSource>(
            () => BillOfLadingDataSource(DioProvider.getDio()),
        fenix: true);
    Get.lazyPut<CustomersDataSource>(
            () => CustomersDataSource(DioProvider.getDio()),
        fenix: true);
    Get.lazyPut<AWBDataSource>(
            () => AWBDataSource(DioProvider.getDio()),
        fenix: true);
    Get.lazyPut<BoxesTrackingDataSource>(
            () => BoxesTrackingDataSource(DioProvider.getDio()),
        fenix: true);
    Get.lazyPut<OverviewDataSource>(
            () => OverviewDataSource(DioProvider.getDio()),
        fenix: true);
    Get.lazyPut<ListConfigPriceDataSource>(
            () => ListConfigPriceDataSource(DioProvider.getDio()),
        fenix: true);
    Get.lazyPut<ConfigurationDataSource>(
            () => ConfigurationDataSource(DioProvider.getDio()),
        fenix: true);

  }
}
