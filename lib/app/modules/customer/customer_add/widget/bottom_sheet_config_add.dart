import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:vncss/app/modules/customer/customer_update/controller/config_price_controller.dart';

import '../../../../core/base/base_view.dart';
import '../../../../core/values/app_colors.dart';
import '../../../../data/model/model/config_price.dart';
import '../../../common_widget/textfield_widget.dart';
import '../../../util/images.dart';
import '../../customer_screen/controller/customer_controller.dart';
import '../../customer_update/widget/item_bottom_sheet_config_price.dart';

class BottomSheetConfigAdd extends BaseView<CustomerController>{
  final configPriceController = Get.find<ConfigPriceController>();

  @override
  Widget body(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 16),
        child: Container(
          child: Column(children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(children: [
                SvgPicture.asset( Images.file2, color: AppColors.primary, width: 24,),
                Gap(8.w),
                Expanded(
                  child: TypeAheadField<ConfigPriceData>(
                    controller: controller.forConfigController,
                    suggestionsCallback: (pattern) {
                      return configPriceController.listConfigPrice
                          .where((ConfigPriceData item) =>
                          item.configValue!.info!.description
                              .toString()
                              .toLowerCase()
                              .contains(pattern.toLowerCase()))
                          .toList();
                    },
                    builder: (context, Controller, focusNode) {
                      return AppTextInputField(
                        hint: "Lựa chọn bảng giá",
                        border: 6,
                        focusNode: focusNode,
                        controller: controller.forConfigController,
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
                      controller.forConfigController.text =
                          suggestion.configValue!.info!.description
                              .toString();
                      controller.shippingCost.value = suggestion.id!;
                      configPriceController.filterData(controller.shippingCost.value);
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
                    configPriceController.filterData(controller.shippingCost.value);
                    return configPriceController.filteredList.isEmpty
                        ? SizedBox()
                        : ItemBottomSheetConfigPrice(configPrice: configPriceController.filteredList[0]);
                  }),
                )
            )
          ]),
        )
    );
  }
}