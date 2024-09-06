import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:vncss/app/core/base/base_view.dart';
import 'package:vncss/app/core/values/app_colors.dart';
import 'package:vncss/app/core/widget/dialog/app_snackbar.dart';
import 'package:vncss/app/data/model/model/delivery_bill_detail.dart';
import 'package:vncss/app/data/model/model/staff.dart';
import 'package:vncss/app/modules/common_widget/button_widget.dart';
import 'package:vncss/app/modules/common_widget/const.dart';
import 'package:vncss/app/modules/common_widget/textfield_widget.dart';
import 'package:vncss/app/modules/delivery_bills/delivery/delivery_detail/controller/detail_delivery_controller.dart';
import 'package:vncss/app/modules/delivery_bills/delivery/delivery_detail/view/widget/item_detail.dart';
import 'package:vncss/app/modules/delivery_bills/delivery/widget/skeletonizer_loading.dart';
import 'package:vncss/app/modules/delivery_bills/list_delivery_bills/view/widgets/status_widget.dart';
import 'package:vncss/app/modules/staff/controller/staff_controller.dart';
import 'package:vncss/app/routes/app_pages.dart';
import 'package:vncss/generated/l10n.dart';

import '../../../../../core/enum/delivery_bill_status.dart';
import '../../../../../core/values/app_text_styles.dart';
import '../../../../../core/widget/paging_view.dart';
import '../../../../bill_of_lading/controller/bill_of_lading_controller.dart';
import '../../../../common_widget/app_bar_widget.dart';
import '../../../../common_widget/dialog_widget.dart';
import '../../../../common_widget/item_detail_list_widget.dart';
import '../../../../common_widget/title_detail_list.dart';
import '../../../../main/controllers/main_controller.dart';
import '../../widget/item_status_delivery.dart';

