import 'package:get/get.dart';
import 'package:vncss/app/data/repository/repository_impl/staff_repo_impl.dart';
import '../data/repository/authentication_repository.dart';
import '../data/repository/awb_repository.dart';
import '../data/repository/bill_of_lading_reponsitory.dart';
import '../data/repository/coefficient_reponsitory.dart';
import '../data/repository/customer_repository.dart';
import '../data/repository/delivery_bill_repository.dart';
import '../data/repository/list_boxes_tracking_repository.dart';
import '../data/repository/list_config_price_repository.dart';
import '../data/repository/order_repository.dart';
import '../data/repository/overview_repository.dart';
import '../data/repository/repository_impl/authentication_repo_impl.dart';
import '../data/repository/repository_impl/awb_repo_impl.dart';
import '../data/repository/repository_impl/bill_of_lading_impl.dart';
import '../data/repository/repository_impl/boxes_tracking_repo_impl.dart';
import '../data/repository/repository_impl/configuration_impl.dart';
import '../data/repository/repository_impl/customer_repo_impl.dart';
import '../data/repository/repository_impl/delivery_bill_repo_impl.dart';
import '../data/repository/repository_impl/list_config_price_repo_impl.dart';
import '../data/repository/repository_impl/order_repo_impl.dart';
import '../data/repository/repository_impl/overview_repo_impl.dart';
import '../data/repository/repository_impl/sync_awb_repo_impl.dart';
import '../data/repository/repository_impl/tracking_repo_impl.dart';
import '../data/repository/repository_impl/total_status_repo_impl.dart';
import '../data/repository/repository_impl/transaction_repo_impl.dart';
import '../data/repository/repository_impl/transactions_repo_impl.dart';
import '../data/repository/repository_impl/report_repo_impl.dart';
import '../data/repository/staff_repository.dart';
import '../data/repository/sync_awb_repository.dart';
import '../data/repository/tracking_repository.dart';
import '../data/repository/total_status_repository.dart';
import '../data/repository/transaction_reposioty.dart';
import '../data/repository/report_repository.dart';

class RepositoryBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthenticationRepository>(() => AuthenticationRepoImpl(),
        fenix: true);
    Get.lazyPut<OrderRepository>(() => OrderRepoImpl(), fenix: true);
    Get.lazyPut<DeliveryBillRepository>(() => DeliveryBillRepoImpl(),
        fenix: true);
    Get.lazyPut<TrackingsRepository>(() => TrackingRepoImpl(), fenix: true);
    Get.lazyPut<ReportRepository>(() => ReportRepoImpl(), fenix: true);
    Get.lazyPut<TransactionRepository>(() => TransactionRepoImpl(),
        fenix: true);
    Get.lazyPut<TransactionsRepository>(() => TransactionsRepoImpl(),
        fenix: true);
    Get.lazyPut<CustomerRepository>(() => CustomerRepoImpl(), fenix: true);
    Get.lazyPut<StaffRepository>(() => StaffRepoImpl(), fenix: true);
    Get.lazyPut<BillOfLadingRepository>(() => BillOfLadingRepoImpl(),
        fenix: true);
    Get.lazyPut<AwbRepository>(() => AwbRepoImpl(), fenix: true);
    Get.lazyPut<ListBoxesTrackingRepository>(() => BoxesTrackingRepoImpl(), fenix: true);
    Get.lazyPut<TotalStatusRepository>(() => TotalStatusRepoImpl(), fenix: true);
    Get.lazyPut<OverviewRepository>(() => OverviewRepoImpl(), fenix: true);
    Get.lazyPut<ListConfigPriceRepository>(() => ListConfigPriceRepoImpl(), fenix: true);
    Get.lazyPut<ConfigurationReponsitory>(() => ConfigurationImpl(), fenix: true);

    Get.lazyPut<SyncAwbRepository>(() => SyncAwbRepoImpl(), fenix: true);
  }
}
