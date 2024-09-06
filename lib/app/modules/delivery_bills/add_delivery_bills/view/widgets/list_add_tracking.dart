import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../core/values/app_colors.dart';
import '../../../../../core/values/app_text_styles.dart';
import '../../controller/add_delivery_bill_controller.dart';
import 'add_tracking_item.dart';

class ListAddTrackingWidget extends StatelessWidget {
  final AddDeliveryBillController controller;

  const ListAddTrackingWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.9,
      height: double.maxFinite,
      child: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                ),
                child: Padding(
                  padding: EdgeInsets.all(14.w),
                  child: Text(
                    'Danh sách tracking',
                    style: Theme.of(context).TitleStyle.copyWith(color: AppColors.neutralsWhite),
                  ),
                ),
              ),
              controller.listTracking.isEmpty
                  ? const Expanded(
                      child: Center(
                        child: Text('Không có tracking'),
                      ),
                    )
                  : Expanded(
                      child: ListView.separated(
                        separatorBuilder: (context, index) => SizedBox(height: 8.h),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Obx(
                            () => AddBillTrackingItem(
                                onChanged: (value) => controller.select(controller.listTracking[index]),
                                isSelect: controller.listSelectedTracking.contains(controller.listTracking[index]),
                                trackingBill: controller.listTracking[index]),
                          );
                        },
                        itemCount: controller.listTracking.length,
                      ),
                    ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.h),
                child: const Divider(color: AppColors.borderPXK),
              ),
              Visibility(
                visible: controller.listTracking.isNotEmpty,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          controller.getExpensive();
                          Navigator.pop(context);
                        },
                        child: Text('Thêm vào phiếu xuất', style: Theme.of(context).BodyText1),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
