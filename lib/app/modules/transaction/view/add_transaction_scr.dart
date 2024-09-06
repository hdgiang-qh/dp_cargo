import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:vncss/app/core/enum/transaction_status.dart';
import 'package:vncss/app/data/model/model/transaction.dart';
import 'package:vncss/app/modules/common_widget/const.dart';
import 'package:vncss/app/modules/common_widget/button_widget.dart';
import 'package:vncss/app/modules/common_widget/filter_search.dart';
import 'package:vncss/app/modules/common_widget/textfield_widget.dart';
import 'package:vncss/app/modules/configuration/widget/choose_image.dart';
import 'package:vncss/app/modules/transaction/controller/transaction_controller.dart';

import '../../../core/base/base_view.dart';
import '../../../core/widget/dialog/app_snackbar.dart';
import '../../common_widget/app_bar_widget.dart';

class AddTransactionScr extends BaseView<TransactionController> {
  final FocusNode _name = FocusNode();
  final FocusNode _money = FocusNode();
  final FocusNode _note = FocusNode();
  final GlobalKey<ChooseImageState> chooseImageKey =
      GlobalKey<ChooseImageState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppBarWidget(
              title: "Thêm giao dịch",
              onBack: () => Get.back(closeOverlays: true),
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Obx(() {
                    return Column(
                      children: [
                        TypeAheadField<TransactionName>(
                          controller: controller.name,
                          suggestionsCallback: (pattern) {
                            return controller.listTransactionName
                                .where((TransactionName item) =>
                                    "${item.idCustomer} | ${item.nickName} | ${item.name}"
                                        .toString()
                                        .toLowerCase()
                                        .contains(pattern.toLowerCase()))
                                .toList();
                          },
                          builder: (context, controller, focusNode) {
                            return AppTextInputField(
                              controller: controller,
                              focusNode: focusNode,
                              label: "Khách hàng",
                              showLabel: true,
                              hint: "Nhập tên khách hàng",
                            );
                          },
                          itemBuilder: (context, suggestion) {
                            return ListTile(
                              title: Text(
                                "${suggestion.idCustomer} | ${suggestion.nickName} | ${suggestion.name}",
                                style: const TextStyle(fontSize: 13),
                              ),
                            );
                          },
                          onSelected: (suggestion) {
                            controller.name.text =
                                "${suggestion.idCustomer} | ${suggestion.nickName} | ${suggestion.name}";
                            controller.idName.value = suggestion.id;
                            chooseImageKey.currentState?.deleteImage();
                          },
                          loadingBuilder: (context) => const Text('Loading...'),
                          errorBuilder: (context, error) => const Text('Error!'),
                          emptyBuilder: (context) =>
                              const Text('Không có dữ liệu phù hợp'),
                        ),
                        AppTextInputField(
                          controller: controller.money,
                          focusNode: _money,
                          textInputType: TextInputType.number,
                          showLabel: true,
                          label: "Số tiền giao dịch",
                          hint: "0",
                          onFieldSubmitted: (_) {
                            FocusScope.of(context).requestFocus(_note);
                          },
                        ),
                        TypeAheadField<TransactionStatusesUpper2>(
                          controller: controller.typeTrans,
                          suggestionsCallback: (pattern) {
                            return TransactionStatusesUpper2.values.toList();
                          },
                          builder: (context, controller, focusNode) {
                            return AppTextInputField(
                              controller: controller,
                              focusNode: focusNode,
                              label: "Loại giao dịch",
                              showLabel: true,
                              hint: "Chọn loại giao dịch",
                            );
                          },
                          itemBuilder: (context, suggestion) {
                            return ListTile(
                              title: Text(suggestion.value.toString()),
                            );
                          },
                          onSelected: (suggestion) {
                            controller.typeTrans.text =
                                suggestion.value.toString();
                            controller.type.value = suggestion.value;
                          },
                          loadingBuilder: (context) => const Text('Loading...'),
                          errorBuilder: (context, error) => const Text('Error!'),
                          emptyBuilder: (context) =>
                              const Text('Không có dữ liệu phù hợp'),
                        ),
                        controller.type.value ==
                                TransactionStatusesUpper2.recharge.value
                            ? TypeAheadField<BankList>(
                                controller: controller.bank,
                                suggestionsCallback: (pattern) {
                                  return controller.listNewBank
                                      .where((BankList item) => item.stringName
                                          .toString()
                                          .toLowerCase()
                                          .contains(pattern.toLowerCase()))
                                      .toList();
                                },
                                builder: (context, controller, focusNode) {
                                  return AppTextInputField(
                                    controller: controller,
                                    focusNode: focusNode,
                                    label: "Ngân hàng",
                                    showLabel: true,
                                    hint: "Chọn ngân hàng",
                                  );
                                },
                                itemBuilder: (context, suggestion) {
                                  return ListTile(
                                    title: Text(suggestion.stringName.toString()),
                                  );
                                },
                                onSelected: (suggestion) {
                                  controller.bank.text =
                                      suggestion.stringName.toString();
                                },
                                loadingBuilder: (context) =>
                                    const Text('Loading...'),
                                errorBuilder: (context, error) =>
                                    const Text('Error!'),
                                emptyBuilder: (context) =>
                                    const Text('Không có dữ liệu phù hợp'),
                              )
                            : const SizedBox(),
                        AppTextInputField(
                          controller: controller.note,
                          focusNode: _note,
                          textInputType: TextInputType.emailAddress,
                          showLabel: true,
                          label: "Ghi chú",
                          hint: "Nhập ghi chú",
                        ),
                        controller.type.value ==
                                TransactionStatusesUpper2.recharge.value
                            ? ChooseImage(
                                key: chooseImageKey,
                                onChanged: (file) {
                                  controller.uploadLogoBank(file: file);
                                },
                              )
                            : const SizedBox(),
                      ],
                    );
                  }),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: ButtonWidget(
                      buttonText: "Huỷ bỏ",
                      borderColor: primaryColor,
                      bgcolor: ColorApp.whiteFA,
                      textColor: primaryColor,
                      onTap: () {
                        Get.back();
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: ButtonWidget(
                      buttonText: "Tạo mới",
                      bgcolor: primaryColor,
                      borderColor: primaryColor,
                      textColor: ColorApp.whiteFA,
                      onTap: () {
                        if (controller.name.text.isEmpty ||
                                controller.money.text.isEmpty ||
                                controller.typeTrans.text.isEmpty ||
                                controller.type.value ==
                                    TransactionStatusesUpper2.recharge.value
                            ? controller.bank.text.isEmpty
                            : false) {
                          AppSnackBar.showIsEmpty(
                              message: "Điền đầy đủ thông tin");
                        } else if (!controller
                            .isNumeric(controller.money.text)) {
                          AppSnackBar.showIsEmpty(
                              message:
                                  "Số tiền không được chưa ký tự ngoài số");
                        } else if (controller.type.value ==
                                TransactionStatusesUpper2.recharge.value
                            ? controller.urlImage == null
                            : false) {
                          AppSnackBar.showIsEmpty(
                              message:
                                  "File ảnh trống hoặc không đúng định dạng");
                        } else {
                          controller.createTransaction();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8,)
          ],
        ),
      ),
    );
  }
}
