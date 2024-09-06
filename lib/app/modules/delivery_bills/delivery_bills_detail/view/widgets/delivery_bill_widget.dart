import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import '../../../../../../gen/assets.gen.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../core/enum/boxes_status.dart';
import '../../../../../core/values/app_colors.dart';
import '../../../../../core/values/app_text_styles.dart';
import '../../../../../core/widget/elevate_button.dart';
import '../../../../../data/model/model/delivery_bill.dart';
import '../../../../../data/service/common_service.dart';
import '../../../../../take_photo/take_photo_screen.dart';
import '../../../../barcode/ui/barcode_receive_pxk_screen.dart';
import '../../../../barcode/ui/barcode_success_pxk_screen.dart';
import 'infoDeliveryBillWidget.dart';

class DeliveryBillWidget extends StatelessWidget {
  final DeliveryBill deliveryBill;
  final VoidCallback onTap;
  final bool action;
  final CommonApi commonApi = CommonApi();

  DeliveryBillWidget(
      {super.key,
      required this.onTap,
      required this.deliveryBill,
      required this.action});

  Future<void> customDialog(BuildContext context) async {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Text(
                'Phiếu đang không có mã để trả hàng Vui lòng nhận đo trước khi trả hàng',
                style: GoogleFonts.roboto(
                  color: AppColors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              actions: [
                SizedBox(
                  height: 30,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Expanded(
                          child: RedButton(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        text: 'Thoát',
                        style: const TextStyle(color: AppColors.primary),
                        color: Colors.white,
                        border: Border.all(color: AppColors.primary, width: 1),
                      )),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                          child: RedButton(
                        // onTap: () {
                        //   Get.to(const BarcodeReceivePxkScreen(),
                        //       arguments: {'id': deliveryBill.id});
                        // },
                        text: 'Nhận đơn',
                      )),
                    ],
                  ),
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  // ChipStatus(
                  //   color: deliveryBill.deliveryBillStatus?.color ??
                  //       AppColors.aZShopPrimary,
                  //   label: deliveryBill.deliveryBillStatus?.value ??
                  //       S.current.isNull,
                  //   width: null,
                  // ),
                  // Gap(4.w),
                  InfoDeliveryBillWidget(
                    label: deliveryBill.code ?? S.current.isNull,
                    data: '',
                    icon: Assets.icons.icCode.svg(),
                    isCode: true,
                  ),
                  InfoDeliveryBillWidget(
                    label: "Khách hàng",
                    data: deliveryBill.name ?? S.current.isNull,
                    icon: Assets.icons.icCustomer2.svg(),
                  ),
                  InfoDeliveryBillWidget(
                    label: "Địa chỉ",
                    data: deliveryBill.customerAddress ?? S.current.isNull,
                    icon: Assets.icons.icAddress.svg(),
                    isAddress: true,
                  ),
                  if (deliveryBill.vnDeliveryOrder!.isNotEmpty)
                    Column(
                      children: [
                        Gap(16.h),
                        Container(
                          decoration: const BoxDecoration(
                              border: Border(
                                  top: BorderSide(color: AppColors.neutral06))),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 6.0),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Assets.icons.icList.svg(),
                                    Gap(10.w),
                                    const Text(
                                      "Danh sách mã vận đơn",
                                      textAlign: TextAlign.center,
                                    )
                                  ],
                                ),
                                Gap(4.h),
                                Column(
                                  children: deliveryBill.vnDeliveryOrder
                                          ?.map((vnDeliveryOrder) =>
                                              InfoDeliveryBillWidget(
                                                label: vnDeliveryOrder.code ??
                                                    S.current.isNull,
                                                data:
                                                    '${vnDeliveryOrder.quantity} box',
                                                isCode: true,
                                              ))
                                          .toList() ??
                                      [],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
            if (deliveryBill.deliveryBillStatus?.value == 'Đã đóng hàng')
              Row(
                children: [
                  _ActionWidget(
                    color: AppColors.primary,
                    nameAction: "Nhận hàng",
                    icon: Assets.icons.icActionReturn.svg(),
                    onTap: () {
                      final isCheck = deliveryBill.vnDeliveryBoxes
                          ?.where((element) =>
                              element.status == BoxesStatus.newCode)
                          .toList();
                      isCheck!.isNotEmpty
                          ? Get.to(const BarcodeReceivePxkScreen(),
                              arguments: {'id': deliveryBill.id})
                          : customDialog(context);
                    },
                  ),
                ],
              ),
            if (deliveryBill.deliveryBillStatus?.value == 'Đang giao hàng')
              Row(
                children: [
                  _ActionWidget(
                    color: AppColors.primary,
                    nameAction: "Trả hàng",
                    icon: Assets.icons.returns.svg(),
                    onTap: () {
                      final isCheck = deliveryBill.vnDeliveryBoxes
                          ?.where((element) =>
                              element.status == BoxesStatus.delivering)
                          .toList();
                      isCheck!.isNotEmpty
                          ? Get.to(const BarcodeSuccessPxkScreen(),
                              arguments: {'id': deliveryBill.id})
                          : customDialog(context);
                    },
                  ),
                  _ActionWidget(
                      color: AppColors.blueAction,
                      nameAction: "Gọi điện",
                      icon: Assets.icons.icActionPhone.svg(),
                      onTap: () async {
                        await CommonApi.phone(
                            deliveryBill.customerPhone.toString());
                      }),
                ],
              ),

            if (deliveryBill.deliveryBillStatus?.value == 'Hoàn thành đơn hàng' && deliveryBill.shipperNote.toString() == "null")
              Row(
                children: [
                  _ActionWidget(
                    color: AppColors.primary,
                    nameAction: "Thêm ghi chú, ảnh",
                    icon: Assets.icons.icMemoPencil.svg(),
                    onTap: () {
                      Get.to(const TakePhotoScreen(),
                          arguments: {'id': deliveryBill.id});
                    },
                  ),
                ],
              ),

          ],
        ),
      ),
    );
  }
}

class _ActionWidget extends StatelessWidget {
  final Color color;
  final String nameAction;
  final SvgPicture icon;
  final VoidCallback onTap;
  const _ActionWidget(
      {required this.color,
      required this.nameAction,
      required this.icon,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 48,
          color: color,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              Gap(8.w),
              Text(
                nameAction,
                style: Theme.of(context)
                    .BodyText2Bold
                    .copyWith(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
