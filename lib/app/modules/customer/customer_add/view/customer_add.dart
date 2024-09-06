import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

import '../../../../core/values/app_colors.dart';
import '../../../../core/values/app_text_styles.dart';
import '../../../../core/widget/dialog/app_snackbar.dart';
import '../../../../data/model/model/config_price.dart';
import '../../../../data/model/model/sale_employee.dart';
import '../../../common_widget/const.dart';
import '../../../common_widget/textfield_widget.dart';
import '../../../common_widget/title_detail_list.dart';
import '../../customer_screen/controller/customer_controller.dart';
import '../../customer_update/controller/config_price_controller.dart';
import '../widget/bottom_sheet_config_add.dart';

class CustomerAddScreen extends StatefulWidget {
  const CustomerAddScreen();

  @override
  State<CustomerAddScreen> createState() => _CustomerAddScreenState();
}

class _CustomerAddScreenState extends State<CustomerAddScreen> {
  int _gender = 2;
  final customerController = Get.find<CustomerController>();
  final configPriceController = Get.find<ConfigPriceController>();

  final saleEmployee = Get.find<CustomerController>();
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
                    customerController.clear();
                    Get.back();
                  },
                  child: const Icon(Icons.arrow_back, size: 30),
                ),
                const Expanded(
                    child: Center(
                        child: Text(
                  "Thêm khách hàng",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ))),
              ])),
          Expanded(
              child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(children: [
                    Container(
                      color: Colors.white,
                      padding: EdgeInsets.all(16),
                      child: Column(children: [
                        AppTextInputField(
                          label: "Mã khách hàng",
                          showLabel: true,
                          requiredLabel: true,
                          border: 6,
                          hint: "Nhập mã khách hàng",
                          controller: customerController.customIdController,
                        ),
                        AppTextInputField(
                          label: "Họ và tên:",
                          showLabel: true,
                          requiredLabel: true,
                          border: 6,
                          hint: "Nhập họ và tên",
                          controller: customerController.fullnameController,
                        ),
                        Gap(16.h),
                        AppTextInputField(
                          label: "Nickname:",
                          showLabel: true,
                          border: 6,
                          hint: "Nhập tên gợi nhớ",
                          controller: customerController.nicknameController,
                        ),
                        Gap(16.h),
                        AppTextInputField(
                          label: "Email:",
                          showLabel: true,
                          requiredLabel: true,
                          border: 6,
                          hint: "Nhập email",
                          controller: customerController.emailController,
                        ),
                        Gap(16.h),
                        AppTextInputField(
                          label: "Địa chỉ:",
                          showLabel: true,
                          requiredLabel: true,
                          border: 6,
                          hint: "Nhập địa chỉ",
                          controller: customerController.addressController,
                        ),
                        Gap(16.h),
                        AppTextInputField(
                            label: "Số điện thoại:",
                            showLabel: true,
                            requiredLabel: true,
                            textInputType: TextInputType.number,
                            border: 6,
                            hint: "Nhập số điện thoại",
                            controller: customerController.phoneController),
                        Gap(16.h),
                        Container(
                          child: Column(children: [
                            Row(children: [
                              Text(
                                "Giới tính",
                                style: TextStyle(fontSize: 16),
                              ),
                            ]),
                            Row(children: [
                              Radio(
                                  activeColor: Colors.green,
                                  value: 0,
                                  groupValue: _gender,
                                  onChanged: (newValue) {
                                    setState(() {
                                      _gender = newValue!;
                                      customerController.gender =
                                          customerController
                                              .checkGender(newValue);
                                    });
                                  }),
                              const Text(
                                "Nam",
                                style: TextStyle(fontSize: 13),
                              ),
                              Radio(
                                  activeColor: Colors.green,
                                  value: 1,
                                  groupValue: _gender,
                                  onChanged: (newValue) {
                                    setState(() {
                                      _gender = newValue!;
                                      customerController.gender =
                                          customerController
                                              .checkGender(newValue);
                                    });
                                  }),
                              const Text(
                                "Nữ",
                                style: TextStyle(fontSize: 13),
                              ),
                            ])
                          ]),
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
                          controller: customerController.birthday,
                          hint: "Ngày",
                          suffixPath: "assets/image/calendar.svg",
                          border: 6,
                          showSuffix: true,
                          onTap: () async {
                            showDatePicker(
                                confirmText: "Lưu",
                                cancelText: "Huỷ",
                                context: context,
                                initialDate: customerController.selectedDates,
                                firstDate: DateTime(1960),
                                lastDate: DateTime(2030),
                                builder: (context, child) {
                                  return Theme(
                                      data: ThemeData(), child: child!);
                                }).then((value) {
                              if (value != null) {
                                customerController.birthdayChoose.value =
                                    value.toUtc().toIso8601String();
                                customerController.date =
                                    value.toDateTimeStringWithoutHour2();
                                customerController.birthday?.text =
                                    "${customerController.date}";
                              }
                            });
                          },
                        ),
                        Gap(16.h),
                        AppTextInputField(
                          label: "Công nợ tối đa:",
                          showLabel: true,
                          requiredLabel: true,
                          textInputType: TextInputType.number,
                          border: 6,
                          hint: "0",
                          controller: customerController.creditAmountController,
                        ),
                        Gap(16.h),
                        Padding(
                          padding: EdgeInsets.only(bottom: 8),
                          child: Row(children: [
                            Text("Tags:",
                                style: Theme.of(context)
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
                              customerController.tags.clear();
                              customerController.tags = options
                                  .map((item) => item.value.toString())
                                  .toList();
                              print(customerController.tags);
                            },
                            options: const <ValueItem>[
                              ValueItem(label: 'Được công nợ', value: '3'),
                              ValueItem(label: 'Thu tiền trước', value: '4'),
                              ValueItem(label: 'Freeship', value: '5'),
                            ],
                            selectionType: SelectionType.multi,
                            chipConfig:
                                const ChipConfig(wrapType: WrapType.scroll),
                            dropdownHeight: 150,
                            optionTextStyle: const TextStyle(
                                fontSize: 13, color: Colors.black),
                            selectedOptionIcon: const Icon(Icons.check_circle),
                            borderRadius: 4,
                            borderColor: AppColors.neutral300,
                          ),
                        ),
                        Gap(16.h),
                        Padding(
                          padding: EdgeInsets.only(bottom: 8),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text("Lựa chọn bảng giá:",
                                        style: Theme.of(context)
                                            .BodyText1
                                            .copyWith(
                                                color: AppColors.neutrals08)),
                                    const Text(
                                      "*",
                                      style: TextStyle(color: Colors.red),
                                    )
                                  ],
                                ),
                                InkWell(
                                  onTap: () {
                                    showModalBottomSheet(
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.vertical(
                                                top: Radius.circular(16))),
                                        isDismissible: false,
                                        context: context,
                                        builder: (context) {
                                          return BottomSheetConfigAdd();
                                        });
                                  },
                                  child: Text(
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
                          controller: customerController.forConfigController,
                          suggestionsCallback: (pattern) {
                            return configPriceController.listConfigPrice
                                .where((ConfigPriceData item) => item
                                    .configValue!.info!.description
                                    .toString()
                                    .toLowerCase()
                                    .contains(pattern.toLowerCase()))
                                .toList();
                          },
                          builder: (context, controller, focusNode) {
                            return AppTextInputField(
                              hint: "Lựa chọn bảng giá",
                              border: 6,
                              focusNode: focusNode,
                              controller:
                                  customerController.forConfigController,
                            );
                            ;
                          },
                          itemBuilder: (context, suggestion) {
                            return ListTile(
                              title: Text(suggestion
                                  .configValue!.info!.description
                                  .toString()),
                            );
                          },
                          onSelected: (suggestion) {
                            setState(() {
                              customerController.forConfigController.text =
                                  suggestion.configValue!.info!.description
                                      .toString();
                              customerController.shippingCost.value =
                                  suggestion.id!;
                            });
                          },
                          loadingBuilder: (context) => const Text('Loading...'),
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
                          controller: customerController.forSaleController,
                          suggestionsCallback: (pattern) {
                            return saleEmployee.listSaleName
                                .where((SaleEmployee item) => item.fullname
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
                              controller: customerController.forSaleController,
                            );
                          },
                          itemBuilder: (context, suggestion) {
                            return ListTile(
                              title: Text(suggestion.fullname.toString()),
                            );
                          },
                          onSelected: (suggestion) {
                            setState(() {
                              customerController.forSaleController.text =
                                  suggestion.fullname.toString();
                              customerController.customerServiceStaffId =
                                  suggestion.id.toString();
                            });
                          },
                          loadingBuilder: (context) => const Text('Loading...'),
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
                          controller: customerController.forCSKHController,
                          suggestionsCallback: (pattern) {
                            return saleEmployee.listCSKHName
                                .where((SaleEmployee item) => item.fullname
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
                              controller: customerController.forCSKHController,
                            );
                          },
                          itemBuilder: (context, suggestion) {
                            return ListTile(
                              title: Text(suggestion.fullname.toString()),
                            );
                          },
                          onSelected: (suggestion) {
                            setState(() {
                              customerController.forCSKHController.text =
                                  suggestion.fullname.toString();
                              customerController.saleId.value = suggestion.id!;
                            });
                          },
                          loadingBuilder: (context) => const Text('Loading...'),
                          errorBuilder: (context, error) =>
                              const Text('Error!'),
                          emptyBuilder: (context) =>
                              const Text('Không có dữ liệu phù hợp'),
                        ),
                        Gap(16.h),
                        AppTextInputField(
                            hint: "Nhập ghi chú",
                            label: "Ghi chú:",
                            showLabel: true,
                            border: 6,
                            controller: customerController.noteController),
                      ]),
                    ),
                    TitleDetailList(
                      headText: "Đổi mật khẩu",
                      svgPath: "assets/image/lock.svg",
                    ),
                    Container(
                      color: Colors.white,
                      padding: EdgeInsets.all(16),
                      child: Column(children: [
                        AppTextInputField(
                          label: "Mật khẩu:",
                          showLabel: true,
                          showPassword: true,
                          requiredLabel: true,
                          border: 6,
                          hint: "Nhập mật khẩu",
                          controller: customerController.passwordController,
                        ),
                        Gap(16.h),
                        AppTextInputField(
                          label: "Xác nhận mật khẩu:",
                          showLabel: true,
                          showPassword: true,
                          requiredLabel: true,
                          border: 6,
                          hint: "Xác nhận lại mật khẩu",
                          controller:
                              customerController.passwordRetypeController,
                        ),
                      ]),
                    ),
                  ]),
                ),
              ),
              Container(
                margin: EdgeInsets.all(16),
                child: Row(children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Get.back();
                        customerController.clear();
                      },
                      child: Container(
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.primary),
                            borderRadius: BorderRadius.circular(8)),
                        child: Text(
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
                        customerController.fullnameController.text == ""
                            ? AppSnackBar.showError(
                                message: "Chưa nhập họ và tên")
                            : customerController.emailController.text == ""
                                ? AppSnackBar.showError(
                                    message: "Chưa nhập email")
                                : customerController.addressController.text ==
                                        ""
                                    ? AppSnackBar.showError(
                                        message: "Chưa nhập địa chỉ")
                                    : customerController
                                                .forConfigController.text ==
                                            ""
                                        ? AppSnackBar.showError(
                                            message: "Chưa chọn bảng giá")
                                        : customerController
                                                    .phoneController.text ==
                                                ""
                                            ? AppSnackBar.showError(
                                                message:
                                                    "Chưa nhập số điện thoại")
                                            : customerController
                                                        .creditAmountController
                                                        .text ==
                                                    ""
                                                ? AppSnackBar.showError(
                                                    message:
                                                        "Chưa nhập công nợ tối đa")
                                                : customerController
                                                            .passwordController
                                                            .text ==
                                                        ""
                                                    ? AppSnackBar.showError(
                                                        message:
                                                            "Chưa thiết lập mật khẩu")
                                                    : customerController
                                                                .passwordRetypeController
                                                                .text ==
                                                            ""
                                                        ? AppSnackBar.showError(
                                                            message:
                                                                "chưa nhập xác nhận mật khẩu")
                                                        : customerController
                                                            .createCustomers();
                      },
                      child: Container(
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(8)),
                        child: Text(
                          "Xác nhận",
                          style: TextStyle(fontSize: 13, color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ]),
              )
            ],
          ))
        ]),
      ),
    );
  }
}