class DetailDeliveryBill extends BaseView<DetailDeliveryController> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void openDrawer() {
    _scaffoldKey.currentState?.openEndDrawer();
  }

  final controllerBol = Get.find<BillOfLadingController>();
  final controllerStaff = Get.find<StaffController>();
  final controllerMain = Get.find<MainController>();

  Widget buildBanner() {
    return Obx(() {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
              color: controller.buildColor(
                  value:
                      controller.deliveryBill.value.deliveryBillStatus?.value ??
                          S.current.isNull),
              width: 1.0,
              style: BorderStyle.solid),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              "assets/image/promissory.svg",
              color: controller.buildColor(
                  value:
                      controller.deliveryBill.value.deliveryBillStatus?.value ??
                          S.current.isNull),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controller.deliveryBill.value.deliveryBillStatus?.value ??
                      S.current.isNull,
                  style: TextStyle(
                      color: controller.buildColor(
                          value: controller.deliveryBill.value
                                  .deliveryBillStatus?.value ??
                              S.current.isNull),
                      fontWeight: FontWeight.w700),
                ),
                Row(
                  children: [
                    const Text(
                      "Mã phiếu: ",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      controller.deliveryBill.value.code.toString(),
                      style: TextStyle(
                          color: controller.buildColor(
                              value: controller.deliveryBill.value
                                      .deliveryBillStatus?.value ??
                                  S.current.isNull),
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
                Text(
                  "Tổng số lượng tracking: ${controller.deliveryBill.value.trackings?.length ?? S.current.isNull}",
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                )
              ],
            )
          ],
        ),
      );
    });
  }

  Widget buildInforDelivery(BuildContext context) {
    return Obx(() {
      return Column(
        children: [
          Row(
            children: [
              const Expanded(
                flex: 2,
                child: TitleDetailList(
                  svgPath: "assets/image/delivery_bill.svg",
                  headText: "Thông tin phiếu XK",
                ),
              ),
              controller.deliveryBill.value.deliveryBillStatus?.value ==
                      DeliveryStatus.newDeliveryBill.value.toString()
                  ? controllerMain.userLogin.value.role!.id == 7
                      ? const SizedBox()
                      : Expanded(
                          child: ButtonWidget(
                            buttonText: "Sửa phiếu",
                            textColor: ColorApp.whiteFA,
                            bgcolor: ColorApp.yellowE8,
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            onTap: () async {
                              controller.onClearValue();
                              final result =
                                  await Get.toNamed(Routes.EDIT_DELIVERY_BILLS);
                              if (result == true) {
                                Future.delayed(
                                    const Duration(milliseconds: 1500), () {
                                  controller.getDetailDelivery();
                                });
                              }
                            },
                          ),
                        )
                  : const SizedBox()
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(),
                  child: Column(
                    children: [
                      ItemDetailListWidget(
                        head: "Trạng thái:",
                        endText: controller
                                .deliveryBill.value.deliveryBillStatus?.value ??
                            S.current.isNull,
                        color: controller.buildColor(
                            value: controller.deliveryBill.value
                                    .deliveryBillStatus?.value ??
                                S.current.isNull),
                        fontWeight: true,
                      ),
                      ItemDetailListWidget(
                        head: "Mã phiếu:",
                        endText: controller.deliveryBill.value.code.toString(),
                        fontWeight: true,
                      ),
                      ItemDetailListWidget(
                        head: "Người nhận:",
                        endText: controller.deliveryBill.value.name.toString(),
                        fontWeight: true,
                      ),
                      ItemDetailListWidget(
                        head: "Điện thoại:",
                        fontWeight: true,
                        endText: controller.deliveryBill.value.customerPhone
                            .toString(),
                      ),
                      ItemDetailListWidget(
                        head: "Email:",
                        fontWeight: true,
                        endText: controller.deliveryBill.value.email.toString(),
                      ),
                      ItemDetailListWidget(
                        head: "Tổng khối lượng (TLKT/TLTT):",
                        fontWeight: true,
                        endText:
                            "${controller.deliveryBill.value.formattedTrackingMiningWeight}/${controller.deliveryBill.value.formattedTrackingTotalWeight}",
                      ),
                      controller.deliveryBill.value.deliveryBillStatus?.value ==
                              DeliveryStatus.warehouse.value.toString()
                          ? ItemDetailListWidget(
                              head: "Tổng tiền:",
                              fontWeight: true,
                              endText: controller.deliveryBill.value
                                  .formattedTrackingTotalMoney,
                            )
                          : const SizedBox(),
                      ItemDetailListWidget(
                        head: "Địa chỉ:",
                        fontWeight: true,
                        endText: controller.deliveryBill.value.customerAddress
                            .toString(),
                        align: true,
                      ),
                      ItemDetailListWidget(
                        head: "Ghi chú:",
                        fontWeight: true,
                        endText: controller.deliveryBill.value.note ??
                            S.current.isNull,
                        align: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }

  Widget buildListTracking(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Expanded(
              flex: 2,
              child: TitleDetailList(
                svgPath: "assets/image/list1.svg",
                headText: "Danh sách Trackings",
              ),
            ),
            controller.deliveryBill.value.deliveryBillStatus?.value ==
                        DeliveryStatus.newDeliveryBill.value.toString() ||
                    controller.deliveryBill.value.deliveryBillStatus?.value ==
                        DeliveryStatus.saleApproved.value.toString() ||
                    controller.deliveryBill.value.deliveryBillStatus?.value ==
                        DeliveryStatus.accountantApproved.value.toString()
                ? Expanded(
                    child: ButtonWidget(
                      margin: const EdgeInsets.only(right: 16, bottom: 4),
                      buttonText: "Thêm tracking",
                      borderColor: primaryColor,
                      textColor: primaryColor,
                      onTap: () {
                        openDrawer();
                      },
                    ),
                  )
                : const SizedBox()
          ],
        ),
        Column(
          children: [
            controller.tracking.isNotEmpty
                ? Obx(() {
                    return PagingView.builderTracking(
                      scroll: false,
                      count: controller.tracking.length,
                      builder: (context, index) {
                        return Slidable(
                          endActionPane: ActionPane(
                            motion: const ScrollMotion(),
                            extentRatio: 0.2,
                            children: [
                              SlidableAction(
                                onPressed: (context) async {
                                  final result = await Get.toNamed(
                                      Routes.EDIT_TRACKING_DELIVERY_BILLS,
                                      arguments: {
                                        "id": controller.tracking[index].id,
                                        'idBill':
                                            controller.deliveryBill.value.id
                                      });
                                  if (result == true) {
                                    Future.delayed(
                                        const Duration(milliseconds: 1000), () {
                                      controller.getDetailDelivery();
                                      controller
                                          .getListTrackingCustomerDetail();
                                    });
                                  }
                                },
                                backgroundColor: Colors.blueAccent,
                                foregroundColor: Colors.white,
                                icon: Icons.remove_red_eye_outlined,
                              ),
                            ],
                          ),
                          enabled: controller.deliveryBill.value
                                          .deliveryBillStatus?.value
                                          .toString() ==
                                      DeliveryStatus.newDeliveryBill.value
                                          .toString() ||
                                  controller.deliveryBill.value
                                          .deliveryBillStatus?.value
                                          .toString() ==
                                      DeliveryStatus.saleApproved.value
                                          .toString() ||
                                  controller.deliveryBill.value
                                          .deliveryBillStatus?.value
                                          .toString() ==
                                      DeliveryStatus.accountantApproved.value
                                          .toString()
                              ? controllerMain.userLogin.value.role?.id != 7
                                  ? true
                                  : false
                              : false,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 16),
                            decoration:
                                const BoxDecoration(color: Colors.white),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ItemTracking(
                                  svgPath: "assets/image/note_search.svg",
                                  title: controller.tracking[index].code
                                      .toString(),
                                  codeTracking: true,
                                ),
                                Gap(10.h),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: ItemTracking(
                                          svgPath: "assets/image/scale.svg",
                                          title:
                                              "${controller.tracking[index].trackingCalculationWeight.toString()} kg"),
                                    ),
                                    Expanded(
                                      child: ItemTracking(
                                          svgPath: "assets/image/coin.svg",
                                          title: controller.tracking[index]
                                              .formattedTrackingTotalMoney),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      onLoadNextPage: () {},
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox();
                      },
                    );
                  })
                : Container(
                    color: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Center(
                      child: Text(
                        'Không có dữ liệu',
                        style: Theme.of(context)
                            .BodyText1
                            .copyWith(color: AppColors.neutrals08),
                      ),
                    ),
                  ),
            controller.deliveryBill.value.deliveryBillStatus?.value
                        .toString() ==
                    DeliveryStatus.delivering.value.toString()
                ? Container(
                    margin: const EdgeInsets.only(top: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Expanded(
                            child: ButtonWidget(
                          buttonText: "Hoàn thành giao",
                          textColor: ColorApp.whiteFA,
                          bgcolor: ColorApp.green23,
                          onTap: () {
                            Get.dialog(CustomDialog(
                                title: "Xác nhận thay đổi trạng thái vận đơn?",
                                onTapYes: () {
                                  controller.finishDeliveryBill();
                                  Get.back();
                                  Get.back(result: true);
                                },
                                onTapNo: () => Get.back()));
                          },
                        )),
                        Gap(16.w),
                        Expanded(
                            child: ButtonWidget(
                          buttonText: "Giao thất bại",
                          textColor: ColorApp.whiteFA,
                          bgcolor: primaryColor,
                          onTap: () {
                            Get.dialog(CustomDialog(
                                title: "Xác nhận thay đổi trạng thái vận đơn?",
                                onTapYes: () {
                                  controller.failedDeliveryBill();
                                  Get.back();
                                  Get.back(result: true);
                                },
                                onTapNo: () => Get.back()));
                          },
                        ))
                      ],
                    ),
                  )
                : const SizedBox()
          ],
        ),
        Gap(8.h),
      ],
    );
  }

  Widget buildInforCustom() {
    return Column(
      children: [
        const TitleDetailList(
          svgPath: "assets/image/delivery_bill.svg",
          headText: "Thông tin phiếu khách hàng",
        ),
        Obx(() {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: const BoxDecoration(color: Colors.white),
            child: Column(
              children: [
                Column(
                  children: [
                    ItemDetailListWidget(
                      head: "Họ và tên khách hàng:",
                      endText: controller.deliveryBill.value.customer?.name ??
                          S.current.isNull,
                    ),
                    ItemDetailListWidget(
                      head: "Giới tính:",
                      endText: controller.deliveryBill.value.customer?.gender
                                  .toString() ==
                              "female"
                          ? S.current.female
                          : S.current.male,
                    ),
                    ItemDetailListWidget(
                      head: "Điện thoại:",
                      endText: controller.deliveryBill.value.customer?.phone ??
                          S.current.isNull,
                    ),
                    ItemDetailListWidget(
                      head: "Số dư:",
                      endText: controller
                              .deliveryBill.value.customer?.formattedBalance
                              .toString() ??
                          S.current.isNull,
                    ),
                    ItemDetailListWidget(
                      head: "Công nợ tối đa:",
                      endText: controller.deliveryBill.value.customer
                              ?.formattedCreditAmount ??
                          S.current.isNull,
                    ),
                    ItemDetailListWidget(
                      head: "Địa chỉ:",
                      endText:
                          controller.deliveryBill.value.customer?.address ??
                              S.current.isNull,
                      align: true,
                    ),
                  ],
                ),
              ],
            ),
          );
        }),
        Gap(8.h),
        Obx(() {
          return buildInforReceiver();
        })
      ],
    );
  }

  Widget buildInforReceiver() {
    return Column(
      children: [
        const TitleDetailList(
          svgPath: "assets/image/delivery_bill.svg",
          headText: "Thông tin người nhận",
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            children: [
              ItemDetailListWidget(
                head: "Họ và tên:",
                endText: controller.deliveryBill.value.name ?? S.current.isNull,
              ),
              ItemDetailListWidget(
                head: "Điện thoại:",
                endText: controller.deliveryBill.value.customerPhone ??
                    S.current.isNull,
              ),
              ItemDetailListWidget(
                head: "Email:",
                endText:
                    controller.deliveryBill.value.email ?? S.current.isNull,
              ),
              ItemDetailListWidget(
                head: "Địa chỉ:",
                endText: controller.deliveryBill.value.customerAddress ??
                    S.current.isNull,
                align: true,
              ),
              ItemDetailListWidget(
                head: "Ghi chú:",
                endText: controller.deliveryBill.value.note ?? S.current.isNull,
              ),
              ButtonWidget(
                buttonText: "Cập nhật",
                margin: const EdgeInsets.symmetric(horizontal: 16),
                textColor: ColorApp.whiteFA,
                bgcolor: primaryColor,
                onTap: () async {
                  final result = await Get.toNamed(Routes.EDIT_DELIVERY_BILLS);
                  if (result == true) {
                    Future.delayed(const Duration(milliseconds: 1500), () {
                      controller.getDetailDelivery();
                    });
                  }
                },
              ),
            ],
          ),
        ),
        Gap(8.h),
      ],
    );
  }

  Widget buildFooter({required String status}) {
    Widget y = Container();
    switch (status) {
      case "Phiếu mới tạo":
        y = FooterStatusNewDelivery(
          checkRole:
              controllerMain.userLogin.value.role?.id == 7 ? true : false,
          onCancel: () {
            Get.dialog(
              CustomDialog(
                title: "Bạn có muốn hủy phiếu này không?",
                onTapYes: () async {
                  controller.cancelDeliveryBill();
                  Get.back();
                  Get.back(result: true);
                },
                onTapNo: () {
                  Get.back();
                },
              ),
            );
          },
          trackingEmpty: controller.tracking.isEmpty ? true : false,
          onSaleApprove: () {
            Get.dialog(
              CustomDialog(
                title:
                    "Sale xác nhận duyệt cho phần tạo phiếu xuất kho: ${controller.deliveryBill.value.code}",
                onTapYes: () async {
                  controller.saleApproveDeliveryBill();
                  Get.back();
                  Get.back(result: true);
                },
                onTapNo: () {
                  Get.back();
                },
              ),
            );
          },
          onSkipApprove: () {
            Get.dialog(
              CustomDialog(
                title:
                    "Quản lý xác nhận xuất hàng: ${controller.deliveryBill.value.code}",
                onTapYes: () async {
                  controller.skipApproveDeliveryBill();
                  Get.back();
                  Get.back(result: true);
                },
                onTapNo: () {
                  Get.back();
                },
              ),
            );
          },
        );
      case "Sale duyệt":
        y = FooterStatusSaleApprove(
          checkRole:
              controllerMain.userLogin.value.role?.id == 7 ? true : false,
          onCancel: () {
            Get.dialog(
              CustomDialog(
                title: "Bạn có muốn hủy phiếu này không?",
                onTapYes: () async {
                  controller.cancelDeliveryBill();
                  Get.back();
                  Get.back(result: true);
                },
                onTapNo: () {
                  Get.back();
                },
              ),
            );
          },
          onAccountantApprove: () {
            Get.dialog(
              CustomDialog(
                title:
                    "Kế toán xác nhận duyệt cho phần tạo phiếu xuất kho: ${controller.deliveryBill.value.code}",
                showContent: true,
                widget: Text(
                  "Số dư ví sau khi thanh toán: ${controller.balance}",
                  style: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.w500),
                ),
                onTapYes: () async {
                  controller.accountantApproveDeliveryBill();
                  Get.back();
                  Get.back(result: true);
                },
                onTapNo: () {
                  Get.back();
                },
              ),
            );
          },
          onSkipApprove: () {
            Get.dialog(
              CustomDialog(
                title:
                    "Quản lý xác nhận xuất hàng: ${controller.deliveryBill.value.code}",
                onTapYes: () async {
                  controller.skipApproveDeliveryBill();
                  Get.back();
                  Get.back(result: true);
                },
                onTapNo: () {
                  Get.back();
                },
              ),
            );
          },
        );
      case "Kế toán duyệt":
        y = FooterStatusAccountantApprove(
          checkRole:
              controllerMain.userLogin.value.role?.id == 7 ? true : false,
          onCancel: () {
            Get.dialog(
              CustomDialog(
                title: "Bạn có muốn hủy phiếu này không?",
                onTapYes: () async {
                  controller.cancelDeliveryBill();
                  Get.back();
                  Get.back(result: true);
                },
                onTapNo: () {
                  Get.back();
                },
              ),
            );
          },
          onCustomApprove: () {
            Get.dialog(
              CustomDialog(
                title: "Xác nhận yêu cầu từ khách hàng?",
                onTapYes: () async {
                  controller.customApproveDeliveryBill();
                  Get.back();
                  Get.back(result: true);
                },
                onTapNo: () {
                  Get.back();
                },
              ),
            );
          },
        );
      case "Yêu cầu xuất kho":
        y = FooterStatusSkipApprove(
          checkRole:
              controllerMain.userLogin.value.role?.id == 7 ? true : false,
          onPack: () async {
            final result =
                await Get.toNamed(Routes.SEARCH_BARCODE_TRACKING_DELIVERY);
            if (result == true) {
              Future.delayed(const Duration(milliseconds: 1000), () {
                controller.getDetailDelivery();
              });
            }
          },
        );
      case "Đã đóng hàng":
        y = FooterStatusPacked(
          onCancel: () {
            Get.dialog(
              CustomDialog(
                title: "Bạn có muốn hủy phiếu này không?",
                onTapYes: () async {
                  controller.cancelDeliveryBill();
                  Get.back();
                  Get.back(result: true);
                },
                onTapNo: () {
                  Get.back();
                },
              ),
            );
          },
          onAddBol: () async {
            controllerBol.onClearValue();
            final result = await Get.toNamed(
                Routes.CREATE_BILL_0F_LADING_DELIVERY,
                arguments: controller.deliveryBill.value.code);
            if (result == true) {
              Future.delayed(const Duration(milliseconds: 500), () {
                controller.getDetailDelivery();
              });
            }
          },
          onDelivering: () {
            Get.dialog(
              CustomDialog(
                title: "Xác nhận giao hàng cho bên vị vận chuyển?",
                onTapYes: () async {
                  controller.packDeliveryBill();
                  Get.back();
                  Get.back(result: true);
                },
                onTapNo: () {
                  Get.back();
                },
              ),
            );
          },
          empty: controller.deliveryBill.value.vnDeliveryBoxes!.isEmpty
              ? true
              : false,
          onShipper: () async {
            if (controller.deliveryBill.value.vnDeliveryBoxes!.isEmpty) {
              AppSnackBar.showIsEmpty(message: "Hãy tạo vận đơn");
            } else {
              controllerStaff.shipper.clear();
              controllerStaff.getListShipper();
              final result = await Get.dialog(buildAssignShipper());
              if (result == true) {
                Future.delayed(const Duration(milliseconds: 1000), () {
                  controller.getDetailDelivery();
                });
              }
            }
          },
        );
      case "Đang giao hàng":
        y = FooterStatusDelivering(
          onAddBol: () async {
            controllerBol.onClearValue();
            final result = await Get.toNamed(
                Routes.CREATE_BILL_0F_LADING_DELIVERY,
                arguments: controller.deliveryBill.value.code);
            if (result == true) {
              Future.delayed(const Duration(milliseconds: 500), () {
                controller.getDetailDelivery();
              });
            }
          },
        );
      case "Đơn hàng giao không thành công":
        y = FooterUnSuccessful(
          bolEmpty:
              controller.deliveryBill.value.vnDeliveryBoxes?.isEmpty ?? false
                  ? true
                  : false,
          onExportAgain: () {
            Get.dialog(
              CustomDialog(
                title: "Xác nhận đóng hàng và thanh toán?",
                onTapYes: () async {
                  controller.exportDeliveryBill();
                  Get.back();
                  Get.back(result: true);
                },
                onTapNo: () {
                  Get.back();
                },
              ),
            );
          },
          onCancel: () {
            Get.dialog(
              CustomDialog(
                title: "Bạn có muốn hủy phiếu này không?",
                onTapYes: () async {
                  controller.cancelDeliveryBill();
                  Get.back();
                  Get.back(result: true);
                },
                onTapNo: () {
                  Get.back();
                },
              ),
            );
          },
        );
    }
    return y;
  }

  Widget buildExpense() {
    return Obx(() {
      return Column(
        children: [
          const TitleDetailList(
            svgPath: "assets/image/coins.svg",
            headText: "Chi phí",
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: const BoxDecoration(color: Colors.white),
            child: Column(
              children: [
                ItemExpense(
                  title: "(1) Phí DV",
                  value: Const.convertPrice(controller.totalOtherFee.value),
                ),
                ItemExpense(
                  title: "(2) Phụ thu",
                  value: Const.convertPrice(controller.totalSurcharge.value),
                ),
                ItemExpense(
                  title: "(3) Phí ship",
                  value: Const.convertPrice(controller.totalShip.value),
                ),
                ItemExpense(
                  title: "(4) Giảm giá",
                  value: Const.convertPrice(controller.totalDiscount.value),
                ),
                ItemExpense(
                  title: "Tổng số tiền:",
                  fontW: true,
                  value:
                      controller.deliveryBill.value.formattedTrackingTotalMoney,
                ),
              ],
            ),
          )
        ],
      );
    });
  }

  Widget buildBillOfLading(BuildContext context) {
    return Column(
      children: [
        const TitleDetailList(
          svgPath: "assets/icons/ic_list.svg",
          headText: 'Danh sách mã vận đơn',
        ),
        controller.deliveryBill.value.vnDeliveryBoxes?.isNotEmpty ?? false
            ? Obx(() {
                return Container(
                    color: AppColors.colorWhite,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    child: PagingView.builderTracking(
                      scroll: false,
                      onLoadNextPage: () {},
                      builder: (context, index) {
                        return GestureDetector(
                          onTap: () async {
                            if (controller.deliveryBill.value
                                    .vnDeliveryOrder?[index].status ==
                                2) {
                              return;
                            } else {
                              final result = await Get.toNamed(
                                  Routes.DETAIL_BOL_DELIVERY_BILL,
                                  arguments: {
                                    'id': controller.deliveryBill.value
                                        .vnDeliveryOrder?[index].id,
                                  });
                              if (result == true) {
                                Future.delayed(
                                    const Duration(milliseconds: 1000), () {
                                  controller.getDetailDelivery();
                                });
                              }
                            }
                          },
                          child: Slidable(
                            enabled: controller.deliveryBill.value
                                            .vnDeliveryOrder?[index].status ==
                                        2 ||
                                    controller.deliveryBill.value
                                            .vnDeliveryOrder?[index].status ==
                                        3
                                ? false
                                : true,
                            endActionPane: ActionPane(
                              motion: const ScrollMotion(),
                              extentRatio: controller.deliveryBill.value
                                          .vnDeliveryOrder?[index].status ==
                                      0
                                  ? 0.8
                                  : 0.4,
                              children: [
                                controller.deliveryBill.value
                                            .vnDeliveryOrder?[index].status ==
                                        0
                                    ? SlidableAction(
                                        onPressed: (context) async {
                                          final result = await Get.toNamed(
                                              Routes.UPDATE_BILL_0F_LADING,
                                              arguments: {
                                                'id': controller
                                                        .deliveryBill
                                                        .value
                                                        .vnDeliveryOrder?[index]
                                                        .id ??
                                                    0,
                                              });
                                          if (result == true) {
                                            Future.delayed(
                                                const Duration(
                                                    milliseconds: 1200), () {
                                              controller.getDetailDelivery();
                                            });
                                          }
                                        },
                                        backgroundColor: Colors.red,
                                        foregroundColor: Colors.white,
                                        icon: Icons.edit,
                                      )
                                    : const SizedBox(),
                                controller.deliveryBill.value
                                            .vnDeliveryOrder?[index].status ==
                                        0
                                    ? SlidableAction(
                                        onPressed: (context) async {
                                          controllerStaff.shipper.clear();
                                          controllerStaff.getListShipper();
                                          controllerBol.idDeliOrder = controller
                                              .deliveryBill
                                              .value
                                              .vnDeliveryOrder?[index]
                                              .id;
                                          final result = await Get.dialog(
                                              buildAssignShipperDetail());
                                          if (result == true) {
                                            Future.delayed(
                                                const Duration(
                                                    milliseconds: 1000), () {
                                              controller.getDetailDelivery();
                                            });
                                          }
                                        },
                                        backgroundColor: ColorApp.green26,
                                        foregroundColor: Colors.white,
                                        icon: Icons.person_2_outlined,
                                      )
                                    : SlidableAction(
                                        onPressed: (context) async {
                                          controllerBol.idDeliOrder = controller
                                              .deliveryBill
                                              .value
                                              .vnDeliveryOrder?[index]
                                              .id;
                                          final result = await Get.dialog(
                                              CustomDialog(
                                                  title:
                                                      "Xác nhận thay đổi trạng thái vận đơn?",
                                                  onTapYes: () {
                                                    controllerBol
                                                        .changeSuccessDetail();
                                                    Get.back(result: true);
                                                  },
                                                  onTapNo: () => Get.back()));
                                          if (result == true) {
                                            Future.delayed(
                                                const Duration(
                                                    milliseconds: 1000), () {
                                              controller.getDetailDelivery();
                                            });
                                          }
                                        },
                                        backgroundColor: ColorApp.green26,
                                        foregroundColor: Colors.white,
                                        icon: Icons.check,
                                      ),
                                controller.deliveryBill.value
                                            .vnDeliveryOrder?[index].status ==
                                        0
                                    ? SlidableAction(
                                        onPressed: (context) async {
                                          for (var item in controller
                                                  .deliveryBill
                                                  .value
                                                  .vnDeliveryBoxes ??
                                              []) {
                                            controllerBol.deliId.clear();
                                            controllerBol.deliId
                                                .add(item.deliveredById ?? 0);
                                          }
                                          if (controllerBol.deliId[0] == 0) {
                                            if (controller
                                                    .deliveryBill
                                                    .value
                                                    .vnDeliveryOrder?[index]
                                                    .vnDeliveryUnitId ==
                                                11) {
                                              controllerBol.idDeliOrder =
                                                  controller
                                                      .deliveryBill
                                                      .value
                                                      .vnDeliveryOrder?[index]
                                                      .id;
                                              AppSnackBar.showIsEmpty(
                                                  message:
                                                      "Khách đến lấy, không cần gán shipper");
                                              final result = await Get.dialog(
                                                  CustomDialog(
                                                      title:
                                                          "Xác nhận thay đổi trạng thái vận đơn ?",
                                                      onTapYes: () {
                                                        controllerBol
                                                            .changeDeliveringDetail();
                                                        Get.back(result: true);
                                                      },
                                                      onTapNo: () =>
                                                          Get.back()));
                                              if (result == true) {
                                                Future.delayed(
                                                    const Duration(
                                                        milliseconds: 1000),
                                                    () {
                                                  controller
                                                      .getDetailDelivery();
                                                });
                                              }
                                            } else {
                                              AppSnackBar.showIsEmpty(
                                                  message:
                                                      "Vui lòng gán shipper");
                                            }
                                          } else {
                                            controllerBol.idDeliOrder =
                                                controller.deliveryBill.value
                                                    .vnDeliveryOrder?[index].id;
                                            final result = await Get.dialog(
                                                CustomDialog(
                                                    title:
                                                        "Xác nhận thay đổi trạng thái vận đơn?",
                                                    onTapYes: () {
                                                      controllerBol
                                                          .changeDeliveringDetail();
                                                      Get.back(result: true);
                                                    },
                                                    onTapNo: () => Get.back()));
                                            if (result == true) {
                                              Future.delayed(
                                                  const Duration(
                                                      milliseconds: 1000), () {
                                                controller.getDetailDelivery();
                                              });
                                            }
                                          }
                                        },
                                        backgroundColor: ColorApp.blue002,
                                        foregroundColor: Colors.white,
                                        icon: Icons.local_shipping_outlined,
                                      )
                                    : SlidableAction(
                                        onPressed: (context) async {
                                          controllerBol.idDeliOrder = controller
                                              .deliveryBill
                                              .value
                                              .vnDeliveryOrder?[index]
                                              .id;
                                          final result = await Get.dialog(
                                              CustomDialog(
                                                  title:
                                                      "Xác nhận thay đổi trạng thái vận đơn?",
                                                  onTapYes: () {
                                                    controllerBol
                                                        .changeCancelDetail();
                                                    Get.back(result: true);
                                                  },
                                                  onTapNo: () => Get.back()));
                                          if (result == true) {
                                            Future.delayed(
                                                const Duration(
                                                    milliseconds: 1000), () {
                                              controller.getDetailDelivery();
                                            });
                                          }
                                        },
                                        backgroundColor: ColorApp.redE7,
                                        foregroundColor: Colors.white,
                                        icon: Icons.location_off_outlined,
                                      ),
                                controller.deliveryBill.value
                                            .vnDeliveryOrder?[index].status ==
                                        0
                                    ? SlidableAction(
                                        onPressed: (context) async {
                                          Get.find<BillOfLadingController>()
                                              .deleteBillOfLading(
                                                  id: controller
                                                          .deliveryBill
                                                          .value
                                                          .vnDeliveryOrder?[
                                                              index]
                                                          .id ??
                                                      0);
                                          await Future.delayed(
                                              const Duration(
                                                  milliseconds: 1200), () {
                                            controller.getDetailDelivery();
                                          });
                                        },
                                        backgroundColor: Colors.orange,
                                        foregroundColor: Colors.white,
                                        icon: Icons.close,
                                      )
                                    : const SizedBox(),
                              ],
                            ),
                            child: Row(
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: AppColors.neutralDivider),
                                        borderRadius:
                                            BorderRadius.circular(4.r)),
                                    padding: EdgeInsets.all(4.w),
                                    width: 100,
                                    height: 93,
                                    child: CachedNetworkImage(
                                      imageUrl: controller
                                              .deliveryBill
                                              .value
                                              .vnDeliveryOrder?[index]
                                              .vnDeliveryUnit
                                              ?.logoUrl ??
                                          'https://dashboard.dp-cargo.com/themes/dpcargo/logo-dark.png',
                                      fit: BoxFit.contain,
                                    )),
                                Gap(10.w),
                                SizedBox(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ChipStatus(
                                        color: controller
                                            .buildColorBol(
                                                status: controller
                                                        .deliveryBill
                                                        .value
                                                        .vnDeliveryOrder?[index]
                                                        .status ??
                                                    100)
                                            .withOpacity(0.4),
                                        label: controller.buildTextBol(
                                            status: controller
                                                    .deliveryBill
                                                    .value
                                                    .vnDeliveryOrder?[index]
                                                    .status ??
                                                100),
                                        width: null,
                                        textColor: controller.buildColorBol(
                                            status: controller
                                                    .deliveryBill
                                                    .value
                                                    .vnDeliveryOrder?[index]
                                                    .status ??
                                                100),
                                      ),
                                      Text(
                                        "${controller.deliveryBill.value.vnDeliveryOrder?[index].code} (${controller.deliveryBill.value.vnDeliveryOrder?[index].quantity})",
                                        style: Theme.of(context).BodyText2Bold,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        controller
                                                .deliveryBill
                                                .value
                                                .vnDeliveryOrder?[index]
                                                .vnDeliveryUnit
                                                ?.name ??
                                            "",
                                        style: Theme.of(context)
                                            .BodyText1
                                            .copyWith(
                                                color: AppColors.neutral06),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      count: controller
                              .deliveryBill.value.vnDeliveryOrder?.length ??
                          0,
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          height: 16,
                          child: Divider(
                            thickness: 1,
                          ),
                        );
                      },
                    ));
              })
            : Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Center(
                  child: Text(
                    'Không có dữ liệu',
                    style: Theme.of(context)
                        .BodyText1
                        .copyWith(color: AppColors.neutrals08),
                  ),
                ),
              ),
        Gap(8.h),
      ],
    );
  }

  Widget buildListTrackingEndDraw() {
    return controller.listTrackingCustomerDetail.isEmpty
        ? Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Danh sách trống"),
              Gap(10.h),
              ElevatedButton(
                onPressed: () {
                  controller.getListTrackingCustomerDetail();
                },
                child: const Text('Tải lại dữ liệu'),
              ),
            ],
          ))
        : ListView.separated(
            itemCount: controller.listTrackingCustomerDetail.length,
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return Obx(() {
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          width: 1,
                          color: controller.checkItem[index]
                              ? primaryColor
                              : Colors.white),
                      borderRadius: const BorderRadius.all(Radius.circular(8))),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Obx(() {
                            return SizedBox(
                              height: 40,
                              width: 24,
                              child: Checkbox(
                                value: controller.checkItem[index],
                                activeColor: ColorApp.redB6,
                                onChanged: (bool? value) {
                                  controller.checkItem[index] = value!;
                                  controller.checkItem.removeAt(index);
                                  controller.checkItem.insert(index, value);
                                },
                              ),
                            );
                          }),
                          Gap(5.w),
                          Expanded(
                            child: Text(
                              controller.listTrackingCustomerDetail[index].code
                                  .toString(),
                              overflow: TextOverflow.ellipsis,
                              style:
                                  const TextStyle(fontWeight: FontWeight.w700),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Cân nặng",
                            style: TextStyle(
                                color: Color(0xff777e90), fontSize: 16),
                          ),
                          Text(
                              controller.listTrackingCustomerDetail[index]
                                  .formattedTrackingCalculationWeight,
                              style: const TextStyle(
                                  color: Color(0xff23262F), fontSize: 16))
                        ],
                      )
                    ],
                  ),
                );
              });
            },
            separatorBuilder: (BuildContext context, int index) => Gap(16.h),
          );
  }

  Widget buildAssignShipper() {
    return CustomDialogShipper(
      title: "Gán shipper cho PXK",
      onTapYes: () {
        controller.assignShipper();
      },
      onTapNo: () => Get.back(),
      widget: TypeAheadField<Staff>(
        controller: controllerStaff.shipper,
        suggestionsCallback: (pattern) {
          return controllerStaff.listShipper
              .where((Staff item) => item.fullname
                  .toString()
                  .toLowerCase()
                  .contains(pattern.toLowerCase()))
              .toList();
        },
        builder: (context, controllers, focusNode) {
          return AppTextInputField(
            label: "Người vận chuyển",
            showLabel: true,
            controller: controllers,
            focusNode: focusNode,
            hint: "Shipper",
          );
        },
        itemBuilder: (context, suggestion) {
          return ListTile(title: Text(suggestion.fullname ?? ''));
        },
        onSelected: (suggestion) {
          controllerStaff.shipper.text = suggestion.fullname.toString();
          controller.idShipper = suggestion.id;
        },
        loadingBuilder: (context) => const Text('Loading...'),
        errorBuilder: (context, error) => const Text('Error!'),
        emptyBuilder: (context) => Container(
            padding: const EdgeInsets.all(10),
            child: const Text('Không có dữ liệu phù hợp')),
      ),
    );
  }

  Widget buildAssignShipperDetail() {
    return CustomDialogShipper(
      title: "Gán shipper cho PXK",
      onTapYes: () {
        bool isValid = controllerStaff.listShipper.any((item) =>
            item.fullname?.toLowerCase() ==
            controllerStaff.shipper.text.toLowerCase());
        if (controllerStaff.shipper.text.isEmpty) {
          AppSnackBar.showIsEmpty(message: "Hãy chọn shipper");
        } else if (!isValid) {
          AppSnackBar.showIsEmpty(message: "Tên shipper không tồn tại");
          controllerStaff.shipper.clear();
        } else {
          for (int i = 0; i < controllerStaff.listShipper.length; i++) {
            var item = controllerStaff.listShipper[i];
            if (item.fullname?.toLowerCase() ==
                controllerStaff.shipper.text.toLowerCase()) {
              controllerBol.idShipper = item.id;
              break;
            }
          }
          controllerBol.updateBolShipper();
          Get.back(result: true);
        }
      },
      onTapNo: () => Get.back(),
      widget: TypeAheadField<Staff>(
        controller: controllerStaff.shipper,
        suggestionsCallback: (pattern) {
          return controllerStaff.listShipper
              .where((Staff item) => item.fullname
                  .toString()
                  .toLowerCase()
                  .contains(pattern.toLowerCase()))
              .toList();
        },
        builder: (context, controllers, focusNode) {
          return AppTextInputField(
            label: "Người vận chuyển",
            showLabel: true,
            controller: controllers,
            focusNode: focusNode,
            hint: "Shipper",
          );
        },
        itemBuilder: (context, suggestion) {
          return ListTile(title: Text(suggestion.fullname ?? ''));
        },
        onSelected: (suggestion) {
          controllerStaff.shipper.text = suggestion.fullname.toString();
          controllerBol.idShipper = suggestion.id;
        },
        loadingBuilder: (context) => const Text('Loading...'),
        errorBuilder: (context, error) => const Text('Error!'),
        emptyBuilder: (context) => Container(
            padding: const EdgeInsets.all(10),
            child: const Text('Không có dữ liệu phù hợp')),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Column(
          children: [
            AppBarWidget(
              title: "Xem phiếu",
              onBack: () => Get.back(),
            ),
            Gap(8.h),
            Expanded(child: Obx(() {
              if (controller.isLoading.value == false &&
                  controller.deliveryBill.value.id == null) {
                return SkeletonizerLoading(
                  loading: controller.isLoading.value,
                );
              }
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Gap(8.h),
                    buildBanner(),
                    Gap(8.h),
                    buildInforDelivery(context),
                    Gap(8.h),
                    controller.deliveryStatus.toString() ==
                            DeliveryStatus.warehouse.value.toString()
                        ? buildInforCustom()
                        : Container(),
                    controller.deliveryStatus.toString() ==
                                DeliveryStatus.newDeliveryBill.value
                                    .toString() ||
                            controller.deliveryStatus.toString() ==
                                DeliveryStatus.warehouse.value.toString() ||
                            controller.deliveryStatus.toString() ==
                                DeliveryStatus.delivering.value.toString() ||
                            controller.deliveryStatus.toString() ==
                                DeliveryStatus.packing.value ||
                            controller.deliveryStatus.toString() ==
                                DeliveryStatus.saleApproved.value.toString() ||
                            controller.deliveryStatus.toString() ==
                                DeliveryStatus.cancelled.value.toString() ||
                            controller.deliveryStatus.toString() ==
                                DeliveryStatus.accountantApproved.value
                                    .toString()
                        ? Obx(() {
                            return buildListTracking(context);
                          })
                        : Container(),
                    controller.deliveryStatus.toString() ==
                                DeliveryStatus.packing.value.toString() ||
                            controller.deliveryStatus.toString() ==
                                DeliveryStatus.delivering.value.toString() ||
                            controller.deliveryStatus.toString() ==
                                DeliveryStatus.completed.value.toString() ||
                            controller.deliveryStatus.toString() ==
                                DeliveryStatus.uncompleted.value.toString()
                        ? buildBillOfLading(context)
                        : Container(),
                    controller.deliveryStatus.toString() ==
                                DeliveryStatus.newDeliveryBill.value
                                    .toString() ||
                            controller.deliveryStatus.toString() ==
                                DeliveryStatus.packing.value.toString() ||
                            controller.deliveryStatus.toString() ==
                                DeliveryStatus.delivering.value.toString() ||
                            controller.deliveryStatus.toString() ==
                                DeliveryStatus.completed.value.toString() ||
                            controller.deliveryStatus.toString() ==
                                DeliveryStatus.uncompleted.value.toString()
                        ? buildExpense()
                        : Container(),
                    Gap(8.h),
                  ],
                ),
              );
            })),
            Obx(() {
              return buildFooter(
                  status: controller
                          .deliveryBill.value.deliveryBillStatus?.value
                          .toString() ??
                      S.current.isNull);
            }),
            Gap(8.h)
          ],
        ),
      ),
      endDrawer: Drawer(
        width: context.width * 0.9,
        child: Container(
          padding: EdgeInsets.zero,
          height: context.height,
          child: Column(
            children: [
              const SizedBox(
                height: 150,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: primaryColor,
                  ),
                  child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'Danh sách Tracking',
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
                child: Obx(() {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: buildListTrackingEndDraw(),
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: ButtonWidget(
                                  buttonText: "Thoát",
                                  borderColor: primaryColor,
                                  textColor: primaryColor,
                                  onTap: () {
                                    Get.back();
                                  },
                                ),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Expanded(
                                child: ButtonWidget(
                                  buttonText: "Thêm tracking",
                                  bgcolor: primaryColor,
                                  textColor: ColorApp.whiteFA,
                                  onTap: () {
                                    controller.onCheckValueListTracking();
                                    Get.back(result: true);
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          )
                        ],
                      ),
                    ],
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
