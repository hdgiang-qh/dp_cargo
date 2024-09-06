import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vncss/app/core/base/base_controller.dart';
import 'package:vncss/app/core/base/paging_controller.dart';
import 'package:vncss/app/core/widget/dialog/app_snackbar.dart';
import 'package:vncss/app/data/repository/authentication_repository.dart';
import 'package:vncss/app/modules/common_widget/dialog_widget.dart';

import '../../../data/model/model/bill_of_lading.dart';
import '../../../data/repository/bill_of_lading_reponsitory.dart';
import '../../common_widget/const.dart';

class PartnerController extends BaseController {
  final pagingController = PagingController<BillOfLadingVnDeliveryUnit>();
  final billOfLadingRepo = Get.find<BillOfLadingRepository>();
  final AuthenticationRepository authenticationRepository = Get.find();
  final listDeliveryUnit = <BillOfLadingVnDeliveryUnit>[].obs;
  TextEditingController nameAdd = TextEditingController();
  TextEditingController codeAdd = TextEditingController();


  String? code;
  String? urlImage;

  String statusValue({required int stt}) {
    String i = "";
    switch (stt) {
      case 0:
        i = "Đang hoạt động";
      case 1:
        i = "Ngưng hoạt động";
    }
    return i;
  }

  Color statusColor({required int stt}) {
    Color i = Colors.white;
    switch (stt) {
      case 0:
        i = ColorApp.green23;
      case 1:
        i = ColorApp.redB6;
    }
    return i;
  }

  var isLoading = false.obs;
  Future<List<BillOfLadingVnDeliveryUnit>>? getDeliveryUnit() async{
    try {
      isLoading.value = true;
      final data = await billOfLadingRepo.getDeliveryUnits(
        page: pagingController.pageNumber,
        pageSize: 10,
      );
      final repoList = data.listDeliveryUnits ?? [];
      if (_isLastPage(repoList.length, data.meta!.total!)) {
        pagingController.appendLastPage(repoList);
      } else {
        pagingController.appendPage(repoList);
      }
      var newList = [...pagingController.listItems];
      listDeliveryUnit.value = newList;
      return listDeliveryUnit;
    } catch (error) {
      rethrow;
    } finally {
      isLoading.value = false;
    }
  }

  bool _isLastPage(int newListItemCount, int totalCount) {
    return (listDeliveryUnit.length) >= totalCount;
  }

  void disposeDeliveryUnit(int id) {
    callDataService(billOfLadingRepo.disposeDeliveryUnits(id: id),
        onSuccess: (data) {
      AppSnackBar.showSuccess(message: "Ẩn đối tác vận chuyển thành công!");
    }, onError: (error) {
      showErrorMessage(error.toString());
    });
  }

  void createDeliveryUnit() {
    if(nameAdd.text.isEmpty || codeAdd.text.isEmpty){
      AppSnackBar.showIsEmpty(
          message: "Điền đầy đủ thông tin");
    }else{
      Get.dialog(
        CustomDialog(
          title: "Xác nhận tạo đối tác vận chuyển?",
          onTapYes: () async {
            callDataService(
                billOfLadingRepo.createDeliveryUnits(payload: {
                  "code": codeAdd.text,
                  "logo_url": urlImage,
                  "name": nameAdd.text,
                }), onSuccess: (data) {
              AppSnackBar.showSuccess(
                  message: "Tạo thông tin đối tác vận chuyển mới thành công!");
            });
            Get.back();
            Get.back(result: true);
            Future.delayed(
                const Duration(milliseconds: 500),
                    () {
                  onRefreshPage();
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

  onRefreshPage() {
    pagingController.initRefresh();
    listDeliveryUnit.clear();
    getDeliveryUnit();
  }

  onLoadNextPage() {
    logger.i("On load next");
    getDeliveryUnit();
  }

  @override
  void onInit() {
    getDeliveryUnit();
    super.onInit();
  }
}
