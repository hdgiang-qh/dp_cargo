import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:vncss/app/modules/order/order_update/view/order_update_screen.dart';
import '../../../../../generated/l10n.dart';
import '../../../../core/base/base_view.dart';
import '../../../../core/utils/converter_utils.dart';
import '../../../../core/values/app_colors.dart';
import '../../../../core/widget/avatar.dart';
import '../../../common_widget/button_widget.dart';
import '../../../common_widget/const.dart';
import '../../../common_widget/item_detail_list_widget.dart';
import '../../../common_widget/title_detail_list.dart';
import '../../../delivery_bills/delivery/widget/skeletonizer_loading.dart';
import '../controller/order_detail_controller.dart';

class OrderDetail extends BaseView<OrderDetailController> {
  @override
  Widget body(BuildContext context) {
    return const OrderDetailView();
  }
}

class OrderDetailView extends StatefulWidget {
  const OrderDetailView({super.key});

  @override
  State<OrderDetailView> createState() => _OrderDetailViewState();
}

class _OrderDetailViewState extends State<OrderDetailView> {
  final controller = Get.find<OrderDetailController>();

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
                  Get.back();
                },
                child: const Icon(Icons.arrow_back, size: 30),
              ),
              const Expanded(
                  child: Center(
                      child: Text(
                "Chi tiết Đơn hàng",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ))),
            ])),
        Expanded(
          child: Container(
            child: Obx(() {
              if (controller.isLoading.value == false &&
                  controller.orders.value.id == null) {
                return SkeletonizerLoading(
                  loading: controller.isLoading.value,
                );
              }
              return CustomScrollView(slivers: [
                SliverToBoxAdapter(
                  child: Column(children: [
                    const TitleDetailList(
                      svgPath: 'assets/icons/icPackage.svg',
                      headText: "Thông tin tracking",
                    ),
                    Container(
                      color: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Column(children: [
                        ItemDetailListWidget(
                            head: "Trạng thái:",
                            fontWeight: true,
                            endText: controller.orders.value.status?.value ??
                                S.current.isNull),
                        ItemDetailListWidget(
                            head: "Số lượng hàng hóa:",
                            fontWeight: true,
                            endText:
                                "${controller.orders.value.trackingAmount ?? S.current.isNull}"),
                        ItemDetailListWidget(
                            head: "Loại hàng hóa:",
                            fontWeight: true,
                            endText: controller.orders.value.trackingType?.name ??
                                    S.current.isNull),
                        ItemDetailListWidget(
                            head: "Giá trị hàng hóa:",
                            fontWeight: true,
                            endText:
                                "${formatNumberCommas("${controller.orders.value.price ?? 0}")} đ"),
                        ItemDetailListWidget(
                            head: "Ghi chú:",
                            fontWeight: true,
                            endText: controller.orders.value.note ?? ""),
                      ]),
                    ),
                    const TitleDetailList(
                      svgPath: 'assets/icons/icPackage.svg',
                      headText: "Thông tin đơn hàng",
                    ),
                    Container(
                      color: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Column(children: [
                        ItemDetailListWidget(
                            head: "Mã đơn hàng:",
                            fontWeight: true,
                            endText: controller.orders.value.orderId ?? "--"),
                        ItemDetailListWidget(
                            head: "Thùng hàng/ AWB",
                            fontWeight: true,
                            endText:
                                "${controller.orders.value.box?.code ?? "--"}/ ${controller.orders.value.awb?.code ?? "--"}"),
                        ItemDetailListWidget(
                            head: "Phiếu xuất kho:",
                            fontWeight: true,
                            endText:
                                controller.orders.value.deliveryBill?.code ??
                                    "--"),
                        ItemDetailListWidget(
                            head: "Kho US:",
                            fontWeight: true,
                            endText: controller.orders.value.warehouse?.name ??
                                "--"),
                        ItemDetailListWidget(
                            head: "Kho VN:",
                            fontWeight: true,
                            endText:
                                controller.orders.value.warehouseVn?.name ??
                                    "--"),
                      ]),
                    ),
                    const TitleDetailList(
                      svgPath: 'assets/icons/icPackage.svg',
                      headText: "Thông tin khách hàng",
                    ),
                    Container(
                      color: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Column(children: [
                        ItemDetailListWidget(
                            head: "Họ và tên:",
                            fontWeight: true,
                            endText: controller.orders.value.customer?.name ??
                                S.current.isNull),
                        ItemDetailListWidget(
                            head: "Số điện thoại:",
                            fontWeight: true,
                            endText: controller.orders.value.customer?.phone ??
                                S.current.isNull),
                        ItemDetailListWidget(
                            head: "Email:",
                            fontWeight: true,
                            endText: controller.orders.value.customer?.email ??
                                S.current.isNull),
                        ItemDetailListWidget(
                            head: "Địa chỉ:",
                            fontWeight: true,
                            align: true,
                            endText:
                                controller.orders.value.customer?.address ??
                                    S.current.isNull),
                      ]),
                    ),
                    const TitleDetailList(
                      svgPath: 'assets/icons/icPackage.svg',
                      headText: "Phí",
                    ),
                    Container(
                      color: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Column(children: [
                        ItemDetailListWidget(
                            head: "TLKT/TLTT",
                            fontWeight: true,
                            endText:
                                "${controller.orders.value.trackingCalculationWeight ?? 0} / ${controller.orders.value.trackingMiningWeight ?? 0} kg"),
                        ItemDetailListWidget(
                            head: "Giảm giá",
                            fontWeight: true,
                            endText:
                                "${formatNumberCommas("${controller.orders.value.trackingDiscountAmount ?? 0}")} đ"),
                        ItemDetailListWidget(
                            head: "Giá cước:",
                            fontWeight: true,
                            endText:
                                "${formatNumberCommas("${controller.orders.value.trackingShippingCost ?? 0}")} đ"),
                        ItemDetailListWidget(
                            head: "Phí vận chuyển:",
                            fontWeight: true,
                            endText:
                                "${formatNumberCommas("${controller.orders.value.trackingShippingFee ?? 0}")} đ"),
                        ItemDetailListWidget(
                            head: "Phụ thu:",
                            fontWeight: true,
                            endText:
                                "${formatNumberCommas("${controller.orders.value.trackingSurcharge ?? 0}")} đ"),
                        ItemDetailListWidget(
                            head: "Phí khác:",
                            fontWeight: true,
                            endText:
                                "${formatNumberCommas("${controller.orders.value.trackingOtherFee ?? 0}")} đ"),
                        ItemDetailListWidget(
                            head: "Tổng tiền:",
                            fontWeight: true,
                            endText:
                                "${formatNumberCommas("${controller.orders.value.trackingTotalMoney ?? 0}")} đ"),
                        ItemDetailListWidget(
                            head: "Thời gian khai thác",
                            fontWeight: true,
                            endText: Const.convertDate(
                                controller.orders.value.exploitedDate)),
                        ItemDetailListWidget(
                            head: "Thời gian đóng hàng",
                            fontWeight: true,
                            endText: Const.convertDate(
                                controller.orders.value.packedDate)),
                      ]),
                    ),
                    const TitleDetailList(
                      svgPath: 'assets/icons/icPackage.svg',
                      headText: "Nhân viên phụ trách",
                    ),
                    controller.orders.value.sale?.id == null
                        ? Center(child: Text("Chưa có nhân viên phụ trách"))
                        : Column(children: [
                      Container(
                        color: Colors.white,
                        padding: const EdgeInsets.all(16),
                        child: Row(children: [
                          AvatarWidget(
                            height: 25,
                            sizeIcon: 40,
                            url: controller.orders.value.sale?.avatarUrl,
                          ),
                          Gap(16.w),
                          Expanded(
                            child: Column(children: [
                              Row(children: [
                                Text(
                                    "${controller.orders.value.sale?.fullname}",
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700)),
                                const Text(" (NV Sale)",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500)),
                              ]),
                              Row(children: [
                                const Text("Điện thoại: ",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700)),
                                Text("${controller.orders.value.sale?.phone}",
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500)),
                              ]),
                              Row(children: [
                                const Text("Email: ",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700)),
                                Text("${controller.orders.value.sale?.email}",
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500)),
                              ]),
                            ]),
                          ),
                        ]),
                      ),
                      controller.orders.value.exploitedBy?.id == null
                          ? const SizedBox()
                          : Container(
                              color: Colors.white,
                              padding: const EdgeInsets.all(16),
                              child: Row(children: [
                                AvatarWidget(
                                  height: 25,
                                  sizeIcon: 40,
                                  url: controller.orders.value.sale?.avatarUrl,
                                ),
                                Gap(16.w),
                                Expanded(
                                  child: Column(children: [
                                    Row(children: [
                                      Text(
                                          "${controller.orders.value.exploitedBy?.fullname}",
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700)),
                                      const Text(" (NV Khai thác)",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500)),
                                    ]),
                                    Row(children: [
                                      const Text("Điện thoại: ",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700)),
                                      Text(
                                          "${controller.orders.value.exploitedBy?.phone}",
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500)),
                                    ]),
                                    Row(children: [
                                      const Text("Email: ",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700)),
                                      Text(
                                          "${controller.orders.value.exploitedBy?.email}",
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500)),
                                    ]),
                                  ]),
                                )
                              ]),
                            )
                    ]),
                    const TitleDetailList(
                      svgPath: 'assets/image/history.svg',
                      headText: "Lịch sử đơn hàng",
                    ),
                  ]),
                ),
                controller.listHistoryAction.length == 0
                    ? const SliverToBoxAdapter(
                        child: Center(child: Text("Chưa có đơn hàng")),
                      )
                    : SliverList(
                        delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return Container(
                            color: Colors.white,
                            padding: const EdgeInsets.all(16),
                            child: Column(children: [
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Hành động",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13),
                                    ),
                                    Container(
                                        width: 250,
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          controller
                                              .listHistoryAction[index].name
                                              .toString(),
                                          style: const TextStyle(fontSize: 13),
                                          textAlign: TextAlign.right,
                                        ))
                                  ]),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Thời gian",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13,
                                          color: Colors.grey),
                                    ),
                                    Container(
                                        width: 250,
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          Const.convertDate(controller
                                              .listHistoryAction[index]
                                              .updatedTime),
                                          style: const TextStyle(fontSize: 13),
                                        ))
                                  ]),
                            ]),
                          );
                        },
                        childCount: controller.listHistoryAction.length,
                      ))
              ]);
            }),
          ),
        ),
        Obx(() {
          return controller.orders.value.status?.value == "Hoàn thành"
              ? SizedBox()
              : ButtonWidget(
                  onTap: () async {
                    final result = await Get.to(() => OrderUpdate());
                    if (result == true) {
                      await Future.delayed(Duration(seconds: 1), () {
                        controller.getDetailOrder();
                      });
                    }
                  },
                  buttonText: "Cập nhật",
                  fontSize: 13,
                  textColor: Colors.white,
                  bgcolor: AppColors.primary,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                );
        })
      ]),
    ));
  }
}
