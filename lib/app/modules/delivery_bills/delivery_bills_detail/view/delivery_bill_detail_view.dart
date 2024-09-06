import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../../../../core/enum/boxes_status.dart';
import '../../../../core/widget/elevate_button.dart';
import '../../../../take_photo/take_photo_screen.dart';
import '../../../barcode/ui/barcode_receive_pxk_screen.dart';
import '../../../barcode/ui/barcode_success_pxk_screen.dart';
import 'widgets/information_delivery_bill_detail.dart';
import '../../../../../generated/l10n.dart';
import '../../../../core/enum/delivery_bill_status.dart';
import '../../../../core/values/app_colors.dart';
import '../../../../core/values/app_text_styles.dart';
import '../../../../core/widget/appbar/custom_appbar.dart';
import '../../../../data/model/model/delivery_bill.dart';
import 'widgets/delivery_bill_detail_widget.dart';
import 'widgets/single_tile_widget.dart';
import 'widgets/title_tile.dart';
import '../../../../../gen/assets.gen.dart';
import '../controller/delivery_bill_detail_controller.dart';
import 'widgets/receiving_information_widget.dart';

class DeliveryBillDetailView extends StatefulWidget {
  const DeliveryBillDetailView({super.key});

  @override
  State<DeliveryBillDetailView> createState() => _DeliveryBillDetailViewState();
}

class _DeliveryBillDetailViewState extends State<DeliveryBillDetailView> {
  @override
  void initState() {
    onRefreshPage();
    super.initState();
  }

  final controllerDetail = Get.put(DeliveryBillDetailController());

