import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:vncss/app/core/widget/textfields/app_text_field.dart';
import 'package:vncss/app/modules/common_widget/const.dart';

import '../../../../../data/model/model/transaction.dart';
import '../../../../common_widget/button_widget.dart';
import '../../../../common_widget/textfield_widget.dart';
import '../../controller/list_orders_controller.dart';


class FilterOrder extends StatefulWidget {
  const FilterOrder();

  @override
  State<FilterOrder> createState() => _FilterOrderState();
}

class _FilterOrderState extends State<FilterOrder> {

  final controller = Get.find<ListOrdersController>();
  TextEditingController forOrderController = TextEditingController();
  DateTimeRange? _selectedDates;

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
                      const SizedBox(height: 16,),
                      AppTextInputField(
                        hint: "Tìm theo đơn hàng",
                        border: 6,
                        controller: controller.codeFilter,
                      ),
                      AppTextInputField(
                        hint: "Tìm theo tracking",
                        border: 6,
                        controller: controller.trackingFilter,
                      ),
                      TypeAheadField<TransactionName>(
                        controller: controller.customerFilter,
                        suggestionsCallback: (pattern) {
                          return controller.listCustomerName
                              .where((TransactionName item) => "${item.nickName} | ${item.idCustomer} | ${item.name}"
                              .toString()
                              .toLowerCase()
                              .contains(pattern.toLowerCase()))
                              .toList();
                        },
                        builder: (context, Controller, focusNode) {
                          return AppTextInputField(
                            hint: "Tìm theo khách hàng",
                            border: 6,
                            focusNode: focusNode,
                            controller: controller.customerFilter,
                          );
                        },
                        itemBuilder: (context, suggestion) {
                          return ListTile(
                            title: Text("${suggestion.nickName} | ${suggestion.idCustomer} | ${suggestion.name}",style: const TextStyle(fontSize: 13)),
                          );
                        },
                        onSelected: (suggestion) {
                          controller.customerFilter.text = "${suggestion.nickName} | ${suggestion.idCustomer} | ${suggestion.name}";
                          controller.idCustomerFilter.value = suggestion.id.toString();
                        },
                        loadingBuilder: (context) => const Text('Loading...'),
                        errorBuilder: (context, error) =>
                        const Text('Error!'),
                        emptyBuilder: (context) =>
                        const Text('Không có dữ liệu phù hợp'),
                      ),
                      AppTextInputField(
                        controller: controller.date,
                        hint: "Ngày",
                        suffixPath: "assets/image/calendar.svg",
                        border: 6,
                        showSuffix: true,
                        onTap: ()async {
                          showDateRangePicker(
                              confirmText: "Lưu",
                              cancelText: "Huỷ",
                              context: context,
                              initialDateRange: _selectedDates,
                              firstDate: DateTime(2020),
                              lastDate: DateTime(2030),
                              builder: (context, child) {
                                return Theme(
                                    data: ThemeData(), child: child!);
                              }).then((value) {
                            if (value != null) {
                              controller.fromDateChoose.value =
                                  value.start.toUtc().toIso8601String();
                              controller.toDateChoose.value =
                                  value.end.toUtc().toIso8601String();
                              controller.startDate =
                                  value.start.toDateTimeStringWithoutHour();
                              controller.endDate =
                                  value.end.toDateTimeStringWithoutHour();
                              controller.dateFilter.text =
                              "${controller.startDate} - ${controller.endDate}";
                            }
                          });
                        },
                      ),
                      Gap(8.h),
                      Container(
                        height: 50,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: Colors.black12)
                        ),
                        child: DropdownButton(
                            hint: const Text("Thời gian nhập hàng"),
                            value: controller.filterDateBy.value,
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
                                controller.filterDateBy.value = newValue.toString();
                                controller.filterDateBy.value = newValue.toString();
                              });
                            }
                        ),
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
                        ButtonWidget(
                          buttonText: "Áp dụng",
                          width: 140,
                          bgcolor: primaryColor,
                          borderColor: primaryColor,
                          textColor: ColorApp.whiteFA,
                          onTap: () {
                            controller.onSelected();
                            forOrderController.clear();
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
