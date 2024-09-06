import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vncss/app/core/base/base_controller.dart';
import 'package:vncss/app/core/base/paging_controller.dart';
import 'package:vncss/app/core/widget/dialog/app_snackbar.dart';
import 'package:vncss/app/data/repository/authentication_repository.dart';
import 'package:vncss/app/modules/common_widget/dialog_widget.dart';
import 'package:vncss/app/modules/main/controllers/main_controller.dart';
import 'package:vncss/app/network/exceptions/network_exception.dart';

import '../../../data/model/model/configuration_model.dart';
import '../../../data/model/response/coefficient_response.dart';
import '../../../data/repository/coefficient_reponsitory.dart';

class ConfigurationCommonController extends BaseController {
  final pagingController = PagingController<ConfigurationInformation>();
  final coefficientRepo = Get.find<ConfigurationReponsitory>();
  final listConfigurationCommon = <ConfigurationInformation>[].obs;
  final AuthenticationRepository authenticationRepository = Get.find();

  final controllerMain = Get.find<MainController>();

  final urlLogo = Rxn<String>();

  var isLoading = false.obs;

  void getConfigurationCommon() {
    callDataService<ConfigurationInformationResponse>(
      coefficientRepo.getConfigurationInformation(
          warehouseId: controllerMain.warehouseId == 0
              ? null
              : controllerMain.warehouseId.toString()),
      onSuccess: (data) {
        isLoading.value = true;
        listConfigurationCommon.value = data.listCoeInfor ?? [];
        urlLogo.value =
            data.listCoeInfor![0].configValue!.config![0]!.logoUrl.toString();
        labelController.text =
            data.listCoeInfor![0].configValue!.config![0]!.pageTitle.toString();
        phoneController.text = data
            .listCoeInfor![0].configValue!.config![0]!.phoneNumber
            .toString();
        emailController.text =
            data.listCoeInfor![0].configValue!.config![0]!.email.toString();
        address1Controller.text =
            data.listCoeInfor![0].configValue!.config![0]!.address_1.toString();
        address2Controller.text =
            data.listCoeInfor![0].configValue!.config![0]!.address_2.toString();
        address3Controller.text =
            data.listCoeInfor![0].configValue!.config![0]!.address_3.toString();
        linkZaloController.text =
            data.listCoeInfor![0].configValue!.config![0]!.zaloUrl.toString();
        linkFacebookController.text = data
            .listCoeInfor![0].configValue!.config![0]!.facebookPageUrl
            .toString();
        linkAppStore.text =
            data.listCoeInfor![0].configValue!.config![0]!.app_store.toString();
        linkCHPlay.text =
            data.listCoeInfor![0].configValue!.config![0]!.ch_play.toString();
        scriptHeaderController.text = data
            .listCoeInfor![0].configValue!.config![0]!.scriptHead
            .toString();
        scriptFooterController.text = data
            .listCoeInfor![0].configValue!.config![0]!.scriptFooter
            .toString();
      },
    );
  }

  String? code;
  String? urlImage;

  String generateRandomString(int length) {
    const characters = '0123456789';
    Random random = Random();
    return String.fromCharCodes(Iterable.generate(
      length,
      (_) => characters.codeUnitAt(random.nextInt(characters.length)),
    ));
  }

  onSetValue() {
    code = '1720419${generateRandomString(6)}';
  }

  void uploadAvatar({required File file}) {
    callDataService(
        authenticationRepository.uploadFile(
            objectType: 'news_images',
            objectId: 'news_img_$code',
            type: 'regular_image',
            file: file), onSuccess: (url) {
      urlImage = url;
    });
  }

  TextEditingController labelController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController address1Controller = TextEditingController();
  TextEditingController address2Controller = TextEditingController();
  TextEditingController address3Controller = TextEditingController();
  TextEditingController linkZaloController = TextEditingController();
  TextEditingController linkFacebookController = TextEditingController();
  TextEditingController linkAppStore = TextEditingController();
  TextEditingController linkCHPlay = TextEditingController();
  TextEditingController scriptHeaderController = TextEditingController();
  TextEditingController scriptFooterController = TextEditingController();

