import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vncss/app/core/base/base_controller.dart';
import 'package:vncss/app/data/model/model/transaction.dart';
import 'package:vncss/app/data/model/response/transaction_response.dart';
import 'package:vncss/app/data/repository/authentication_repository.dart';
import 'package:vncss/app/data/repository/transaction_reposioty.dart';
import 'package:vncss/app/modules/main/controllers/main_controller.dart';
import 'package:vncss/app/modules/transaction/controller/transaction_controller.dart';
import '../../../core/widget/dialog/app_snackbar.dart';
import '../../../data/repository/coefficient_reponsitory.dart';

class ConfigurationBankController extends BaseController {
  final coefficientRepo = Get.find<ConfigurationReponsitory>();
  final transactionRepo = Get.find<TransactionsRepository>();
  final controllerMain = Get.find<MainController>();

  final controllerTrans = Get.find<TransactionController>();
  final listBank = <BankModel>[].obs;

  final listBankModelConfigValueConfig = <BankModelConfigValueConfig>[].obs;
  final AuthenticationRepository authenticationRepository = Get.find();

  final listBankAdd = <BankModelConfigValueConfig>[].obs;

  TextEditingController nameBank = TextEditingController();
  TextEditingController numberBank = TextEditingController();
  TextEditingController nameAcc = TextEditingController();
  TextEditingController nameBranch = TextEditingController();

  int? idBank;
  var isLoading = false.obs;
  Future<List<BankModel>>? getBankData()async{
    try {
      isLoading.value = true;
      final data = await transactionRepo.getBank(
          key: "BANK_ACCOUNT_CONFIG",
          warehouseId: controllerMain.warehouseId == 0
              ? null
              : controllerMain.warehouseId.toString());
      listBank.value = data.listBank ?? [];
      listBankModelConfigValueConfig.value = data.listConfig ?? [];
      return listBank;
    } catch (error) {
      rethrow;
    } finally {
      isLoading.value = false;
    }
  }

  void deleteConfigurationBank(int id) {
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
        AppSnackBar.showSuccess(message: 'Xóa tài khoản ngân hàng');
      },
    );
  }

  void createConfigurationBank(int id) {
    if (nameBank.text.isEmpty ||
        numberBank.text.isEmpty ||
        nameAcc.text.isEmpty ||
        nameBranch.text.isEmpty) {
      AppSnackBar.showIsEmpty(message: "Điền đầy đủ thông tin");
    } else if (urlLogo == null || urlQr == null) {
      AppSnackBar.showIsEmpty(message: "File ảnh trống");
    } else{
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
          AppSnackBar.showSuccess(message: 'Tạo tài khoản ngân hàng thành công');
        },
      );
    }
  }

  String? code;
  String? urlLogo;
  String? urlQr;

  String generateRandomString(int length) {
    const characters = '0123456789';
    Random random = Random();
    return String.fromCharCodes(Iterable.generate(
      length,
          (_) => characters.codeUnitAt(random.nextInt(characters.length)),
    ));
  }

  onSetValue() {
    code = '1719994${generateRandomString(6)}';
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

  onRefreshPage() {

    listBank.clear();
    getBankData();
  }

  onLoadNextPage() {
    logger.i("On load next");
  }

  @override
  void onInit() {
    getBankData();
    super.onInit();
  }
}
