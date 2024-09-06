import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../../core/values/app_colors.dart';
import '../../../../data/model/model/config_price.dart';
import '../../../../data/model/model/customers.dart';
import '../../../common_widget/textfield_widget.dart';
import '../../../util/images.dart';
import '../../customer_detail/controller/detail_customer_controller.dart';
import '../controller/config_price_controller.dart';
import 'item_bottom_sheet_config_price.dart';

class BottomSheetConfigPrice extends StatefulWidget {
  ShippingCost configPriceData;
  BottomSheetConfigPrice({super.key, required this.configPriceData});

  @override
  State<BottomSheetConfigPrice> createState() => BottomSheetConfigPriceState();
}

class BottomSheetConfigPriceState extends State<BottomSheetConfigPrice> {
  final detailCustomerController = Get.find<DetailCustomerController>();
  final configPriceController = Get.find<ConfigPriceController>();
  var valueChoose;
  var idConfigPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16, bottom: 32),
      child: Column(children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(children: [
            SvgPicture.asset( Images.file2, color: AppColors.primary, width: 24,),
            Gap(8.w),
            Expanded(
              child: TypeAheadField<ConfigPriceData>(
                controller: detailCustomerController.forConfigController,
                suggestionsCallback: (pattern) {
                  return configPriceController.listConfigPrice
                      .where((ConfigPriceData item) =>
                      item.configValue!.info!.description
                          .toString()
                          .toLowerCase()
                          .contains(pattern.toLowerCase()))
                      .toList();
                },
                builder: (context, controller, focusNode) {
                  return AppTextInputField(
                    hint: widget.configPriceData.configValue?.info
                        ?.description ?? "Lựa chọn bảng giá",
                    border: 6,
                    focusNode: focusNode,
                    controller: controller,
                  );
                },
                itemBuilder: (context, suggestion) {
                  return ListTile(
                    title: Text(
                        suggestion.configValue!.info!.description
                            .toString()),
                  );
                },
                onSelected: (suggestion) {
                  setState(() {
                    detailCustomerController.forConfigController.text =
                        suggestion.configValue!.info!.description
                            .toString();
                    detailCustomerController.shippingCost = suggestion.id;
                  });
                },
                loadingBuilder: (context) =>
                const Text('Loading...'),
                errorBuilder: (context, error) =>
                const Text('Error!'),
                emptyBuilder: (context) =>
                const Text('Không có dữ liệu phù hợp'),
              ),
            )
          ]),
        ),
        Expanded(
            child: Container(
              child: Obx((){
                configPriceController.filterData(detailCustomerController.shippingCost ?? 0);
                return configPriceController.filteredList.isEmpty
                    ? Center(child: CircularProgressIndicator())
                    : ItemBottomSheetConfigPrice(configPrice: configPriceController.filteredList[0])
              ;}),
            )
        )
      ])
    );
  }
}