  Future<void> onRefreshPage() async {
    await controllerDetail.getDeliveryBillDetail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarCustom(
        height: 0,
      ),
      body: Column(
        children: [
          Container(
            color: AppColors.colorWhite,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () => Get.back(),
                          child: Assets.icons.icArrowBack.svg(
                              height: 32,
                              colorFilter: const ColorFilter.mode(
                                  AppColors.primary, BlendMode.srcIn)),
                        ),
                        Gap(12.w),
                        Expanded(
                          child: Text('Phiếu Xuất Kho',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .TitleStyle
                                  .copyWith(color: AppColors.primary)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Obx(
                () => Expanded(
              child: RefreshIndicator(
                onRefresh: onRefreshPage,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Gap(8.h),
                      TitleTileOrder(
                          label: 'Thông tin phiếu xuất kho',
                          icon: Assets.icons.icPackage.svg()),
                      Gap(8.h),
                      DeliveryBillDetailWidget(
                          deliveryBill: controllerDetail.deliveryBill.value),
                      Column(
                        children: [
                          Gap(8.h),
                          TitleTileOrder(
                              label: 'Thông tin nhận hàng',
                              icon: Assets.icons.icPackage.svg()),
                          Gap(8.h),
                          ReceivingInformation(
                              deliveryBillDetail:
                              controllerDetail.deliveryBill.value),
                        ],
                      ),
                      Gap(8.h),
                      TitleTileOrder(
                          label:
                          'Danh sách mã vận đơn (${controllerDetail.deliveryBill.value.vnDeliveryBoxes?.length ?? '0'})',
                          icon: Assets.icons.icList.svg(
                              width: 20.w,
                              colorFilter: const ColorFilter.mode(
                                  AppColors.primary, BlendMode.srcIn))),
                      Gap(8.h),
                      controllerDetail.deliveryBill.value.vnDeliveryBoxes
                          ?.isNotEmpty ??
                          false
                          ? Container(
                        color: AppColors.colorWhite,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Column(
                            children: controllerDetail
                                .mergeDeliveries(
                                controllerDetail.deliveryBill.value
                                    .vnDeliveryOrder ??
                                    [],
                                controllerDetail.deliveryBill.value
                                    .vnDeliveryBoxes ??
                                    [])
                                .map((value) => SingleTileWidget(
                              vnDeliveryOrder:
                              value.vnDeliveryOrder,
                              vnDeliveryBoxes:
                              value.vnDeliveryBoxes,
                            ))
                                .toList()),
                      )
                          : Text(
                        'Không có dữ liệu',
                        style: Theme.of(context)
                            .BodyText1
                            .copyWith(color: AppColors.neutrals08),
                      ),
                      if (controllerDetail
                          .deliveryBill.value.shipperNote?.isNotEmpty ??
                          false ||
                              controllerDetail
                                  .deliveryBill.value.deliveredImageUrl !=
                                  null)
                        Column(
                          children: [
                            Gap(8.h),
                            TitleTileOrder(
                                label: 'Ghi chú của shipper',
                                icon: Assets.icons.icPackage.svg()),
                            Gap(8.h),
                            Container(
                              color: AppColors.colorWhite,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              child: Column(
                                children: [
                                  const InformationDeliveryBillDetail(
                                      label: 'Ghi chú', data: ''),
                                  Gap(8.h),
                                  Container(
                                    width: double.infinity,
                                    height: 100,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        border: Border.all(
                                            color: AppColors.neutralDivider)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 4),
                                      child: Text(
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: null,
                                        controllerDetail.deliveryBill.value
                                            .shipperNote ??
                                            S.current.isNull,
                                        style: Theme.of(context)
                                            .BodyText1
                                            .copyWith(
                                            color: AppColors.neutrals08),
                                      ),
                                    ),
                                  ),
                                  Gap(16.h),
                                  controllerDetail.deliveryBill.value
                                      .deliveredImageUrl?.isNotEmpty ??
                                      false
                                      ? Image.network(
                                      width: double.infinity,
                                      height: 280,
                                      fit: BoxFit.cover,
                                      controllerDetail.deliveryBill.value
                                          .deliveredImageUrl ??
                                          'https://dashboard.dp-cargo.com/themes/dpcargo/logo-dark.png')
                                      : Container()
                                ],
                              ),
                            )
                          ],
                        )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Obx(() {
            final isCheckStatusDeliveryBill =
                controllerDetail.deliveryBill.value.deliveryBillStatus;
            final isCheckBoxNewCode = controllerDetail
                .deliveryBill.value.vnDeliveryBoxes
                ?.any((status) => status.status == BoxesStatus.newCode);
            final isCheckBoxDelivering = controllerDetail
                .deliveryBill.value.vnDeliveryBoxes
                ?.any((status) => status.status == BoxesStatus.delivering);
            final isShipNote = controllerDetail.deliveryBill.value.shipperNote.toString() == "null" && controllerDetail.deliveryBill.value.deliveredImageUrl.toString() == "null";

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14),
              child: Column(children: [
                Row(
                  children: [
                    if (isCheckStatusDeliveryBill ==
                        DeliveryStatus.delivering &&
                        isCheckBoxNewCode!)
                      Expanded(
                        child: RedButton(
                          text: 'Nhận thêm hàng',
                          color: Colors.white,
                          border:
                          Border.all(color: AppColors.primary, width: 1),
                          style: const TextStyle(color: AppColors.primary),
                          onTap: () {
                            final deliveryBill = DeliveryBill();
                            Get.to(const BarcodeReceivePxkScreen(),
                                arguments: {'id': deliveryBill.id});
                          },
                        ),
                      ),
                    if (isCheckStatusDeliveryBill != DeliveryStatus.completed)
                      Gap(8.w),
                    if (isCheckStatusDeliveryBill == DeliveryStatus.packing)
                      Expanded(
                        child: RedButton(
                          text: 'Nhận hàng',
                          color: Colors.white,
                          border:
                          Border.all(color: AppColors.primary, width: 1),
                          style: const TextStyle(color: AppColors.primary),
                          onTap: () {
                            final deliveryBill = DeliveryBill();
                            Get.to(const BarcodeReceivePxkScreen(),
                                arguments: {'id': deliveryBill.id});
                          },
                        ),
                      ),
                    if (isCheckStatusDeliveryBill ==
                        DeliveryStatus.delivering &&
                        isCheckBoxDelivering!)
                      Expanded(
                          child: RedButton(
                        text: 'Trả hàng',
                        onTap: () {
                          final deliveryBill = DeliveryBill();
                          Get.to(const BarcodeSuccessPxkScreen(),
                              arguments: {'id': deliveryBill.id});
                        },
                      )),
                    if (isCheckStatusDeliveryBill == DeliveryStatus.completed && isShipNote)
                      Expanded(
                          child: RedButton(
                            text: 'Thêm ghi chú, ảnh',
                            onTap: () {
                              final deliveryBill = DeliveryBillDetailController();
                              Get.to(TakePhotoScreen(
                                  deliveryBillDetail:
                                  deliveryBill.deliveryBill.value), arguments: {'id': deliveryBill.id});
                            },
                      )),
                  ],
                ),
              ]),
            );
          })
        ],
      ),
    );
  }
}
