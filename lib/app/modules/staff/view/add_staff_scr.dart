import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:vncss/app/data/model/model/warehouse.dart';
import 'package:vncss/app/modules/common_widget/button_widget.dart';
import 'package:vncss/app/modules/common_widget/const.dart';
import 'package:vncss/app/modules/common_widget/textfield_widget.dart';
import 'package:vncss/app/modules/staff/controller/staff_controller.dart';

import '../../../core/base/base_view.dart';
import '../../../core/widget/avatar.dart';
import '../../../data/model/model/staff.dart';
import '../../common_widget/app_bar_widget.dart';
import '../../report/controller/report_controller.dart';

class AddStaffScr extends BaseView<StaffController> {
  final controllerReport = Get.find<ReportController>();

  final FocusNode _name = FocusNode();
  final FocusNode _phone = FocusNode();
  final FocusNode _email = FocusNode();
  final FocusNode _pass = FocusNode();
  final FocusNode _confirmPass = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppBarWidget(
              title: "Thêm nhân viên",
              onBack: () {
                Get.back();
              },
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    AvatarWidget(
                      onChanged: (file) {
                        controller.onSetValue();
                        controller.uploadAvatar(file: file);
                      },
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      decoration: const BoxDecoration(
                          border: Border(
                              top: BorderSide(color: ColorApp.greyD7))),
                      child: Column(
                        children: [
                          AppTextInputField(
                            controller: controller.nameAdd,
                            showLabel: true,
                            requiredLabel: true,
                            label: "Họ và tên",
                            hint: "Nhập họ và tên",
                            focusNode: _name,
                            textInputType: TextInputType.name,
                            onFieldSubmitted: (_) {
                              FocusScope.of(context).requestFocus(_phone);
                            },
                          ),
                          AppTextInputField(
                            controller: controller.phoneAdd,
                            showLabel: true,
                            requiredLabel: true,
                            focusNode: _phone,
                            textInputType: TextInputType.number,
                            label: "Số điện thoại",
                            hint: "Nhập số điện thoại",
                            onFieldSubmitted: (_) {
                              FocusScope.of(context).requestFocus(_email);
                            },
                          ),
                          AppTextInputField(
                            controller: controller.emailAdd,
                            focusNode: _email,
                            requiredLabel: true,
                            textInputType: TextInputType.emailAddress,
                            showLabel: true,
                            label: "Email",
                            hint: "Nhập email",
                          ),
                          TypeAheadField<StaffRoleName>(
                            controller: controller.levelAdd,
                            suggestionsCallback: (pattern) {
                              return controller.listStaffRoleName;
                            },
                            builder: (context, controller, focusNode) {
                              return AppTextInputField(
                                label: "Vai trò",
                                showLabel: true,
                                requiredLabel: true,
                                controller: controller,
                                focusNode: focusNode,
                                readOnly: true,
                                hint: "Chọn quyền",
                                showSuffix: true,
                                suffixPath: "assets/image/drop.svg",
                              );
                            },
                            itemBuilder: (context, suggestion) {
                              return ListTile(
                                title: Text(suggestion.name.toString()),
                              );
                            },
                            onSelected: (suggestion) {
                              controller.levelAdd.text =
                                  suggestion.name.toString();
                              controller.roleAdd.value =
                                  suggestion.id.toString();
                            },
                            loadingBuilder: (context) =>
                            const Text('Loading...'),
                            errorBuilder: (context, error) =>
                            const Text('Error!'),
                            emptyBuilder: (context) =>
                            const Text('Không có dữ liệu phù hợp'),
                          ),
                          TypeAheadField<WareHouse>(
                            controller: controller.warehouseAdd,
                            suggestionsCallback: (pattern) {
                              return controllerReport.listWareHouse;
                            },
                            builder: (context, controller, focusNode) {
                              return AppTextInputField(
                                label: "Kho VN",
                                showLabel: true,
                                controller: controller,
                                focusNode: focusNode,
                                hint: "Chọn kho",
                                readOnly: true,
                                showSuffix: true,
                                suffixPath: "assets/image/drop.svg",
                              );
                            },
                            itemBuilder: (context, suggestion) {
                              return ListTile(
                                title: Text(suggestion.name.toString()),
                              );
                            },
                            onSelected: (suggestion) {
                              controller.warehouseAdd.text =
                                  suggestion.name.toString();
                              controller.whId.value =
                                  suggestion.id.toString();
                            },
                            loadingBuilder: (context) =>
                            const Text('Loading...'),
                            errorBuilder: (context, error) =>
                            const Text('Error!'),
                            emptyBuilder: (context) =>
                            const Text('Không có dữ liệu phù hợp'),
                          ),
                          AppTextInputField(
                            controller: controller.passAdd,
                            focusNode: _pass,
                            // textInputType: TextInputType.visiblePassword,
                            showLabel: true,
                            obscureText: false,
                            showPassword: false,
                            requiredLabel: true,
                            label: "Mật khẩu",
                            hint: "Nhập mật khẩu",
                            onFieldSubmitted: (_) {
                              FocusScope.of(context)
                                  .requestFocus(_confirmPass);
                            },
                          ),
                          AppTextInputField(
                            controller: controller.confirmPassAdd,
                            focusNode: _confirmPass,
                            showLabel: true,
                            requiredLabel: true,
                            //textInputType: TextInputType.visiblePassword,
                            obscureText: false,
                            error: controller.error.value,
                            showPassword: false,
                            label: "Xác nhận mật khẩu",
                            hint: "Xác nhận mật khẩu",
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ButtonWidget(
                      buttonText: "Huỷ",
                      borderColor: primaryColor,
                      textColor: primaryColor,
                      onTap: () {Get.back();},
                    ),
                  ),
                  Gap(16.w),
                  Expanded(
                    child: ButtonWidget(
                      buttonText: "Xác nhận",
                      bgcolor: primaryColor,
                      textColor: ColorApp.whiteFA,
                      onTap: () {
                        controller.addStaff();
                        Get.back(result: true);
                      },
                    ),
                  ),
                ],
              ),
            ),
            Gap(8.h),
          ],
        ),
      ),
    );
  }
}
