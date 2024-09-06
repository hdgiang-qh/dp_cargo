import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vncss/app/core/base/base_controller.dart';
import 'package:vncss/app/core/base/paging_controller.dart';
import 'package:vncss/app/core/widget/dialog/app_snackbar.dart';
import 'package:vncss/app/data/repository/authentication_repository.dart';
import 'package:vncss/app/data/service/auth_service.dart';
import 'package:vncss/app/modules/common_widget/const.dart';

import '../../../data/model/model/staff.dart';
import '../../../data/model/response/staff_response.dart';
import '../../../data/repository/staff_repository.dart';
import '../../main/controllers/main_controller.dart';

class StaffController extends BaseController {
  final authService = Get.find<AuthService>();
  final AuthenticationRepository authenticationRepository = Get.find();
  final controllerMain = Get.find<MainController>();
  final pagingController = PagingController<Staff>();
  final scrollController = ScrollController();
  List<String?> listPhone = [];
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController values = TextEditingController();

  TextEditingController nameAdd = TextEditingController();
  TextEditingController phoneAdd = TextEditingController();
  TextEditingController emailAdd = TextEditingController();
  TextEditingController levelAdd = TextEditingController();
  TextEditingController warehouseAdd = TextEditingController();
  TextEditingController imageAdd = TextEditingController();
  TextEditingController passAdd = TextEditingController();
  TextEditingController confirmPassAdd = TextEditingController();

  TextEditingController shipper = TextEditingController();

  final fullName = ''.obs;
  final phones = ''.obs;
  final emails = ''.obs;
  final role = ''.obs;
  final roleAdd = ''.obs;
  final whId = ''.obs;

  Rxn<String> error = Rxn<String>();

  final staffRepo = Get.find<StaffRepository>();
  final listStaff = <Staff>[].obs;
  final listShipper = <Staff>[].obs;
  final listStaffRoleName = <StaffRoleName>[].obs;

  Color? colorLevel({required int level}) {
    final color = Colors.white.obs;
    switch (level) {
      case 1:
        color.value = primaryColor;
      case 3:
        color.value = ColorApp.green08;
      case 7:
        color.value = ColorApp.blueB5;
      case 8:
        color.value = ColorApp.blue002;
      case 9:
        color.value = ColorApp.blueB5;
      case 10:
        color.value = ColorApp.yellowFF;
      case 11:
        color.value = ColorApp.orangeF2;
      case 18:
        color.value = ColorApp.greenBC;
    }
    return color.value;
  }

  var isLoading = false.obs;

// danh sách nhân viên
  void getListStaff(
      {String? fn, String? phoneNum, String? emailss, String? roles}) {
    if (!pagingController.canLoadNextPage()) return;
    pagingController.isLoadingPage = true;
    callDataService<ListStaffResponse>(
      staffRepo.getListStaff(
          page: pagingController.pageNumber,
          pageSize: 10,
          fullname: fullName.value,
          phone: phones.value,
          email: emails.value,
          role: role.value,
          warehouseVN: controllerMain.warehouseId == 0
              ? null
              : controllerMain.warehouseId.toString(),
          warehouseId: controllerMain.warehouseId == 0
              ? null
              : controllerMain.warehouseId.toString()),
      onSuccess: (data) {
        isLoading.value == true;
        final repoList = data.staff ?? [];
        if (_isLastPage(repoList.length, data.meta!.total!)) {
          pagingController.appendLastPage(repoList);
        } else {
          pagingController.appendPage(repoList);
        }
        var newList = [...pagingController.listItems];
        listStaff.value = newList;
      },
    );

    pagingController.isLoadingPage = false;
  }

  // danh sách shipper
  void getListShipper() {
    callDataService<ListStaffResponse>(
      staffRepo.getListShipper(
          page: 1, pageSize: 100, status: "0", type: "shipper"),
      onSuccess: (data) {
        listShipper.value = data.staff ?? [];
      },
    );
  }

// danh sách chức vụ
  void getListStaffRoleName() {
    callDataService<ListStaffNameResponse>(
      staffRepo.getStaffRoleName(
          isAdmin: "true",
          warehouseId: controllerMain.warehouseId == 0
              ? null
              : controllerMain.warehouseId.toString()),
      onSuccess: (data) {
        listStaffRoleName.value = data.staffRoleName ?? [];
        listStaffRoleName.removeWhere((item) => item.id == 3);
      },
    );

    pagingController.isLoadingPage = false;
  }

