import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../../../../gen/assets.gen.dart';
import '../../../../../core/utils/converter_utils.dart';
import '../../../../../core/values/app_colors.dart';
import '../../../../../core/values/app_text_styles.dart';
import '../../../../../core/widget/dialog/app_snackbar.dart';
import '../../../../../data/model/model/tracking_bill.dart';
import '../../../add_delivery_bills/controller/add_delivery_bill_controller.dart';
import '../../../list_delivery_bills/view/widgets/status_widget.dart';

class ListTrackingBill extends StatelessWidget {
  final AddDeliveryBillController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        color: Colors.white,
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: controller.listSelectedTracking.length,
          itemBuilder: (context, index) => ItemTrackingBill(tracking: controller.listSelectedTracking[index]),
        ),
      );
    });
  }
}

class ListTrackingBillDetail extends StatelessWidget {
  final List<TrackingsBill> trackings;

  const ListTrackingBillDetail({super.key, required this.trackings});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: trackings.length,
        itemBuilder: (context, index) => ItemTrackingBill(tracking: trackings[index]),
      ),
    );
  }
}

class ItemTrackingBill extends StatelessWidget {
  final TrackingsBill tracking;
  final VoidCallback? onTap;

  const ItemTrackingBill({super.key, this.onTap, required this.tracking});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: 16.h, bottom: 8.h, left: 16.w, right: 16.w),
        padding: EdgeInsets.all(16.h),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Color(0x40000000),
              blurRadius: 2.0,
              offset: Offset(0, 0),
            ),
          ],
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: AppColors.borderPXK),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () {
                      Clipboard.setData(ClipboardData(text: tracking.orderId.toString()));
                      AppSnackBar.showSuccess(message: 'Đã sao chép!');
                    },
                    child: Assets.icons.icBillPXK.svg()),
                Gap(10.w),
                Expanded(
                  child: Text(
                    tracking.orderId.toString(),
                    style: Theme.of(context).BodyText2Bold.copyWith(color: AppColors.neutrals08, height: 1),
                    maxLines: 1,
                  ),
                ),
                if (tracking.status != null)
                  ChipStatus(color: tracking.status!.color, label: tracking.status?.value ?? ''),
              ],
            ),
            Gap(12.h),
            Text(
              'Mã tracking',
              style: Theme.of(context).BodyText1.copyWith(color: AppColors.neutrals06),
            ),
            Gap(8.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: InkWell(
                      onTap: () {
                        Clipboard.setData(ClipboardData(text: tracking.code.toString()));
                        AppSnackBar.showSuccess(message: 'Đã sao chép!');
                      },
                      child: Assets.icons.icBillPXK.svg()),
                ),
                Gap(10.w),
                Expanded(
                  child: Text(tracking.code ?? '',
                      style: Theme.of(context).BodyText1.copyWith(color: AppColors.neutrals08)),
                ),
              ],
            ),
            Gap(10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sản phẩm',
                  textAlign: TextAlign.right,
                  style: Theme.of(context).BodyText1.copyWith(color: AppColors.neutrals06),
                ),
                Expanded(
                  child: Text(
                      textAlign: TextAlign.right,
                      tracking.productName ?? '',
                      style: Theme.of(context).BodyText1.copyWith(color: AppColors.neutrals08)),
                ),
              ],
            ),
            Gap(10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Số lượng',
                  style: Theme.of(context).BodyText1.copyWith(color: AppColors.neutrals06),
                ),
                Text(tracking.trackingAmount?.toString() ?? '',
                    style: Theme.of(context).BodyText1.copyWith(color: AppColors.neutrals08)),
              ],
            ),
            Gap(10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'TLTT/TLKT',
                  style: Theme.of(context).BodyText1.copyWith(color: AppColors.neutrals06),
                ),
                Text(
                  '${tracking.trackingCalculationWeight ?? 0}/${tracking.trackingMiningWeight ?? 0}',
                  style: Theme.of(context).BodyText1.copyWith(color: AppColors.neutrals08),
                ),
              ],
            ),
            Gap(10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Giá cước VC',
                  style: Theme.of(context).BodyText1.copyWith(color: AppColors.neutrals06),
                ),
                Text('${formatNumberCommas(tracking.trackingShippingCost)}đ',
                    style: Theme.of(context).BodyText1.copyWith(color: AppColors.neutrals08)),
              ],
            ),
            Gap(10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Phí vận chuyển',
                  style: Theme.of(context).BodyText1.copyWith(color: AppColors.neutrals06),
                ),
                Text('${formatNumberCommas(tracking.trackingShippingFee?.toString())} đ',
                    style: Theme.of(context).BodyText1.copyWith(color: AppColors.neutrals08)),
              ],
            ),
            Gap(10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Phí DV',
                  style: Theme.of(context).BodyText1.copyWith(color: AppColors.neutrals06),
                ),
                Text('${formatNumberCommas(tracking.trackingOtherFee)} đ',
                    style: Theme.of(context).BodyText1.copyWith(color: AppColors.neutrals08)),
              ],
            ),
            Gap(10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Phụ thu',
                  style: Theme.of(context).BodyText1.copyWith(color: AppColors.neutrals06),
                ),
                Text('${formatNumberCommas(tracking.trackingSurcharge?.toString())} đ',
                    style: Theme.of(context).BodyText1.copyWith(color: AppColors.neutrals08)),
              ],
            ),
            Gap(10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Thành tiền',
                  style: Theme.of(context).BodyText1.copyWith(color: AppColors.neutrals06),
                ),
                Text('${formatNumberCommas(tracking.trackingTotalMoney)} đ',
                    style: Theme.of(context).BodyText1.copyWith(color: AppColors.neutrals08)),
              ],
            ),
            Gap(10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Thời gian đóng hàng',
                  style: Theme.of(context).BodyText1.copyWith(color: AppColors.neutrals06),
                ),
                Text(formatDateTimeExportOrder(tracking.packedDate),
                    style: Theme.of(context).BodyText1.copyWith(color: AppColors.neutrals08)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
