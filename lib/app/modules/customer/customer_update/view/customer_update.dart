import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

import '../../../../core/base/base_view.dart';
import '../../../../core/enum/sex.dart';
import '../../../../core/values/app_colors.dart';
import '../../../../core/values/app_text_styles.dart';
import '../../../../data/model/model/config_price.dart';
import '../../../../data/model/model/sale_employee.dart';
import '../../../common_widget/const.dart';
import '../../../common_widget/textfield_widget.dart';
import '../../../common_widget/title_detail_list.dart';
import '../../../util/images.dart';
import '../../customer_detail/controller/detail_customer_controller.dart';
import '../../customer_screen/controller/customer_controller.dart';
import '../controller/config_price_controller.dart';
import '../widget/bottom_sheet_config_price.dart';

class CustomerUpdateScreen extends BaseView<DetailCustomerController> {
  final configPriceController = Get.find<ConfigPriceController>();

  final saleEmployee = Get.find<CustomerController>();
  var _gender;
  var id;
  final MultiSelectController _controller = MultiSelectController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Container(
              padding: const EdgeInsets.all(16),
              child: Row(children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(Icons.arrow_back, size: 30),
                ),
                const Expanded(
                    child: Center(
                        child: Text(
                          "Cập nhật khách hàng",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ))),
              ])),
          Expanded(
            child: SingleChildScrollView(
              child: Column(children: [
                TitleDetailList(
                  headText:
                  "Thông tin khách hàng: ${controller.customers.value
                      .idCustomer}",
                  svgPath: Images.file2,
                ),
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(16),
                  child: Column(children: [
                    AppTextInputField(
                      label: "Mã khách hàng",
                      showLabel: true,
                      requiredLabel: true,
                      border: 6,
                      hint: "Nhập mã khách hàng",
                      controller: controller.customIdController,
                    ),
                    AppTextInputField(
                      label: "Họ và tên:",
                      showLabel: true,
                      border: 6,
                      controller: controller.fullname,
                    ),
                    Gap(16.h),
                    AppTextInputField(
                      label: "Nickname:",
                      showLabel: true,
                      border: 6,
                      controller: controller.nickname,
                    ),
                    Gap(16.h),
                    AppTextInputField(
                      label: "Email:",
                      showLabel: true,
                      border: 6,
                      controller: controller.email,
                    ),
                    Gap(16.h),
                    AppTextInputField(
                      label: "Địa chỉ:",
                      showLabel: true,
                      border: 6,
                      controller: controller.address,
                    ),
                    Gap(16.h),
                    AppTextInputField(
                        label: "Số điện thoại:",
                        showLabel: true,
                        border: 6,
                        controller: controller.phone),
                    Gap(16.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Giới tính:",
                          style: TextStyle(fontSize: 16),
                        ),
                        Obx(() => Row(
                          children: [
                            Radio<String>(
                              activeColor: Colors.green,
                              value: "male",
                              groupValue: controller.gender.value,
                              onChanged: (newValue) {
                                controller.gender.value = newValue!;
                              },
                            ),
                            const Text(
                              "Nam",
                              style: TextStyle(fontSize: 13),
                            ),
                            Radio<String>(
                              activeColor: Colors.green,
                              value: "female",
                              groupValue: controller.gender.value,
                              onChanged: (newValue) {
                                controller.gender.value = newValue!;
                              },
                            ),
                            const Text(
                              "Nữ",
                              style: TextStyle(fontSize: 13),
                            ),
                          ],
                        )),
                      ],
                    ),
                    Gap(16.h),
                    const Row(children: [
                      Text(
                        "Ngày sinh:",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ]),
                    AppTextInputField(
                      controller: controller.birthday,
                      hint: "Ngày",
                      suffixPath: "assets/image/calendar.svg",
                      border: 6,
                      showSuffix: true,
                      onTap: () async {
                        showDatePicker(
                            confirmText: "Lưu",
                            cancelText: "Huỷ",
                            context: context,
                            initialDate: controller.selectedDates,
                            firstDate: DateTime(1960),
                            lastDate: DateTime(2030),
                            builder: (context, child) {
                              return Theme(
                                  data: ThemeData(), child: child!);
                            }).then((value) {
                          if (value != null) {
                            controller.birthdayChoose.value =
                                value.toUtc().toIso8601String();
                            controller.date =
                                value.toDateTimeStringWithoutHour2();
                            controller.birthday?.text =
                            "${controller.date}";
                          }
                        });
                      },
                    ),
                    Gap(16.h),
                    AppTextInputField(
                      label: "Công nợ:",
                      showLabel: true,
                      border: 6,
                      controller: controller.balance,
                    ),
                    Gap(16.h),
                    AppTextInputField(
                      label: "Công nợ tối đa:",
                      showLabel: true,
                      border: 6,
                      controller: controller.creditAmount,
                    ),
                    Gap(16.h),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(children: [
                        Text("Tags:",
                            style: Theme
                                .of(context)
                                .BodyText1
                                .copyWith(color: AppColors.neutrals08))
                      ]),
                    ),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: Colors.black12)),
                      child: MultiSelectDropDown(
                        controller: _controller,
                        onOptionSelected: (options) {
                          print(options.toString());
                          controller.tags.clear();
                          controller.tags = options
                              .map((item) => item.value.toString())
                              .toList();
                          print(controller.tags);
                        },
                        options: const <ValueItem>[
                          ValueItem(label: 'Được công nợ', value: '3'),
                          ValueItem(
                              label: 'Thu tiền trước', value: '4'),
                          ValueItem(label: 'Freeship', value: '5'),
                        ],
                        selectionType: SelectionType.multi,
                        chipConfig:
                        const ChipConfig(wrapType: WrapType.scroll),
                        dropdownHeight: 150,
                        optionTextStyle: const TextStyle(
                            fontSize: 13, color: Colors.black),
                        selectedOptionIcon: const Icon(
                            Icons.check_circle),
                        borderRadius: 4,
                        borderColor: AppColors.neutral300,
                      ),
                    ),
                    Gap(16.h),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment
                              .spaceBetween,
                          children: [
                            Text("Lựa chọn bảng giá:",
                                style: Theme
                                    .of(context)
                                    .BodyText1
                                    .copyWith(
                                    color: AppColors.neutrals08)),
                            InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius
                                            .vertical(
                                            top: Radius.circular(16))),
                                    isDismissible: false,
                                    context: context,
                                    builder: (context) {
                                      return BottomSheetConfigPrice(
                                          configPriceData: controller
                                              .customers
                                              .value
                                              .shippingCost!);
                                    });
                              },
                              child: const Text(
                                "Xem thêm >",
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.primary),
                              ),
                            )
                          ]),
                    ),
                    TypeAheadField<ConfigPriceData>(
                      controller: controller.forConfigController,
                      suggestionsCallback: (pattern) {
                        return configPriceController.listConfigPrice
                            .where((ConfigPriceData item) =>
                            item
                                .configValue!.info!.description
                                .toString()
                                .toLowerCase()
                                .contains(pattern.toLowerCase()))
                            .toList();
                      },
                      builder: (context, Controller, focusNode) {
                        return Obx(() {
                          return AppTextInputField(
                            hint: controller.customers.value
                                .shippingCost
                                ?.configValue?.info?.description ??
                                "Lựa chọn bảng giá",
                            border: 6,
                            focusNode: focusNode,
                            controller: Controller,
                          );
                        });
                      },
                      itemBuilder: (context, suggestion) {
                        return ListTile(
                          title: Text(suggestion
                              .configValue!.info!.description
                              .toString()),
                        );
                      },
                      onSelected: (suggestion) {
                        controller.forConfigController.text = suggestion
                            .configValue!.info!.description
                            .toString();
                        controller.shippingCost = suggestion.id;
                      },
                      loadingBuilder: (context) =>
                      const Text('Loading...'),
                      errorBuilder: (context, error) =>
                      const Text('Error!'),
                      emptyBuilder: (context) =>
                      const Text('Không có dữ liệu phù hợp'),
                    ),
                    Gap(16.h),
                    const Row(children: [
                      Text(
                        "Sale phụ trách:",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ]),
                    TypeAheadField<SaleEmployee>(
                      controller: controller.forSaleController,
                      suggestionsCallback: (pattern) {
                        return saleEmployee.listSaleName
                            .where((SaleEmployee item) =>
                            item.fullname
                                .toString()
                                .toLowerCase()
                                .contains(pattern.toLowerCase()))
                            .toList();
                      },
                      builder: (context, controller, focusNode) {
                        return AppTextInputField(
                          hint: "Tìm theo theo sale",
                          border: 6,
                          focusNode: focusNode,
                          controller: controller,
                        );
                      },
                      itemBuilder: (context, suggestion) {
                        return ListTile(
                          title: Text(suggestion.fullname.toString()),
                        );
                      },
                      onSelected: (suggestion) {
                        controller.forSaleController.text =
                            suggestion.fullname.toString();
                        controller.saleId = suggestion.id;
                      },
                      loadingBuilder: (context) =>
                      const Text('Loading...'),
                      errorBuilder: (context, error) =>
                      const Text('Error!'),
                      emptyBuilder: (context) =>
                      const Text('Không có dữ liệu phù hợp'),
                    ),
                    Gap(16.h),
                    const Row(children: [
                      Text(
                        "Nhân viên CSKH:",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ]),
                    TypeAheadField<SaleEmployee>(
                      controller: controller.forCSKHController,
                      suggestionsCallback: (pattern) {
                        return saleEmployee.listCSKHName
                            .where((SaleEmployee item) =>
                            item.fullname
                                .toString()
                                .toLowerCase()
                                .contains(pattern.toLowerCase()))
                            .toList();
                      },
                      builder: (context, controller, focusNode) {
                        return AppTextInputField(
                          hint: "Tìm theo CSKH",
                          border: 6,
                          focusNode: focusNode,
                          controller: controller,
                        );
                      },
                      itemBuilder: (context, suggestion) {
                        return ListTile(
                          title: Text(suggestion.fullname.toString()),
                        );
                      },
                      onSelected: (suggestion) {
                        controller.forCSKHController.text =
                            suggestion.fullname.toString();
                        controller.customerServiceStaffId =
                            suggestion.id;
                      },
                      loadingBuilder: (context) =>
                      const Text('Loading...'),
                      errorBuilder: (context, error) =>
                      const Text('Error!'),
                      emptyBuilder: (context) =>
                      const Text('Không có dữ liệu phù hợp'),
                    ),
                    Gap(16.h),
                    AppTextInputField(
                        label: "Ghi chú:",
                        showLabel: true,
                        border: 6,
                        controller: controller.note),
                  ]),
                ),
                const TitleDetailList(
                  headText: "Đổi mật khẩu",
                  svgPath: "assets/image/lock.svg",
                ),
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(16),
                  child: Column(children: [
                    AppTextInputField(
                      label: "Mật khẩu:",
                      showLabel: true,
                      showPassword: true,
                      obscureText: true,
                      border: 6,
                      hint: "Nhập mật khẩu",
                      controller: controller.password,
                    ),
                    Gap(16.h),
                    AppTextInputField(
                      label: "Xác nhận mật khẩu:",
                      showLabel: true,
                      showPassword: true,
                      obscureText: true,
                      border: 6,
                      hint: "Xác nhận lại mật khẩu",
                      controller: controller.passwordRetype,
                    ),
                  ]),
                ),
              ]),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(16),
            child: Row(children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primary),
                        borderRadius: BorderRadius.circular(8)),
                    child: const Text(
                      "Hủy",
                      style:
                      TextStyle(fontSize: 13, color: AppColors.primary),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    controller.updateDetailCustomers();
                    Get.back(result: true);
                  },
                  child: Container(
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(8)),
                    child: const Text(
                      "Xác nhận",
                      style: TextStyle(
                          fontSize: 13, color: Colors.white),
                    ),
                  ),
                ),
              )
            ]),
          )
        ]),
      ),
    );
  }
}