  bool _isLastPage(int newListItemCount, int totalCount) {
    return (listStaff.length) >= totalCount;
  }

  bool isValidEmail(String email) {
    String pattern =
        r'^[a-zA-Z0-9.a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(email);
  }

  bool isNumeric(String input) {
    RegExp regex = RegExp(r'^[0-9]+$');
    return regex.hasMatch(input);
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
    code = '1720088${generateRandomString(6)}';
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

  // thêm nhân viên
  void addStaff() {
    if (nameAdd.text.isEmpty ||
        phoneAdd.text.isEmpty ||
        emailAdd.text.isEmpty ||
        levelAdd.text.isEmpty ||
        warehouseAdd.text.isEmpty ||
        passAdd.text.isEmpty ||
        confirmPassAdd.text.isEmpty) {
      AppSnackBar.showIsEmpty(message: "Điền đầy đủ thông tin");
    } else {
      String phoneNumber = phoneAdd.text.trim();
      if (!isNumeric(phoneAdd.text)) {
        AppSnackBar.showIsEmpty(
            message: 'Số điện thoại không được chứa ký tự khác số');
      } else if (phoneNumber.length != 10) {
        AppSnackBar.showIsEmpty(message: 'Số điện thoại phải có độ dài 10 số');
      } else if (!phoneNumber.startsWith('0')) {
        AppSnackBar.showIsEmpty(
            message: 'Số điện thoại phải bắt đầu bằng số 0');
      } else if (confirmPassAdd.text != passAdd.text) {
        error.value = "Mật khẩu không khớp";
      } else if (!isValidEmail(emailAdd.text)) {
        error.value = null;
        AppSnackBar.showIsEmpty(message: "Email không đúng định dạng");
      } else {
        error.value = null;
        callDataService(
            staffRepo.addStaff(payload: {
              'avatar_url': urlImage ?? "",
              'fullname': nameAdd.text,
              'phone': phoneAdd.text,
              'email': emailAdd.text,
              'password': passAdd.text,
              'confirm_password': confirmPassAdd.text,
              'role': roleAdd.value,
              'warehouse_id': whId.value == "0" ? null : whId.value,
              'partner': null
            }), onSuccess: (data) {
          Future.delayed(const Duration(milliseconds: 600), () {
            AppSnackBar.showSuccess(message: 'Tạo nhân viên thành công');
          });
        });
      }
    }
  }

  // tải lại toàn bộ danh sách
  onRefreshPage() {
    pagingController.initRefresh();
    listStaff.clear();
    getListStaff(
        emailss: emails.value,
        fn: fullName.value,
        phoneNum: phones.value,
        roles: role.value);
    listStaffRoleName.clear();
    getListStaffRoleName();
  }

  //xóa toàn bộ giá trị filter
  onClearValue() {
    name.clear();
    phone.clear();
    email.clear();
    values.clear();
    role.value = '';
    emails.value = '';
    phones.value = '';
    fullName.value = '';
    onRefreshPage();
  }

  //tìm theo giá trị filter
  onSelected() {
    if (name.text.isEmpty &&
        phone.text.isEmpty &&
        email.text.isEmpty &&
        values.text.isEmpty) {
      AppSnackBar.showIsEmpty();
    } else {
      phones.value = phone.text;
      emails.value = email.text;
      fullName.value = name.text;
      pagingController.initRefresh();
      listStaff.clear();
      getListStaff(
          emailss: emails.value,
          fn: fullName.value,
          phoneNum: phones.value,
          roles: role.value);
      Get.back();
    }
  }

  onLoadNextPage() {
    logger.i("On load next");
    getListStaff(
        emailss: emails.value,
        fn: fullName.value,
        phoneNum: phones.value,
        roles: role.value);
  }

  @override
  void onInit() {
    getListStaff();
    getListStaffRoleName();
    super.onInit();
  }
}
