import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vncss/app/core/base/base_controller.dart';
import 'package:vncss/app/core/base/paging_controller.dart';
import 'package:vncss/app/data/model/model/staff_detail.dart';
import 'package:vncss/app/data/repository/authentication_repository.dart';
import 'package:vncss/app/modules/staff/controller/staff_controller.dart';
import '../../../../core/widget/dialog/app_snackbar.dart';
import '../../../../data/model/response/staff_response.dart';
import '../../../../data/repository/staff_repository.dart';

class DetailStaffController extends BaseController {
  final pagingController = PagingController<StaffDetailModel>();
  final AuthenticationRepository authenticationRepository = Get.find();
  final scrollController = ScrollController();
  final controllerStaff = Get.find<StaffController>();
  int? id;

  final staffRepo = Get.find<StaffRepository>();
  final staffDetail = StaffDetailModel().obs;

  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController level = TextEditingController();
  TextEditingController warehouse = TextEditingController();
  TextEditingController image = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController confirmPass = TextEditingController();

  final role = "".obs;
  final whId = ''.obs;
  Rxn<String> error = Rxn<String>();

  //chi tiết nhân viên
  var isLoading = false.obs;

  getDetail() {
    if (id == null) {
      showMessage("Lỗi id");
    }
    callDataService<DetailStaffResponse>(staffRepo.getStaffDetail(id: id!),
        onSuccess: (data) {
      isLoading.value == true;
      staffDetail.value = data.detailStaff!;
      name.text = staffDetail.value.fullname ?? '';
      phone.text = staffDetail.value.phone ?? '';
      email.text = staffDetail.value.email ?? '';
      level.text = staffDetail.value.role?.name ?? "";
      role.value = staffDetail.value.role?.id.toString() ?? "";
      warehouse.text = staffDetail.value.warehouseVN?.name ?? "";
      whId.value = staffDetail.value.warehouseVN?.id.toString() ?? "";
    }, onError: (error) {
      showErrorMessage(error.toString());
    });
  }

  // xóa nhana viên
  deleteStaff() {
    if (id == null) {
      showMessage("Lỗi id");
    }
    callDataService(staffRepo.deleteStaff(id: id!), onSuccess: (data) {
      Future.delayed(const Duration(milliseconds: 600), () {
        AppSnackBar.showSuccess(message: "Xóa nhân viên thành công");
      });
    }, onError: (error) {
      showErrorMessage(error.toString());
    });
  }

  bool isValidEmail(String email) {
    String pattern =
        r'^[a-zA-Z0-9.a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(email);
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

  bool isNumeric(String input) {
    RegExp regex = RegExp(r'^[0-9]+$');
    return regex.hasMatch(input);
  }

  // sửa nhân viên
  void updateStaff() {
    if (name.text.isEmpty ||
        phone.text.isEmpty ||
        email.text.isEmpty ||
        level.text.isEmpty ||
        warehouse.text.isEmpty ||
        pass.text.isEmpty ||
        confirmPass.text.isEmpty) {
      AppSnackBar.showIsEmpty(message: "Điền đầy đủ thông tin");
    } else {
      if (confirmPass.text != pass.text) {error.value = "Mật khẩu không khớp";
      } else {
        String input = name.text.trim();
        String phoneNumber = phone.text.trim();
        controllerStaff.listStaff.removeWhere((staff) => staff.id == id);
        bool isValid = controllerStaff.listStaff.any(
            (item) => item.email?.toLowerCase() == email.text.toLowerCase());
        if (input.contains(RegExp(r'\d'))) {
          AppSnackBar.showIsEmpty(message: 'Tên không được chứa ký tự là số');
        } else if (!isNumeric(phone.text)) {
          AppSnackBar.showIsEmpty(
              message: "Số điện thoạt không được chứa ký từ ngoài số");
        } else if (phoneNumber.length != 10) {
          AppSnackBar.showIsEmpty(
              message: 'Số điện thoại phải có độ dài 10 số');
        } else if (!phoneNumber.startsWith('0')) {
          AppSnackBar.showIsEmpty(
              message: 'Số điện thoại phải bắt đầu bằng số 0');
        } else if (isValid) {
          AppSnackBar.showIsEmpty(message: "Email đã tồn tại");
        } else if (!isValidEmail(email.text)) {
          error.value = null;
          AppSnackBar.showIsEmpty(message: "Email không đúng định dạng");
        } else if (confirmPass.text != pass.text) {
          error.value = "Mật khẩu không khớp";
        } else {
          error.value = null;
          callDataService(
              staffRepo.updateStaff(id: id!, payload: {
                'avatar_url': urlImage,
                'fullname': name.text,
                'phone': phone.text,
                'email': email.text,
                'password': pass.text,
                'role_id': role.value,
                'warehouse_id': whId.value == "0" ? null : whId.value,
              }), onSuccess: (data) {
            Future.delayed(const Duration(milliseconds: 600), () {
              AppSnackBar.showSuccess(message: 'Cập nhật nhân viên thành công');
            });
          }, onError: (error) {
            AppSnackBar.showSuccess(message: 'Cập nhật nhân viên thất bại');
          });
          Get.back(result: true);
        }
      }
    }
  }

  @override
  void onInit() {
    id = argument['id'];
    getDetail();
    super.onInit();
  }
}