  final labelEr = Rxn<String>();
  final phoneEr = Rxn<String>();
  final emailEr = Rxn<String>();
  final add1Er = Rxn<String>();
  final fbEr = Rxn<String>();
  final zaloEr = Rxn<String>();

  bool isValidEmail(String email) {
    String pattern =
        r'^[a-zA-Z0-9.a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@gmail+\.[a-zA-Z]+';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(email);
  }

  void updateConfigurationCommon(int id, String key) {
    labelController.text.isEmpty
        ? labelEr.value = 'Trường bắt buộc'
        : labelEr.value = null;
    phoneController.text.isEmpty
        ? phoneEr.value = 'Trường bắt buộc'
        : phoneEr.value = null;
    emailController.text.isEmpty
        ? emailEr.value = 'Trường bắt buộc'
        : emailEr.value = null;
    address1Controller.text.isEmpty
        ? add1Er.value = 'Trường bắt buộc'
        : add1Er.value = null;
    linkFacebookController.text.isEmpty
        ? fbEr.value = 'Trường bắt buộc'
        : fbEr.value = null;
    linkZaloController.text.isEmpty
        ? zaloEr.value = 'Trường bắt buộc'
        : zaloEr.value = null;
    if (labelController.text.isEmpty ||
        phoneController.text.isEmpty ||
        emailController.text.isEmpty ||
        address1Controller.text.isEmpty ||
        linkFacebookController.text.isEmpty ||
        linkZaloController.text.isEmpty) {
      return;
    } else if (phoneController.text.trim().length != 10) {
      AppSnackBar.showIsEmpty(message: 'Số điện thoại phải có độ dài 10 số');
    } else if (!phoneController.text.trim().startsWith('0')) {
      AppSnackBar.showIsEmpty(message: 'Số điện thoại phải bắt đầu bằng số 0');
    } else if (!isValidEmail(emailController.text)) {
      emailEr.value = "Email sai định dạng";
    } else {
      Get.dialog(CustomDialog(
          title: "Xác nhận cập nhật thông tin chung?",
          onTapYes: () {
            callDataService(
                coefficientRepo.updateConfiguration(
                  id: id,
                  payload: {
                    "key": "CONTACT_INFORMATION_CONFIG",
                    "value": {
                      "info": {
                        "title": "Cấu hình tiền tố",
                        "description": "Cấu hình tiền tố các mã"
                      },
                      "config": [
                        {
                          "logo_url": urlImage == null
                              ? urlLogo.value.toString()
                              : urlImage.toString(),
                          "page_title": labelController.text.toString(),
                          "phone_number": phoneController.text.toString(),
                          "email": emailController.text.toString(),
                          "address_1": address1Controller.text.toString(),
                          "address_2": address2Controller.text.toString(),
                          "address_3": address3Controller.text.toString(),
                          "facebook_page_url": linkFacebookController.text.toString(),
                          "zalo_url": linkZaloController.text.toString(),
                          "app_store": linkAppStore.text.toString(),
                          "ch_play": linkCHPlay.text.toString(),
                          "script_head": scriptHeaderController.text.toString(),
                          "script_footer": scriptFooterController.text.toString()
                        }
                      ]
                    }
                  },
                ), onSuccess: (data) {
              AppSnackBar.showSuccess(
                  message: "Cập nhật thông tin cấu hình chung thành công");
            }, onError: (error) {
              if (error is NetworkException) {
                logger.e("Network error: ${error.message}");
              } else {}
            });
            Get.back();
          },
          onTapNo: () => Get.back()));

    }
  }

  @override
  void onInit() {
    getConfigurationCommon();
    super.onInit();
  }
}
