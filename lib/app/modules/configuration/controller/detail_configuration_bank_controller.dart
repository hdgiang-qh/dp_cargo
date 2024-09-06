import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vncss/app/core/base/base_controller.dart';
import 'package:vncss/app/core/widget/dialog/app_snackbar.dart';
import 'package:vncss/app/data/model/model/transaction.dart';
import 'package:vncss/app/data/repository/authentication_repository.dart';
import 'package:vncss/app/data/repository/coefficient_reponsitory.dart';
import 'package:vncss/app/modules/configuration/controller/configuration_bank_controller.dart';

import '../../../data/model/model/bill_of_lading.dart';
import '../../../data/model/response/bill_of_lading_response.dart';
import '../../../data/repository/bill_of_lading_reponsitory.dart';

class DetailConfigurationBankController extends BaseController {
  final coefficientRepo = Get.find<ConfigurationReponsitory>();
  final billOfLadingRepo = Get.find<BillOfLadingRepository>();
  final AuthenticationRepository authenticationRepository = Get.find();
  final detailDeliveryUnit = BillOfLadingVnDeliveryUnit().obs;
  final listBankAdd = <BankModelConfigValueConfig>[].obs;
  final controllerBank = Get.find<ConfigurationBankController>();

  String? code;
  String? urlLogo;
  String? urlQr;

  TextEditingController nameBank = TextEditingController();
  TextEditingController numberBank = TextEditingController();
  TextEditingController nameAcc = TextEditingController();
  TextEditingController nameBranch = TextEditingController();

  void updateConfigurationBank(int id) {
    if (nameBank.text.isEmpty ||
        numberBank.text.isEmpty ||
        nameAcc.text.isEmpty ||
        nameBranch.text.isEmpty) {
      AppSnackBar.showIsEmpty(message: "Điền đầy đủ thông tin");
    } else if (urlLogo == null || urlQr == null) {
      AppSnackBar.showIsEmpty(message: "File ảnh trống");
    } else {
      callDataService(
        coefficientRepo.optionConfigurationBank(id: id, payload: {
          'key': "BANK_ACCOUNT_CONFIG",
          'value': {
            'info': {
              'title': "Thông tin tài khoản ngân hàng để khách hàng nạp tiền",
              'description': "Cấu hình tài khoản ngân hàng"
            },
            'config': listBankAdd
          }
        }),
        onSuccess: (data) {
          AppSnackBar.showSuccess(
              message: 'Cập nhật tài khoản ngân hàng thành công');
          controllerBank.onRefreshPage();
        },
      );
    }
  }

  String generateRandomString(int length) {
    const characters = '0123456789';
    Random random = Random();
    return String.fromCharCodes(Iterable.generate(
      length,
      (_) => characters.codeUnitAt(random.nextInt(characters.length)),
    ));
  }

  onSetValue() {
    code = '1719904${generateRandomString(6)}';
  }

  void uploadLogoBank({required File file}) {
    callDataService(
        authenticationRepository.uploadFile(
            objectType: 'news_images',
            objectId: 'news_img_$code',
            type: 'regular_image',
            file: file), onSuccess: (url) {
      urlLogo = url;
    });
  }

  void uploadQR({required File file}) {
    callDataService(
        authenticationRepository.uploadFile(
            objectType: 'news_images',
            objectId: 'news_img_$code',
            type: 'regular_image',
            file: file), onSuccess: (url) {
      urlQr = url;
    });
  }

  getDetail() {
    urlLogo = controllerBank.listBank[0].configValue?.config?[id!]?.logo ?? '';
    urlQr = controllerBank.listBank[0].configValue?.config?[id!]?.qrCode ?? '';
    nameBank.text =
        controllerBank.listBank[0].configValue?.config?[id!]?.bankName ?? '';
    numberBank.text =
        controllerBank.listBank[0].configValue?.config?[id!]?.accountNumber ??
            '';
    nameAcc.text =
        controllerBank.listBank[0].configValue?.config?[id!]?.accountName ?? '';
    nameBranch.text =
        controllerBank.listBank[0].configValue?.config?[id!]?.bankBranch ?? '';
  }

  int? id;

  @override
  void onInit() {
    id = argument['id'];
    getDetail();
    super.onInit();
  }
}
