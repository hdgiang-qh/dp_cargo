import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/values/app_colors.dart';
import '../../../../../core/values/app_text_styles.dart';
import '../../../../../core/widget/textfields/app_text_field.dart';
import '../../controller/add_delivery_bill_controller.dart';

class InputReceiveForm extends StatelessWidget {
  final AddDeliveryBillController controller;

   const InputReceiveForm({super.key, required this.controller,});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
          margin: EdgeInsets.all(16.h),
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
              Text(
                'Tên khách hàng',
                style: Theme.of(context).BodyText1,
              ),
              Gap(8.h),
              Container(
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x1018280D),
                        blurRadius: 2,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: AppTextFieldWidget(
                    borderRadius: 6,
                    hintText: 'Tên khách hàng',
                    inputController: controller.name,
                  )),
              Gap(10.h),
              Text(
                'Số điện thoại',
                style: Theme.of(context).BodyText1,
              ),
              Gap(8.h),
              Container(
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x1018280D),
                        blurRadius: 2,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: AppTextFieldWidget(
                    borderRadius: 6,
                    hintText: 'Số điện thoại',
                    inputController: controller.phone,
                  )),
              Gap(10.h),
              Text(
                'Email',
                style: Theme.of(context).BodyText1,
              ),
              Gap(8.h),
              Container(
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x1018280D),
                        blurRadius: 2,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: AppTextFieldWidget(
                    borderRadius: 6,
                    hintText: 'Nhập email',
                    inputController: controller.email,
                  )),
              Gap(10.h),
              Text(
                'Địa chỉ',
                style: Theme.of(context).BodyText1,
              ),
              Gap(8.h),
              Container(
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x1018280D),
                        blurRadius: 2,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: AppTextFieldWidget(
                    borderRadius: 6,
                    hintText: 'Nhập địa chỉ',
                    inputController: controller.address,
                  )),
              Gap(10.h),
              Text(
                'Ghi chú',
                style: Theme.of(context).BodyText1,
              ),
              Gap(8.h),
              Container(
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x1018280D), // Shadow color
                        blurRadius: 2, // Blur radius
                        offset: Offset(0, 1), // Shadow position
                      ),
                    ],
                  ),
                  child: AppTextFieldWidget(
                    borderRadius: 6,
                    hintText: 'Nhập ghi chú',
                    inputController: controller.note,
                  )),
            ],
          )),
    );
  }
}
