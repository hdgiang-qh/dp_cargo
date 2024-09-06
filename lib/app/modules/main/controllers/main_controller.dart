import 'dart:io';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vncss/app/modules/delivery_bills/delivery/list_delivery/controller/delivery_controller.dart';
import '../../../core/snackbars/loaders.dart';
import '../../../data/model/model/delivery_bill.dart';
import '../../../data/model/model/staff.dart';
import '../../../data/model/response/list_delivery_bill.dart';
import '../../../data/model/response/user.dart';
import '../../../data/repository/authentication_repository.dart';
import '../../../data/repository/delivery_bill_repository.dart';
import '../../../data/service/common_service.dart';
import '/app/core/base/base_controller.dart';
import '/app/modules/main/model/menu_code.dart';

class MainController extends BaseController {
  final _selectedMenuCodeController = MenuCode.HOME.obs;

  MenuCode get selectedMenuCode => _selectedMenuCodeController.value;
  final config = Get.find<CommonApi>();
  final deliveryBillRepo = Get.find<DeliveryBillRepository>();
  final listDeliveryBill = <DeliveryBill>[].obs;
  final AuthenticationRepository authenticationRepository = Get.find();
  final userLogin = UserInfo().obs;
  final listWh = <StaffWarehouseVN>[].obs;

  final phoneNumber = ''.obs;
  int warehouseId = 0;
  int sss = 0;

  final lifeCardUpdateController = false.obs;

  onMenuSelected(MenuCode menuCode) async {
    _selectedMenuCodeController.value = menuCode;
  }

  Future<void> phone() async {
    final String? phoneNumberValue = config
        .configData.value.configValue!.config!.first.phoneNumber
        ?.replaceAll(".", "");
    if (phoneNumberValue == null || phoneNumberValue.isEmpty) {
      print('Phone number is not available.');
      return;
    }
    if (!isValidPhoneNumber(phoneNumberValue)) {
      print('Invalid phone number: $phoneNumberValue');
      return;
    }
    final Uri uri = Uri(
      scheme: 'tel',
      path: '0${phoneNumberValue.substring(1)}',
    );

    try {
      final bool launched = await launchUrl(uri);
      if (!launched) {
        print('Could not launch $uri');
      }
    } catch (e) {
      print('Error calling phone number: $e');
    }
  }

  bool isValidPhoneNumber(String phoneNumber) {
    final RegExp regExp = RegExp(r'^\d{10,}$');
    return regExp.hasMatch(phoneNumber);
  }

  void getListDeliveryBill(String code) {
    callDataService<ListDeliveryBillResponse>(
      deliveryBillRepo.getListDeliveryBill(code: code),
      onSuccess: (data) {
        listDeliveryBill.value = data.deliveryBills ?? [];
      },
    );
  }

  void getInforUser() {
    callDataService<UserInfo>(
      authenticationRepository.getUserInfo(),
      onSuccess: (data) {
        userLogin.value = data;
        listWh.value = data.warehouseVN!;
        if(userLogin.value.warehouseVN != null){
          warehouseId = userLogin.value.warehouseVN?[0].id ?? 0;
        }
        Get.find<DeliveryController>().onRefreshPage();
      },
    );
  }

  Future<void> uploadDeliveredImage(
      {required int id,
      required String deliveredImageUrl,
      required String shipper_note}) async {
    callDataService(
        deliveryBillRepo.uploadDeliveredImage(
            id: id,
            deliveredImageUrl: deliveredImageUrl,
            shipper_note: shipper_note), onSuccess: (_) {
      Loaders.successSnackBar(title: 'Thành Công');
    });
  }


  void updateDeliveryBill(
      {required File file, required int id, required String shipper_note}) {
    try {
      callDataService(
          authenticationRepository.uploadFile(
              objectType: 'delivered_image',
              objectId: 'delivery_bill_$id',
              type: 'regular_image',
              file: file), onSuccess: (url) async {
        uploadDeliveredImage(
            id: id, deliveredImageUrl: url, shipper_note: shipper_note);
      });
    } catch (e) {
      Loaders.errorSnackBar(title: e);
    }
  }

  @override
  void onInit() {
    // final user = Get.find<AuthService>().userInfo.value?.id;
    //Get.find<NotificationService>().fcmSubscribe('mobileuser_$user');
    // getVnDeliveryBoxes();
    getInforUser();
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
