import 'package:get/get.dart';
import 'package:vncss/app/core/base/base_controller.dart';
import 'package:vncss/app/core/base/paging_controller.dart';
import 'package:vncss/app/core/widget/dialog/app_snackbar.dart';
import 'package:vncss/app/modules/main/controllers/main_controller.dart';
import 'package:vncss/app/modules/util/images.dart';

import '../../../data/model/model/staff.dart';
import '../../../data/model/response/coefficient_response.dart';
import '../../../data/repository/coefficient_reponsitory.dart';

class RightsController extends BaseController {
  final pagingController = PagingController<StaffRoleName>();
  final coefficientRepo = Get.find<ConfigurationReponsitory>();
  final listConfigurationGroup = <StaffRoleName>[].obs;

  final controllerMain = Get.find<MainController>();

  final svgPath = [
    Images.truck,
    Images.customer_support,
    Images.calculator,
    Images.pc,
    Images.customer2,
    Images.bag_suicase,
    Images.sales_staff,
    Images.superadmin
  ];

  String rolePath(String title) {
    String i = '';
    switch (title) {
      case 'shipper':
        i = Images.truck;
      case 'admin':
        i = Images.superadmin;
      case 'nhan_vien_cskh':
        i = Images.customer_support;
      case 'ke_toan':
        i = Images.calculator;
      case "nhan_vien_khai_thac":
        i = Images.pc;
      case 'quan_ly':
        i = Images.bag_suicase;
      case "nhan_vien_kinh_doanh":
        i = Images.sales_staff;
      case "khach_hang":
        i = Images.customer2;
      default:
        i = Images.person2;
    }
    return i;
  }

  var isLoading = false.obs;

  Future<List<StaffRoleName>>? getConfigurationGroup() async{
    try {
      isLoading.value = true;
      final data = await coefficientRepo.getConfigurationGroup(
          warehouseId: controllerMain.warehouseId == 0
              ? null
              : controllerMain.warehouseId.toString());
      listConfigurationGroup.value = data.listCoeGroup ?? [];
      return listConfigurationGroup;
    } catch (error) {
      rethrow;
    } finally {
      isLoading.value = false;
    }
  }

  void deleteConfigurationGroup(int id) {
    callDataService(
      coefficientRepo.deleteConfigurationGroup(id: id),
      onSuccess: (_) {
        AppSnackBar.showSuccess(message: 'Xóa thành công');
      },
    );
  }

  onSelected() {}

  onRefreshPage() {
    pagingController.initRefresh();
    listConfigurationGroup.clear();
    getConfigurationGroup();
  }

  onLoadNextPage() {
    logger.i("On load next");
  }

  @override
  void onInit() {
    getConfigurationGroup();
    super.onInit();
  }
}
