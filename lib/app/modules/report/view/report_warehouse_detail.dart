import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:vncss/app/data/model/model/report_detail_model.dart';
import 'package:vncss/app/modules/delivery_bills/delivery/widget/skeletonizer_loading.dart';
import 'package:vncss/app/modules/report/controller/report_warehouse_detail_controller.dart';

import '../../../core/base/base_view.dart';
import '../../../core/widget/paging_view.dart';
import '../../common_widget/app_bar_widget.dart';
import '../../common_widget/item_detail_list_widget.dart';
import '../../common_widget/title_detail_list.dart';

class DetailWareHouse extends BaseView<ReportWarehouseDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppBarWidget(
              title: "Kho ${controller.nameWh}",
              onBack: () => Get.back(),
            ),
            Gap(8.h),
            Expanded(
                child: FutureBuilder<List<ReportWareHouseDetailModel>>(
                    future: controller.getListReportWarehouseDetail(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return SkeletonizerLoading(
                          loading: controller.isLoading.value,
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                            child: Text('Error: ${snapshot.error}'));
                      } else if (!snapshot.hasData ||
                          snapshot.data!.isEmpty) {
                        return const Center(
                            child: Text('No delivery bills found'));
                      } else {
                        return PagingView.builder(
                          builder: (context, index) {
                            return Column(
                              children: [
                                TitleDetailList(
                                  svgPath: "assets/image/copy_text.svg",
                                  headText: controller
                                      .listReportWarehouseDetail[index].name,
                                ),
                                Container(
                                  color: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16),
                                  child: Column(
                                    children: [
                                      ItemDetailListWidget(
                                        head: "Số tracking:",
                                        align: true,
                                        fontWeight: true,
                                        endText: controller
                                            .listReportWarehouseDetail[index]
                                            .trackingCount
                                            .toString(),
                                      ),
                                      ItemDetailListWidget(
                                        head: "Tổng TLKT/TLTT:",
                                        fontWeight: true,
                                        endText: controller
                                            .listReportWarehouseDetail[index]
                                            .formattedTrackingWeight,
                                      ),
                                      ItemDetailListWidget(
                                        head: "Phụ thu:",
                                        fontWeight: true,
                                        endText: controller
                                            .listReportWarehouseDetail[index]
                                            .formattedTrackingSurcharge,
                                      ),
                                      ItemDetailListWidget(
                                        head: "Tổng tiền:",
                                        fontWeight: true,
                                        endText: controller
                                            .listReportWarehouseDetail[index]
                                            .formattedTrackingTotalMoney,
                                      ),
                                    ],
                                  ),
                                ),
                                Gap(8.h)
                              ],
                            );
                          },
                          count: controller.listReportWarehouseDetail.length,
                          onLoadNextPage: () {},
                          onRefresh: () async {
                            //await controller.onDetailBill();
                          },
                        );
                      }
                    })),
            Gap(16.h),
          ],
        ),
      ),
    );
  }
}
