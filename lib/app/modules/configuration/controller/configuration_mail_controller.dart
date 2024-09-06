import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vncss/app/core/base/base_controller.dart';
import 'package:vncss/app/core/base/paging_controller.dart';
import 'package:vncss/app/core/widget/dialog/app_snackbar.dart';
import 'package:vncss/app/modules/common_widget/dialog_widget.dart';
import 'package:vncss/app/modules/main/controllers/main_controller.dart';

import '../../../data/model/model/configuration_model.dart';
import '../../../data/repository/coefficient_reponsitory.dart';

class ConfigurationMailController extends BaseController {
  final pagingController = PagingController<ConfigurationMail>();
  final coefficientRepo = Get.find<ConfigurationReponsitory>();
  final listConfigurationMail = <ConfigurationMail>[].obs;

  final controllerMain = Get.find<MainController>();

  TextEditingController portController = TextEditingController();
  TextEditingController hostController = TextEditingController();
  TextEditingController mailServeUserController = TextEditingController();
  TextEditingController mailServePasswordController = TextEditingController();
  TextEditingController sendEmailAddressController = TextEditingController();
  TextEditingController sendEmailNameController = TextEditingController();
  TextEditingController adminContactReceiveController = TextEditingController();

  final portEr = Rxn<String>();
  final hostEr = Rxn<String>();
  final mailUserEr = Rxn<String>();
  final mailPassEr = Rxn<String>();
  final addressEr = Rxn<String>();
  final mailNameEr = Rxn<String>();
  final adminMailEr = Rxn<String>();

  var isLoading = false.obs;

  Future<List<ConfigurationMail>>? getConfigurationMail() async {
    try {
      isLoading.value = true;
      final data = await coefficientRepo.getConfigurationMail(
          warehouseId: controllerMain.warehouseId == 0
              ? null
              : controllerMain.warehouseId.toString());
      listConfigurationMail.value = data.listCoeMail ?? [];
      portController.text =
          data.listCoeMail![0].configValue!.config![0]!.port.toString();
      hostController.text =
          data.listCoeMail![0].configValue!.config![0]!.host.toString();
      mailServeUserController.text = data
          .listCoeMail![0].configValue!.config![0]!.mailServerUser
          .toString();
      mailServePasswordController.text = data
          .listCoeMail![0].configValue!.config![0]!.mailServerPassword
          .toString();
      sendEmailAddressController.text = data
          .listCoeMail![0].configValue!.config![0]!.senderEmailAddress
          .toString();
      sendEmailNameController.text = data
          .listCoeMail![0].configValue!.config![0]!.senderEmailName
          .toString();
      adminContactReceiveController.text = data.listCoeMail![0].configValue!
          .config![0]!.adminContactReceiverEmailAddress
          .toString();
      return listConfigurationMail;
    } catch (error) {
      rethrow;
    } finally {
      isLoading.value = false;
    }
  }

  bool isValidEmail(String email) {
    String pattern =
        r'^[a-zA-Z0-9.a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z0-9]+';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(email);
  }

  bool isNumeric(String input) {
    RegExp regex = RegExp(r'^[0-9]+$');
    return regex.hasMatch(input);
  }

  void updateConfigurationMail(int id, String key) {
    portController.text.isEmpty
        ? portEr.value = 'Trường bắt buộc'
        : portEr.value = null;
    hostController.text.isEmpty
        ? hostEr.value = 'Trường bắt buộc'
        : hostEr.value = null;
    mailServeUserController.text.isEmpty
        ? mailUserEr.value = 'Trường bắt buộc'
        : mailUserEr.value = null;
    mailServePasswordController.text.isEmpty
        ? mailPassEr.value = 'Trường bắt buộc'
        : mailPassEr.value = null;
    sendEmailAddressController.text.isEmpty
        ? addressEr.value = 'Trường bắt buộc'
        : addressEr.value = null;
    sendEmailNameController.text.isEmpty
        ? mailNameEr.value = 'Trường bắt buộc'
        : mailNameEr.value = null;
    adminContactReceiveController.text.isEmpty
        ? adminMailEr.value = 'Trường bắt buộc'
        : adminMailEr.value = null;
    if (portController.text.isEmpty ||
        hostController.text.isEmpty ||
        mailServeUserController.text.isEmpty ||
        mailServePasswordController.text.isEmpty ||
        sendEmailAddressController.text.isEmpty ||
        sendEmailNameController.text.isEmpty ||
        adminContactReceiveController.text.isEmpty) {
      return;
    } else if (!isValidEmail(mailServeUserController.text) ||
        !isValidEmail(sendEmailAddressController.text) ||
        !isValidEmail(adminContactReceiveController.text)) {
      AppSnackBar.showIsEmpty(message: "Mail không đúng định dạng");
    } else if (!isNumeric(portController.text)) {
      AppSnackBar.showIsEmpty(message: "Port không đúng định dạng");
    } else {
      Get.dialog(CustomDialog(
          title: "Xác nhận cập nhật cấu hình mail server?",
          onTapYes: () {
            callDataService(
              coefficientRepo.updateConfiguration(
                id: id,
                payload: {
                  'key': key,
                  'value': {
                    'info': {
                      'title': "Cấu hình thông tin mail server",
                      'description': "Thông tin máy chủ email"
                    },
                    'config': [
                      {
                        "port": double.tryParse(portController.text)?.toInt(),
                        "host": hostController.text,
                        "mail_server_user": mailServeUserController.text,
                        "mail_server_password":
                            mailServePasswordController.text,
                        "sender_email_address": sendEmailAddressController.text,
                        "sender_email_name": sendEmailNameController.text,
                        "admin_contact_receiver_email_address":
                            adminContactReceiveController.text
                      }
                    ]
                  }
                },
              ),
              onSuccess: (data) {
                AppSnackBar.showSuccess(
                    message:
                        "Cập nhật thông tin cấu hình mail server thành công");
              },
            );
            Get.back();
          },
          onTapNo: () => Get.back()));
    }
  }

  onSelected() {}

  onRefreshPage() {}

  onLoadNextPage() {
    logger.i("On load next");
  }

  @override
  void onInit() {
    getConfigurationMail();
    super.onInit();
  }
}
