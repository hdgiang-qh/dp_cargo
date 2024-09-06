import 'package:get/get.dart';
import 'package:vncss/app/core/base/base_controller.dart';
import '../../../../data/model/model/tracking_customer_detail_model.dart';
import '../../../../data/model/response/list_trackings_response.dart';
import '../../../../data/repository/tracking_repository.dart';

class TrackingCustomerDetailController extends BaseController {

  final trackingCustomerDetailRepo = Get.find<TrackingsRepository>();
  final trackingCustomerDetail = <TrackingCustomerDetailModel>[].obs;

  int? id;

  @override
  void onInit() {
    id = argument['id'];
    getTrackingCustomerDetail();
    super.onInit();
  }
  getTrackingCustomerDetail() {
    if (id == null) {
      showMessage("Lỗi id");
    }
    callDataService<ListTrackingCustomerResponse>(
        trackingCustomerDetailRepo.getTrackingCustomerDetail(id: id!), onSuccess: (data) {
      trackingCustomerDetail.value = data.listTrackingCustomer!;
    }, onError: (error) {
      showErrorMessage(error.toString());
    });
  }
}
