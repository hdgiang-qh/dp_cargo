import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../core/utils/color_app.dart';
import '../../core/values/app_colors.dart';
import '../../core/widget/textfields/app_text_field.dart';
import '../tracking/tracking_detail/controller/tracking_detail_controller.dart';
import 'button_widget.dart';

class BottomSheetCheckGoods extends StatefulWidget {
  final String trackingCode;
  const  BottomSheetCheckGoods({super.key, required this.trackingCode});

  @override
  State<BottomSheetCheckGoods> createState() => BottomSheetCheckGoodsState();
}

class BottomSheetCheckGoodsState extends State<BottomSheetCheckGoods> {
  final controller = Get.find<TrackingDetailController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      margin: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text("Gửi yêu cầu đến mã tracking: ${widget.trackingCode}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),),
          ),
          Container(
            height: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppTextFieldWidget(
                    labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    inputController: controller.messageCheck,
                  ),

            ]),
          ),
          Container(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Row(children: [
              Expanded(
                child: ButtonWidget(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  buttonText: "Đóng",
                  fontSize: 13,
                  textColor: AppColors.primary,
                  borderColor: primaryColor,
                  bgcolor: Colors.white,
                ),
              ),
              Gap(16.w),
              Expanded(
                child: ButtonWidget(
                  onTap: (){
                    controller.checkRequest();
                    Navigator.pop(context);
                  },
                  buttonText: "Đồng ý",
                  fontSize: 13,
                  textColor: Colors.white,
                  bgcolor: AppColors.primary,
                ),
              ),
            ]),
          )
        ]),
      ),
    );
  }
}