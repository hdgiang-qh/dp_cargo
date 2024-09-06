import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:vncss/app/data/model/model/report_detail_model.dart';
import 'package:vncss/app/modules/delivery_bills/delivery/widget/skeletonizer_loading.dart';

import '../../../core/base/base_view.dart';
import '../../../core/widget/paging_view.dart';
import '../../common_widget/app_bar_widget.dart';
import '../../common_widget/item_detail_list_widget.dart';
import '../../common_widget/item_list_widget.dart';
import '../../common_widget/title_detail_list.dart';
import '../controller/report_bill_sale_detail_controller.dart';

class DetailBillReportSale extends BaseView<ReportBillSaleDetailController> {
  @override
  final controller = Get.find<ReportBillSaleDetailController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Obx(() {
              return AppBarWidget(
                title: controller.reportDetailValue.value.fullname ?? "",
                onBack: () => Get.back(),
              );
            }),
            Gap(8.h),
            Expanded(
                child: FutureBuilder<
                        List<ReportDetailModelStatisticByDeliveryBill>>(
                    future: controller.getListReportBillSaleDetail(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return SkeletonizerLoading(
                          loading: controller.isLoading.value,
                        );
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('No data found'),
                            const SizedBox(height: 8,),
                            ElevatedButton(
                              onPressed: () async {
                              controller.loadDeliveryBills();
                              },
                              child: const Text('Tải lại dữ liệu'),
                            ),
                          ],
                        ));
                      } else {
                        return PagingView.builder(
                          builder: (context, index) {
                            return Column(
                              children: [
                                TitleDetailList(
                                  svgPath: "assets/image/copy_text.svg",
                                  headText:
                                      controller.listBillSaleDetail[index].code,
                                ),
                                Container(
                                  color: Colors.white,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 16),
                                  child: Column(
                                    children: [
                                      ItemListWidget(
                                          headText: "Trạng thái",
                                          showChip: true,
                                          color: controller.buildColor(
                                              value: controller
                                                  .listBillSaleDetail[index]
                                                  .deliveryBillStatus
                                                  .toString()),
                                          colorText: controller.buildTextColor(
                                              value: controller
                                                  .listBillSaleDetail[index]
                                                  .deliveryBillStatus
                                                  .toString()),
                                          endText: controller
                                              .listBillSaleDetail[index]
                                              .deliveryBillStatus
                                              .toString()),
                                      ItemDetailListWidget(
                                        head: "Khách hàng:",
                                        align: true,
                                        fontWeight: true,
                                        endText: controller
                                            .listBillSaleDetail[index].name
                                            .toString(),
                                      ),
                                      ItemDetailListWidget(
                                        head: "Tổng TLKT/TLTT:",
                                        fontWeight: true,
                                        endText: controller
                                            .listBillSaleDetail[index]
                                            .formattedTrackingWeight,
                                      ),
                                      ItemDetailListWidget(
                                        head: "SL Trackings:",
                                        align: true,
                                        fontWeight: true,
                                        endText: controller
                                                .listBillSaleDetail[index]
                                                .tracking
                                                ?.length
                                                .toString() ??
                                            "",
                                      ),
                                      ItemDetailListWidget(
                                        head: "Tổng tiền:",
                                        fontWeight: true,
                                        endText: controller
                                            .listBillSaleDetail[index]
                                            .formattedTrackingTotalMoney,
                                      ),
                                    ],
                                  ),
                                ),
                                Gap(8.h)
                              ],
                            );
                          },
                          count: controller.listBillSaleDetail.length,
                          onLoadNextPage: () {},
                          onRefresh: () async {
                             await controller.onRefreshPage();
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
