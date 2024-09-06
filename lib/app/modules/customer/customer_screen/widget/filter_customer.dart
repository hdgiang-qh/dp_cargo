import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:vncss/app/core/widget/textfields/app_text_field.dart';
import 'package:vncss/app/modules/common_widget/const.dart';
import 'package:vncss/app/modules/common_widget/button_widget.dart';

import '../../../../core/values/app_colors.dart';
import '../../../../data/model/model/sale_employee.dart';
import '../../../common_widget/textfield_widget.dart';
import '../controller/customer_controller.dart';



class FilterCustomer extends StatefulWidget {
  const FilterCustomer();

  @override
  State<FilterCustomer> createState() => _FilterCustomerState();
}

class _FilterCustomerState extends State<FilterCustomer> {
  final controller = Get.find<CustomerController>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: context.width * 0.9,
      child: ListView(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        children: <Widget>[
          const SizedBox(
            height: 150,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: primaryColor,
              ),
              child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Bộ lọc tìm kiếm',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: ColorApp.whiteFA),
                  )),
            ),
          ),
          Container(
            height: context.height - 150,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                    children: [
                      const Row(children: [
                        Text("Nhập thông tin", style: TextStyle(fontSize: 16),)
                      ]),
                      Gap(16.h),
                      AppTextInputField(
                        hint: "Tìm theo tên khách hàng",
                        border: 6,
                        controller: controller.customerFilter,
                      ),
                      AppTextInputField(
                        hint: "Tìm theo nickname",
                        border: 6,
                        controller: controller.nicknameFilter,
                      ),
                      TypeAheadField<SaleEmployee>(
                        controller: controller.saleFilter,
                        suggestionsCallback: (pattern) {
                          return controller.listEmployeeName
                              .where((SaleEmployee item) => item.fullname
                              .toString()
                              .toLowerCase()
                              .contains(pattern.toLowerCase()))
                              .toList();
                        },
                        builder: (context, Controller, focusNode) {
                          return AppTextInputField(
                            hint: "Tìm theo theo sale",
                            border: 6,
                            focusNode: focusNode,
                            controller: controller.saleFilter,
                          );
                        },
                        itemBuilder: (context, suggestion) {
                          return ListTile(
                            title: Text("${suggestion.fullname} - ${suggestion.role?.name}", style: TextStyle(fontSize: 13),),
                          );
                        },
                        onSelected: (suggestion) {
                          setState(() {
                            controller.saleFilter.text = suggestion.fullname.toString();
                            controller.idSaleEmployeeFilter.value = suggestion.id.toString();
                          });
                        },
                        loadingBuilder: (context) => const Text('Loading...'),
                        errorBuilder: (context, error) =>
                        const Text('Error!'),
                        emptyBuilder: (context) =>
                        const Text('Không có dữ liệu phù hợp'),
                      ),
                      const SizedBox(height: 8,),
                      Container(
                        height: 50,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: Colors.black12)
                        ),
                        child: DropdownButton(
                            hint: const Text("Tất cả"),
                            value: controller.orderByFilter.value,
                            style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black
                            ),
                            isExpanded: true,
                            underline: const SizedBox(),
                            items: controller.items.map((valueItem){
                              return DropdownMenuItem(
                                  value: valueItem,
                                  child: Text(valueItem));
                            }).toList(),
                            onChanged: (newValue){
                              setState(() {
                                controller.orderByFilter.value = newValue!;
                              });
                            }
                        ),
                      ),
                      const SizedBox(height: 16,),
                      ButtonWidget(
                        buttonText: "Chưa có sale phụ trách",
                        borderColor: primaryColor,
                        textColor: controller.undefinedSale.value ? Colors.white : primaryColor,
                        bgcolor: controller.undefinedSale.value ? primaryColor : Colors.white,
                        onTap: () {
                          setState(() {
                            controller.undefinedSale.value = !controller.undefinedSale.value;
                          });
                        },
                      ),
                      const SizedBox(height: 16,),
                      ButtonWidget(
                        buttonText: "Khách có công nợ",
                        borderColor: primaryColor,
                        textColor: controller.isDebt.value ? Colors.white : primaryColor,
                        bgcolor: controller.isDebt.value ? primaryColor : Colors.white,
                        onTap: () {
                          setState(() {
                            controller.isDebt.value = !controller.isDebt.value;
                          });
                        },
                      ),
                      const SizedBox(height: 16,),
                      ButtonWidget(
                        buttonText: "Khách có tín dụng",
                        borderColor: primaryColor,
                        textColor: controller.isCard.value ? Colors.white : primaryColor,
                        bgcolor: controller.isCard.value ? primaryColor : Colors.white,
                        onTap: () {
                          setState(() {
                            controller.isCard.value = !controller.isCard.value;
                          });
                        },
                      ),
                      const SizedBox(height: 16,),
                      ButtonWidget(
                        buttonText: "Khách hàng đã xóa",
                        borderColor: primaryColor,
                        textColor: controller.isBlocked.value ? Colors.white : primaryColor,
                        bgcolor: controller.isBlocked.value ? primaryColor : Colors.white,
                        onTap: () {
                          setState(() {
                            controller.isBlocked.value = !controller.isBlocked.value;
                          });
                        },
                      ),
                    ]),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ButtonWidget(
                          buttonText: "Thiết lập lại",
                          width: 140,
                          borderColor: primaryColor,
                          textColor: primaryColor,
                          onTap: () {
                            controller.clearFilter();
                            controller.onRefreshPage();
                            Get.back();
                          },
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        ButtonWidget(
                          buttonText: "Áp dụng",
                          width: 140,
                          bgcolor: primaryColor,
                          textColor: ColorApp.whiteFA,
                          onTap: () {
                            controller.onSelected();
                            controller.clearFilter();
                            Get.back();
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
