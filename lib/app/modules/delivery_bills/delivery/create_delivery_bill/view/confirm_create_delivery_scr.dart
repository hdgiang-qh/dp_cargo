import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:vncss/app/modules/common_widget/button_widget.dart';
import 'package:vncss/app/modules/common_widget/const.dart';
import 'package:vncss/app/modules/common_widget/item_small.dart';
import 'package:vncss/app/modules/common_widget/textfield_widget.dart';
import 'package:vncss/app/modules/delivery_bills/delivery/create_delivery_bill/controller/confirm_create_controller.dart';
import 'package:vncss/app/modules/delivery_bills/delivery/create_delivery_bill/controller/create_delivery_bill_controller.dart';
import 'package:vncss/app/modules/delivery_bills/delivery/widget/skeletonizer_loading.dart';
import 'package:vncss/app/routes/app_pages.dart';

import '../../../../../../generated/l10n.dart';
import '../../../../../core/base/base_view.dart';
import '../../../../../data/model/model/create_bill_custom_model.dart';
import '../../../../common_widget/app_bar_widget.dart';
import '../../../../common_widget/item_detail_list_widget.dart';
import '../../../../common_widget/title_detail_list.dart';

class ConfirmCreateDeliveryScr extends BaseView<ConfirmCreateController> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void openDrawer() {
    _scaffoldKey.currentState?.openEndDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: SafeArea(
          child: Column(
            children: [
              AppBarWidget(
                title: "Xác nhận phiếu",
                onBack: () => Get.back(),
              ),
              const SizedBox(
                height: 8,
              ),
              Expanded(child: Obx(() {
                if (controller.isLoading.value == false &&
                    controller.customers.value.id == null) {
                  return SkeletonizerLoading(
                    loading: controller.isLoading.value,
                  );
                }
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      buildCustom(),
                      Gap(8.h),
                      buildReceiver(),
                      Gap(8.h),
                      buildTracking(),
                      buildExpense(),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                );
              })),
              const SizedBox(
                height: 8,
              ),
              Obx(() {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: ButtonWidget(
                          buttonText: "Thêm Tracking",
                          borderColor: controller.listShowItem.isNotEmpty
                              ? primaryColor
                              : ColorApp.greyA9,
                          bgcolor: controller.listShowItem.isNotEmpty
                              ? null
                              : ColorApp.greyA9,
                          textColor: controller.listShowItem.isNotEmpty
                              ? primaryColor
                              : ColorApp.greyF2,
                          onTap: () {
                            controller.listShowItem.isNotEmpty
                                ? openDrawer()
                                : null;
                          },
                        ),
                      ),
                      Gap(16.h),
                      Expanded(
                        child: ButtonWidget(
                          buttonText: "Tạo phiếu",
                          bgcolor: primaryColor,
                          borderColor: primaryColor,
                          textColor: ColorApp.whiteFA,
                          onTap: () async {
                            controller.onConfirmCreate();
                          },
                        ),
                      ),
                    ],
                  ),
                );
              }),
              const SizedBox(
                height: 8,
              ),
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
                          child: buildListTracking(),
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
                                      controller.addSelectedItems();
                                      Get.back();
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
        ));
  }

  Widget buildCustom() {
    return Obx(() {
      return Column(
        children: [
          const TitleDetailList(
            svgPath: "assets/image/delivery_bill.svg",
            headText: "Thông tin phiếu khách hàng",
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            color: Colors.white,
            child: Column(
              children: [
                ItemDetailListWidget(
                  head: "Họ và tên khách hàng:",
                  endText: controller.customers.value.name ?? S.current.isNull,
                  fontWeight: true,
                ),
                ItemDetailListWidget(
                  head: "Giới tính",
                  endText: controller.checkGender(
                      controller.customers.value.gender.toString()),
                  fontWeight: true,
                ),
                ItemDetailListWidget(
                  head: "Điện thoại:",
                  endText: controller.customers.value.phone.toString(),
                  fontWeight: true,
                ),
                ItemDetailListWidget(
                  head: "Số dư:",
                  fontWeight: true,
                  endText: controller.customers.value.formattedBalance,
                ),
                ItemDetailListWidget(
                  head: "Tiền tạm tính:",
                  fontWeight: true,
                  endText: controller.customers.value.formattedMoneyTemporary,
                ),
                ItemDetailListWidget(
                  head: "Công nợ tối đa:",
                  fontWeight: true,
                  endText: controller.customers.value.formattedCreditAmount,
                ),
                ItemDetailListWidget(
                  head: "Địa chỉ:",
                  fontWeight: true,
                  align: true,
                  endText:
                      controller.customers.value.address ?? S.current.isNull,
                ),
              ],
            ),
          ),
        ],
      );
    });
  }

  Widget buildReceiver() {
    return Column(
      children: [
        const TitleDetailList(
          svgPath: "assets/image/box2.svg",
          headText: "Thông tin nhận hàng",
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          color: Colors.white,
          child: Column(
            children: [
              AppTextInputField(
                showLabel: true,
                label: "Tên khách hàng",
                hint: "Nhập tên khác hàng",
                controller: controller.name,
                error: controller.errorName.value,
                textInputType: TextInputType.name,
              ),
              AppTextInputField(
                showLabel: true,
                label: "Số điện thoại",
                hint: "Nhập số điện thoại",
                controller: controller.phone,
                textInputType: TextInputType.number,
                error: controller.errorPhone.value,
              ),
              AppTextInputField(
                showLabel: true,
                label: "Email",
                hint: "Nhập email",
                controller: controller.email,
                textInputType: TextInputType.emailAddress,
                error: controller.errorEmail.value,
              ),
              AppTextInputField(
                showLabel: true,
                label: "Địa chỉ",
                hint: "Nhập địa chỉ",
                controller: controller.address,
                error: controller.errorAddress.value,
                textInputType: TextInputType.text,
              ),
              AppTextInputField(
                showLabel: true,
                label: "Ghi chú",
                hint: "Nhập ghi chú",
                controller: controller.note,
                textInputType: TextInputType.emailAddress,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildTracking() {
    return Obx(() {
      return Column(
        children: [
          const TitleDetailList(
            svgPath: "assets/image/list1.svg",
            headText: "Danh sách tracking",
          ),
          controller.listShowItem.isEmpty
              ? Container(
                  color: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Chưa có Tracking",
                        style: TextStyle(),
                      ),
                      ButtonWidget(
                        buttonText: "Chọn Tracking",
                        width: 134,
                        borderColor: primaryColor,
                        textColor: primaryColor,
                        onTap: () {
                          openDrawer();
                        },
                      )
                    ],
                  ),
                )
              : Obx(() {
                  return ListView.separated(
                    itemCount: controller.listShowItem.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 16),
                            decoration:
                                const BoxDecoration(color: Colors.white),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ItemTracking(
                                  svgPath: "assets/image/note_search.svg",
                                  title: controller.listShowItem[index].code
                                      .toString(),
                                  codeTracking: true,
                                ),
                                Gap(10.h),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ItemSmall(
                                        svgPath: "assets/image/scale.svg",
                                        value: controller.listShowItem[index]
                                            .formattedTrackingCalculationWeight
                                            .toString()),
                                    ItemSmall(
                                        svgPath: "assets/image/coin.svg",
                                        value: controller.listShowItem[index]
                                            .formattedTrackingTotalMoney),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) => const Divider(
                      height: 1,
                    ),
                  );
                }),
          const SizedBox(
            height: 20,
          ),
        ],
      );
    });
  }

  Widget buildListTracking() {
    return ListView.separated(
      itemCount: controller.listTrackingCustomerDetail.length,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        String titleTrackings = controller
                    .listTrackingCustomerDetail[index].code!.length >
                30
            ? '...${controller.listTrackingCustomerDetail[index].code?.substring(controller.listTrackingCustomerDetail[index].code!.length - 30)}'
            : controller.listTrackingCustomerDetail[index].code.toString();
        return Obx(() {
          return GestureDetector(
            onTap: () async {
              final result = await Get.toNamed(
                  Routes.EDIT_TRACKING_DELIVERY_BILLS,
                  arguments: {
                    "id": controller.listTrackingCustomerDetail[index].id,
                    'indexUpdate': 0
                  });
              if (result == true) {
                Future.delayed(const Duration(milliseconds: 500), () {
                  controller.onRefreshPage();
                  controller.listShowItem.clear();
                });
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
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
                          titleTrackings,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.w700),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Cân nặng",
                        style:
                            TextStyle(color: Color(0xff777e90), fontSize: 16),
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
            ),
          );
        });
      },
      separatorBuilder: (BuildContext context, int index) => Gap(16.h),
    );
  }

  Widget buildExpense() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset("assets/image/coins.svg"),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "Chi phí",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                  )
                ],
              ),
            ],
          ),
        ),
        Gap(8.h),
        Obx(() {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: const BoxDecoration(color: Colors.white),
            child: Column(
              children: [
                ItemExpense(
                  title: "(1) Giảm giá",
                  value: controller.totalDiscount.value == null
                      ? "0đ"
                      : Const.convertPrice(
                          controller.totalDiscount.value.toString()),
                ),
                ItemExpense(
                  title: "(2) Phụ thu",
                  value: controller.totalSurcharge.value == null
                      ? "0đ"
                      : Const.convertPrice(
                          controller.totalSurcharge.value.toString()),
                ),
                ItemExpense(
                  title: "(3) Phí khác",
                  value: controller.totalOtherFee.value == null
                      ? "0đ"
                      : Const.convertPrice(
                          controller.totalOtherFee.value.toString()),
                ),
                ItemExpense(
                  title: "Tổng số tiền:",
                  fontW: true,
                  value: controller.totalM.value == null
                      ? "0đ"
                      : Const.convertPrice(controller.totalM.value.toString()),
                ),
              ],
            ),
          );
        })
      ],
    );
  }
}

class ItemTracking extends StatelessWidget {
  final String svgPath;
  final String title;
  final bool codeTracking;

  const ItemTracking(
      {super.key,
      required this.svgPath,
      required this.title,
      this.codeTracking = false});

  @override
  Widget build(BuildContext context) {
    String displayEndText =
        title.length > 30 ? '...${title.substring(title.length - 30)}' : title;
    return Row(
      children: [
        SvgPicture.asset(svgPath),
        Gap(10.w),
        Text(
          displayEndText,
          style: TextStyle(
              fontWeight: codeTracking ? FontWeight.w700 : FontWeight.w400,
              fontSize: 16),
        )
      ],
    );
  }
}

class ItemExpense extends StatelessWidget {
  final String title;
  final String value;
  final bool fontW;

  const ItemExpense({
    super.key,
    required this.title,
    required this.value,
    this.fontW = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
                fontWeight: fontW ? FontWeight.w700 : FontWeight.w400,
                fontSize: 16,
                color:
                    fontW ? const Color(0xff23262f) : const Color(0xff777e90)),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }
}
