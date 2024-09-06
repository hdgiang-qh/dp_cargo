import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'widgets/add_delivery_bill_expensive.dart';
import 'widgets/list_add_tracking.dart';
import '../../../../core/values/app_colors.dart';
import '../../../../core/values/app_text_styles.dart';
import 'widgets/input_receive_information.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../core/base/base_view.dart';
import '../../../../core/widget/custom_app_bar.dart';
import '../../delivery_bills_detail/view/widgets/list_tracking_bill_widget.dart';
import '../../delivery_bills_detail/view/widgets/title_tile.dart';
import '../controller/add_delivery_bill_controller.dart';

class AddDeliveryBillView extends BaseView<AddDeliveryBillController> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget body(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: ListAddTrackingWidget(
        controller: controller,
      ),
      appBar: CustomAppBar(
        isBackButtonEnabled: false,
        centerTitle: false,
        appBarTitleText: 'Thêm PXK',
        actions: [
          InkWell(
            onTap: () {
              Get.back();
            },
            child: Assets.icons.icXMark.svg(),
          ),
          Gap(22.w),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Gap(16.h),
                    TitleTileOrder(label: 'Thông tin nhận hàng', icon: Assets.icons.icPackage.svg()),
                    Gap(8.h),
                    InputReceiveForm(
                      controller: controller,
                    ),
                    Gap(16.h),
                    TitleTileOrder(label: 'Danh sách tracking', icon: Assets.icons.icPackage.svg()),
                    Gap(8.h),
                    ListTrackingBill(),
                    Gap(16.h),
                    TitleTileOrder(label: 'Chi phí', icon: Assets.icons.icExpense.svg()),
                    Gap(8.h),
                    BillDeliveryExpenseSummary(),
                    Gap(16.h),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                      flex: 2,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          side: const BorderSide(color: AppColors.primary),
                          foregroundColor: AppColors.neutrals08,
                          backgroundColor: AppColors.neutral03,
                        ),
                        onPressed: () {
                          _scaffoldKey.currentState?.openEndDrawer();
                        },
                        child: Text('Thêm Tracking',
                            style: Theme.of(context).BodyText1.copyWith(color: AppColors.primary)),
                      )),
                  Gap(16.w),
                  Expanded(
                      flex: 2,
                      child: ElevatedButton(
                        onPressed: () {
                          controller.addDeliveryBill();
                        },
                        child: Text('Thêm phiếu', style: Theme.of(context).BodyText1),
                      )
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
