import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vncss/app/core/base/base_controller.dart';
import 'package:vncss/app/core/base/paging_controller.dart';
import 'package:vncss/app/core/widget/dialog/app_snackbar.dart';
import 'package:vncss/app/data/repository/authentication_repository.dart';
import 'package:vncss/app/modules/common_widget/dialog_widget.dart';
import 'package:vncss/app/modules/configuration/controller/partner_controller.dart';

import '../../../data/model/model/bill_of_lading.dart';
import '../../../data/model/response/bill_of_lading_response.dart';
import '../../../data/repository/bill_of_lading_reponsitory.dart';

class DetailPartnerController extends BaseController {
  final pagingController = PagingController<BillOfLadingVnDeliveryUnit>();
  final billOfLadingRepo = Get.find<BillOfLadingRepository>();
  final AuthenticationRepository authenticationRepository = Get.find();
  final detailDeliveryUnit = BillOfLadingVnDeliveryUnit().obs;
  TextEditingController nameUpdate = TextEditingController();
  TextEditingController codeUpdate = TextEditingController();
  final controllerList = Get.find<PartnerController>();
  int? id;
  String? code;
  String? urlImage;

  var isLoading = false.obs;
  Future<BillOfLadingVnDeliveryUnit> getDetailDeliveryUnit() async{
    try {
      isLoading.value = true;
      final data = await billOfLadingRepo.detailDeliveryUnits(id: id!);
      detailDeliveryUnit.value = data.detailDeliveryUnit!;
      nameUpdate.text = detailDeliveryUnit.value.name!;
      codeUpdate.text = detailDeliveryUnit.value.code!;
      return detailDeliveryUnit.value;
    } catch (error) {
      rethrow;
    } finally {
      isLoading.value = false;
    }
  }

  void updateDeliveryUnit() {
    if (nameUpdate.text.isEmpty || codeUpdate.text.isEmpty) {
      AppSnackBar.showIsEmpty(
          message: "Điền đầy đủ thông tin");
    } else {
      Get.dialog(
        CustomDialog(
          title: "Xác nhận thay đổi đối tác vận chuyển?",
          onTapYes: () async {
            callDataService(
                billOfLadingRepo.updateDeliveryUnits(
                  id: id!,
                  payload: {
                    "code": nameUpdate.text,
                    "logo_url": urlImage ?? detailDeliveryUnit.value.logoUrl,
                    "name": codeUpdate.text,
                  },
                ), onSuccess: (data) {
              AppSnackBar.showSuccess(
                  message: "Cập nhật thông tin đối tác vận chuyển mới thành công!");
            });
            Get.back();
            Get.back(result: true);
            Future.delayed(
                const Duration(milliseconds: 500),
                    () {
                      controllerList.onRefreshPage();
                });
          },
          onTapNo: () {
            Get.back();
          },
        ),
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

  @override
  void onInit() {
    id = argument['id'];
    getDetailDeliveryUnit();
    super.onInit();
  }
}
