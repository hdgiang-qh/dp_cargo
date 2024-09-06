import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vncss/app/data/model/model/bill_of_lading.dart';
import 'package:vncss/app/modules/common_widget/dialog_widget.dart';
import 'package:vncss/app/modules/delivery_bills/delivery/widget/skeletonizer_loading.dart';
import 'package:vncss/app/routes/app_pages.dart';
import '../../core/base/base_view.dart';
import '../../core/widget/paging_view.dart';
import '../common_widget/app_bar_widget.dart';
import '../common_widget/button_widget.dart';
import '../common_widget/const.dart';
import '../common_widget/item_detail_list_widget.dart';
import '../common_widget/item_list_widget.dart';
import '../util/images.dart';
import 'controller/partner_controller.dart';

class ShippingPartnerScreen extends BaseView<PartnerController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          AppBarWidget(
            title: "Đối tác vận chuyển",
            onBack: () => Get.back(),
          ),
          const SizedBox(
            height: 8,
          ),
          Expanded(
              child: FutureBuilder<List<BillOfLadingVnDeliveryUnit>>(
                  future: controller.getDeliveryUnit(),
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
                      return Obx(() {
                        return PagingView.separated(
                            onLoadNextPage: () {
                              controller.onLoadNextPage();
                            },
                            onRefresh: () async {
                              controller.onRefreshPage();
                            },
                            builder: (context, index) {
                              return Container(
                                color: Colors.white,
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                child: Column(
                                  children: [
                                    ItemListWidget(
                                      headText: controller.listDeliveryUnit[index].code
                                          .toString(),
                                      showIcon: true,
                                      fontWeightHead: true,
                                      svgPath: Images.truck,
                                      showChip: true,
                                      endText: controller.statusValue(
                                          stt:
                                          controller.listDeliveryUnit[index].status ??
                                              1000),
                                      color: controller
                                          .statusColor(
                                          stt: controller
                                              .listDeliveryUnit[index].status ??
                                              1000)
                                          .withOpacity(0.4),
                                      colorText: controller.statusColor(
                                          stt:
                                          controller.listDeliveryUnit[index].status ??
                                              1000),
                                    ),
                                    ItemDetailListWidget(
                                        head: "Tên:",
                                        endText: controller.listDeliveryUnit[index].name
                                            .toString()),
                                    ItemDetailListWidget(
                                      head: 'Logo:',
                                      align: true,
                                      fontWeight: true,
                                      imageAvt: true,
                                      endText:
                                      controller.listDeliveryUnit[index].logoUrl ??
                                          "--",
                                    ),
                                    controller.listDeliveryUnit[index].status == 0
                                        ? Row(
                                      children: [
                                        Expanded(
                                            child: ButtonWidget(
                                              buttonText: "Sửa",
                                              margin: const EdgeInsets.only(left: 16),
                                              borderColor: primaryColor,
                                              textColor: primaryColor,
                                              onTap: () {
                                                Get.toNamed(
                                                    Routes.DETAIL_SHIPPING_PARTNER,
                                                    arguments: {
                                                      "id": controller
                                                          .listDeliveryUnit[index].id
                                                    });
                                              },
                                            )),
                                        const SizedBox(
                                          width: 16,
                                        ),
                                        Expanded(
                                            child: ButtonWidget(
                                              buttonText: "Ẩn hoạt động",
                                              margin: const EdgeInsets.only(right: 16),
                                              borderColor: primaryColor,
                                              bgcolor: primaryColor,
                                              textColor: ColorApp.whiteFA,
                                              onTap: () {
                                                Get.dialog(
                                                  CustomDialog(
                                                    title: "Xác nhận ẩn đối tác này?",
                                                    onTapYes: () async {
                                                      controller.disposeDeliveryUnit(
                                                          controller
                                                              .listDeliveryUnit[
                                                          index]
                                                              .id ??
                                                              0);
                                                      Get.back();
                                                      Future.delayed(
                                                          const Duration(
                                                              milliseconds: 500), () {
                                                        controller.onRefreshPage();
                                                      });
                                                    },
                                                    onTapNo: () {
                                                      Get.back();
                                                    },
                                                  ),
                                                );
                                              },
                                            )),
                                      ],
                                    )
                                        : const SizedBox()
                                  ],
                                ),
                              );
                            },
                            count: controller.listDeliveryUnit.length,
                            separatorBuilder: (context, index) => const SizedBox(
                              height: 16,
                            ));
                      });
                    }
                  })),
          ButtonWidget(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            buttonText: "Thêm đối tác vận chuyển",
            borderColor: primaryColor,
            bgcolor: primaryColor,
            textColor: ColorApp.whiteFA,
            onTap: () {
              Get.toNamed(Routes.ADD_SHIPPING_PARTNER);
            },
          )
        ]),
      ),
    );
  }
}
