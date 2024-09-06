import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:vncss/app/core/enum/transaction_status.dart';
import 'package:vncss/app/data/model/model/transaction.dart';
import 'package:vncss/app/modules/common_widget/button_widget.dart';
import 'package:vncss/app/modules/common_widget/const.dart';
import 'package:vncss/app/modules/common_widget/dialog_widget.dart';
import 'package:vncss/app/modules/delivery_bills/delivery/widget/skeletonizer_loading.dart';

import '../../../../generated/l10n.dart';
import '../../../core/base/base_view.dart';
import '../../common_widget/app_bar_widget.dart';
import '../../common_widget/item_detail_list_widget.dart';
import '../../common_widget/item_list_widget.dart';
import '../../common_widget/title_detail_list.dart';
import '../controller/detail_transaction_controller.dart';

class DetailTransactions extends BaseView<DetailTransactionController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppBarWidget(
              title: "Chi tiết giao dịch",
              onBack: () {
                Get.back();
              },
            ),
            Expanded(
                child: FutureBuilder<Transactions>(
                    future: controller.getDetail(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return SkeletonizerLoading(
                          loading: controller.isLoading.value,
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                            child: Text('Error: ${snapshot.error}'));
                      } else if (!snapshot.hasData) {
                        return const Center(
                            child: Text('No transaction found'));
                      } else {
                        return SingleChildScrollView(
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  const TitleDetailList(
                                    headText: "Thông tin khách hàng",
                                    svgPath: "assets/image/person.svg",
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16),
                                    decoration:
                                    const BoxDecoration(color: Colors.white),
                                    child: Column(
                                      children: [
                                        ItemDetailListWidget(
                                            head: "Khách hàng:",
                                            fontWeight: true,
                                            endText: controller
                                                .detailTransaction.value
                                                .customer?[0]?.name
                                                .toString() ??
                                                S.current.isNull),
                                        ItemDetailListWidget(
                                            head: 'Tài khoản ngân hàng:',
                                            align: true,
                                            fontWeight: true,
                                            endText: controller
                                                .detailTransaction.value
                                                .formattedBankAccount),
                                        ItemDetailListWidget(
                                            head: "SĐT:",
                                            fontWeight: true,
                                            endText: controller
                                                .detailTransaction.value
                                                .customer?[0]?.phone
                                                .toString() ??
                                                S.current.isNull),
                                        ItemDetailListWidget(
                                            head: "Email",
                                            fontWeight: true,
                                            endText: controller
                                                .detailTransaction.value
                                                .customer?[0]?.email
                                                .toString() ??
                                                S.current.isNull),
                                        ItemDetailListWidget(
                                            head: "Địa chỉ:",
                                            fontWeight: true,
                                            align: true,
                                            endText: controller
                                                .detailTransaction.value
                                                .customer?[0]?.address
                                                .toString() ??
                                                S.current.isNull),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Gap(8.h),
                              Column(
                                children: [
                                  const TitleDetailList(
                                    headText: "Thông tin giao dịch",
                                    svgPath: "assets/image/delivery_bill.svg",
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    decoration:
                                    const BoxDecoration(color: Colors.white),
                                    child: Column(
                                      children: [
                                        ItemListWidget(
                                          headText: 'Trạng thái:',
                                          showChip: true,
                                          color: controller
                                              .detailTransaction.value.status
                                              ?.color
                                              .withOpacity(0.2),
                                          endText: controller.statusAction(
                                              values: controller
                                                  .detailTransaction.value
                                                  .status?.value
                                                  .toString() ??
                                                  S.current.isNull),
                                          colorText: controller
                                              .detailTransaction.value
                                              .status?.textColor,
                                        ),
                                        ItemDetailListWidget(
                                            head: "Mã giao dịch:",
                                            fontWeight: true,
                                            endText: controller
                                                .detailTransaction.value.id
                                                .toString()),
                                        ItemDetailListWidget(
                                          head: "Loại giao dịch:",
                                          endText: controller.detailTransaction
                                              .value
                                              .customerTransactionType?.value ??
                                              S.current.isNull,
                                          color: Colors.blue,
                                          fontWeight: true,
                                        ),
                                        ItemDetailListWidget(
                                          head: 'Số tiền giao dịch:',
                                          fontWeight: true,
                                          endText: controller.detailTransaction
                                              .value
                                              .formattedCustomerTransactionMoney,
                                        ),
                                        ItemDetailListWidget(
                                          head: 'Số dư sau GD:',
                                          fontWeight: true,
                                          endText: controller.detailTransaction
                                              .value
                                              .formattedCustomerTransactionBalance,
                                        ),
                                        ItemDetailListWidget(
                                            head: "Ngày tạo:",
                                            fontWeight: true,
                                            endText: controller
                                                .detailTransaction.value
                                                .formattedCreatedAt),
                                        ItemDetailListWidget(
                                            head: "Ngày cập nhật:",
                                            fontWeight: true,
                                            endText: controller
                                                .detailTransaction.value
                                                .formattedUpdateAt),
                                        ItemDetailListWidget(
                                            head: "Ghi chú:",
                                            fontWeight: true,
                                            endText: controller
                                                .detailTransaction.value
                                                .customerTransactionNote ??
                                                S.current.isNull),
                                        ItemDetailListWidget(
                                          head: 'Hình ảnh:',
                                          align: true,
                                          fontWeight: true,
                                          imageAvt: true,
                                          endText: controller
                                              .detailTransaction.value
                                              .formattedImage,
                                          onTap: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) =>
                                                  Dialog(
                                                    child: SizedBox(
                                                      height: 300,
                                                      child: PhotoView(
                                                        imageProvider: NetworkImage(
                                                            controller
                                                                .detailTransaction
                                                                .value
                                                                .formattedImage),
                                                      ),
                                                    ),
                                                  ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      }
                    })),
            Gap(8.h),
            Obx(() {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: ButtonWidget(
                        buttonText: "Quay lại",
                        borderColor: primaryColor,
                        textColor: primaryColor,
                        onTap: () {
                          Get.back();
                        },
                      ),
                    ),
                    controller.detailTransaction.value.status?.value
                        .toString() ==
                        ActionStatuses.pending.value
                        ? Gap(16.w)
                        : const SizedBox(),
                    controller.detailTransaction.value.status?.value
                        .toString() ==
                        ActionStatuses.pending.value
                        ? Expanded(
                      child: ButtonWidget(
                        buttonText: "Duyệt",
                        bgcolor: primaryColor,
                        textColor: ColorApp.whiteFA,
                        onTap: () {
                          Get.dialog(
                            CustomDialog(
                              title:
                              "Duyệt giao dịch với mã: ${controller.id}",
                              showContent: true,
                              widget: Column(
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Loại giao dịch: ${controller
                                        .detailTransaction.value
                                        .customerTransactionType?.value}",
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "Số tiền giao dịch: ${controller
                                        .detailTransaction.value
                                        .formattedCustomerTransactionMoney}",
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "Số dư: ${controller.detailTransaction.value
                                        .formattedCustomerTransactionBalance}",
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "Khách hàng: ${controller.detailTransaction
                                        .value.customer?[0]?.name}",
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              textYes: "Hoàn thành",
                              onTapYes: () async {
                                controller.completeTransaction();
                                Get.back();
                                Get.back(result: true);
                              },
                              textNo: "Hủy giao dịch",
                              onTapNo: () {
                                controller.cancelTransaction();
                                Get.back();
                                Get.back(result: true);
                              },
                            ),
                          );
                        },
                      ),
                    )
                        : const SizedBox(),
                  ],
                ),
              );
            }),
            Gap(8.h),
          ],
        ),
      ),
    );
  }
}
