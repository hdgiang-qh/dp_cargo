import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:vncss/app/data/model/model/bill_of_lading.dart';
import 'package:vncss/app/modules/delivery_bills/delivery/widget/skeletonizer_loading.dart';

import '../../../../generated/l10n.dart';
import '../../../core/base/base_view.dart';
import '../../../core/widget/paging_view.dart';
import '../../common_widget/app_bar_widget.dart';
import '../../common_widget/item_detail_list_widget.dart';
import '../../common_widget/item_list_widget.dart';
import '../../common_widget/title_detail_list.dart';
import '../controller/bill_of_lading_detail_controller.dart';


class BillOfLadingDetail extends BaseView<BillOfLadingDetailController> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppBarWidget(
              title: "Chi tiết vận đơn VN",
              onBack: () => Get.back(),
            ),
            Gap(8.h),
            Expanded(
                child: Obx(() {
                  if (controller.isLoading.value == false &&
                      controller.listBillOfLadingDetail.value.id == null) {
                    return SkeletonizerLoading(
                      loading: controller.isLoading.value,
                    );
                  }
                  return PagingView.builder(
                    builder: (context, index) {
                      return Column(
                        children: [
                          TitleDetailList(
                            svgPath: "assets/image/bag.svg",
                            headText: controller.listBillOfLadingDetail
                                .value
                                .vnDeliveryBoxes?[index]?.code ??
                                S.current.update,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            margin: const EdgeInsets.only(bottom: 8),
                            color: Colors.white,
                            child: Column(
                              children: [
                                ItemListWidget(
                                  headText: "Trạng thái:",
                                  showChip: true,
                                  color: controller.colorValue(
                                      status: controller
                                          .listBillOfLadingDetail
                                          .value
                                          .vnDeliveryBoxes?[index]
                                          ?.status ??
                                          10000),
                                  endText: controller.statusValue(
                                      status: controller
                                          .listBillOfLadingDetail
                                          .value
                                          .vnDeliveryBoxes?[index]
                                          ?.status ??
                                          10000),
                                  colorText: controller.colorText(
                                      status: controller
                                          .listBillOfLadingDetail
                                          .value
                                          .vnDeliveryBoxes?[index]
                                          ?.status ??
                                          10000),
                                ),
                                ItemDetailListWidget(
                                    head: "Giao bởi:",
                                    fontWeight: true,
                                    endText: controller
                                        .listBillOfLadingDetail
                                        .value
                                        .vnDeliveryBoxes?[index]
                                        ?.deliveredBy
                                        ?.fullname ??
                                        S.current.update),
                                ItemDetailListWidget(
                                    head: "Ngày nhận hàng:",
                                    fontWeight: true,
                                    endText: controller
                                        .listBillOfLadingDetail
                                        .value
                                        .vnDeliveryBoxes?[index]
                                        ?.formattedReceivedDate ??
                                        S.current.update),
                                ItemDetailListWidget(
                                    head: "Ngày trả hàng:",
                                    fontWeight: true,
                                    endText: controller
                                        .listBillOfLadingDetail
                                        .value
                                        .vnDeliveryBoxes?[index]
                                        ?.formattedReceivedDate ??
                                        S.current.update),
                                ItemDetailListWidget(
                                    head: "Ghi chú:",
                                    fontWeight: true,
                                    endText: controller
                                        .listBillOfLadingDetail
                                        .value
                                        .vnDeliveryBoxes?[index]
                                        ?.note ??
                                        S.current.isNull),
                              ],
                            ),
                          )
                        ],
                      );
                    },
                    count: controller
                        .listBillOfLadingDetail.value.vnDeliveryBoxes?.length ??
                        0,
                    onLoadNextPage: () {
                      //   controller.onLoadNextPage();
                    },
                    onRefresh: () async {
                      controller.onRefreshPage();
                    },
                  );
                })),
          ],
        ),
      ),
    );
  }
}
