import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:vncss/app/modules/common_widget/const.dart';
import 'package:vncss/app/modules/delivery_bills/delivery/widget/skeletonizer_loading.dart';
import 'package:vncss/app/modules/search/view/search_barecode.dart';
import 'package:vncss/app/modules/tracking/tracking_screen/controller/tracking_controller.dart';
import 'package:vncss/app/routes/app_pages.dart';
import 'package:vncss/gen/assets.gen.dart';
import 'package:vncss/generated/l10n.dart';

import '../../../core/base/base_view.dart';
import '../../../core/widget/paging_view.dart';
import '../../common_widget/app_bar_widget.dart';
import '../../common_widget/item_detail_list_widget.dart';
import '../../common_widget/item_list_widget.dart';
import '../controller/search_tracking_controller.dart';

class SearchScreen extends BaseView<SearchTrackingController> {

  @override
  Widget body(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Column(children: [
            AppBarWidget(
              title: "Tìm kiếm theo tracking",
              onBack: () => Get.back(),
            ),
            Gap(8.h),
            Obx(() {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                height: 40,
                child: TextField(
                  focusNode: controller.focusNode,
                  controller: controller.code.value,
                  cursorColor: primaryColor,
                  decoration: InputDecoration(
                    prefixIcon: Transform.scale(
                      scale: 0.5,
                      child: Assets.image.searchRed.svg(),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () async {
                        controller.code.value.clear();
                        final result = await Get.toNamed(Routes.SEARCH_BARCODE);
                        if (result == true) {
                          controller.getSearchTrackingList();
                        }
                      },
                      icon: Assets.image.barcodeRed.svg(),
                    ),
                    hintText: "Tìm kiếm theo tracking",
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide:
                            const BorderSide(color: primaryColor, width: 0.2)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: const BorderSide(color: primaryColor)),
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  ),
                  onSubmitted: (value) {
                    controller.getSearchTrackingList();
                  },
                ),
              );
            }),
            Gap(8.h),
            Expanded(child: Obx(() {
              // if (controller.isLoading.value == false && controller.listSearchTracking.isEmpty) {
              //   return FutureBuilder(
              //     future: Future.delayed(const Duration(seconds: 1)),
              //     builder: (context, snapshot) {
              //       if (snapshot.connectionState == ConnectionState.waiting) {
              //         return SkeletonizerLoading(
              //           loading: controller.isLoading.value,
              //         );
              //       } else {
              //         return const Center(
              //             child: Column(
              //               mainAxisAlignment: MainAxisAlignment.center,
              //               children: [
              //                 Text("Không tìm thấy kết quả"),
              //               ],
              //             ));
              //       }
              //     },
              //   );
              // }
              return PagingView.builderSearch(
                  onLoadNextPage: () {},
                  builder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.DETAIL_TRACKING, arguments: {
                          'id': controller.listSearchTracking[index].id,
                          'indexTap': 0
                        });
                      },
                      child: Container(
                        color: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Column(
                          children: [
                            ItemListWidget(
                                headText: controller
                                    .listSearchTracking[index].orderId
                                    .toString(),
                                svgPath: "assets/image/copy_text.svg",
                                showIcon: true,
                                fontWeightHead: true,
                                showChip: true,
                                onCopyText: () {
                                  Clipboard.setData(ClipboardData(
                                      text: controller.listSearchTracking[index]
                                          .exploitStatus
                                          .toString()));
                                  Fluttertoast.showToast(
                                      msg: "Đã copy vào clipboard",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                },
                                color: controller.buildColor(
                                    value: controller
                                        .listSearchTracking[index].exploitStatus
                                        .toString()),
                                colorText: controller.buildTextColor(
                                    value: controller
                                        .listSearchTracking[index].exploitStatus
                                        .toString()),
                                endText: controller
                                    .listSearchTracking[index].exploitStatus
                                    .toString()),
                            ItemDetailListWidget(
                                head: "Tên sản phẩm",
                                endText: controller
                                    .listSearchTracking[index].productName
                                    .toString()),
                            ItemDetailListWidget(
                                head: "Loại sản phẩm",
                                endText: controller.listSearchTracking[index]
                                        .trackingType?.name
                                        .toString() ??
                                    S.current.isNull),
                            ItemDetailListWidget(
                                head: "Tiền",
                                endText: controller.listSearchTracking[index]
                                    .formattedTrackingTotalMoney),
                            ItemDetailListWidget(
                                head: "Khách hàng",
                                endText: controller.listSearchTracking[index]
                                        .customer?.name ??
                                    S.current.isNull),
                            ItemDetailListWidget(
                                head: "Kho US",
                                endText: controller.listSearchTracking[index]
                                        .warehouse?.name ??
                                    S.current.isNull),
                            ItemDetailListWidget(
                                head: "Kho VN",
                                endText: controller.listSearchTracking[index]
                                        .warehouseVn?.name ??
                                    S.current.isNull)
                          ],
                        ),
                      ),
                    );
                  },
                  count: controller.listSearchTracking.length);
            }))
          ])
        ],
      )),
    );
  }
}
