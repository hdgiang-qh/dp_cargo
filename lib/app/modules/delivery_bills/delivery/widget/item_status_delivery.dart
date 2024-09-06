import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../common_widget/const.dart';
import '../../../common_widget/button_widget.dart';
import 'item_bottom_sheet.dart';

class FooterStatusNewDelivery extends StatelessWidget {
  final Function()? onCancel;
  final Function()? onSaleApprove;
  final Function()? onSkipApprove;
  final Function()? onExcel;
  final bool trackingEmpty;
  final bool checkRole;

  const FooterStatusNewDelivery(
      {super.key,
      this.onCancel,
      this.onSaleApprove,
      this.onSkipApprove,
      this.trackingEmpty = false,
      this.checkRole = false,
      this.onExcel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              trackingEmpty || checkRole
                  ? const SizedBox()
                  : Expanded(
                      child: ButtonWidget(
                        buttonText: "Sale xác nhận",
                        width: 120,
                        bgcolor: ColorApp.green23,
                        textColor: ColorApp.whiteFA,
                        onTap: onSaleApprove as void Function()?,
                      ),
                    ),
              trackingEmpty || checkRole ? const SizedBox() : Gap(16.w),
              trackingEmpty || checkRole
                  ? const SizedBox()
                  : Expanded(
                      child: ButtonWidget(
                        buttonText: "Y/c xuất kho",
                        bgcolor: ColorApp.green23,
                        textColor: ColorApp.whiteFA,
                        onTap: onSkipApprove as void Function()?,
                      ),
                    ),
              trackingEmpty || checkRole ? const SizedBox() : Gap(16.w),
              Expanded(
                child: ButtonWidget(
                  buttonText: "Huỷ PXK",
                  bgcolor: primaryColor,
                  textColor: ColorApp.whiteFA,
                  onTap: onCancel as void Function()?,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class FooterStatusSaleApprove extends StatelessWidget {
  final Function()? onCancel;
  final Function()? onAccountantApprove;
  final Function()? onSkipApprove;
  final bool checkRole;

  const FooterStatusSaleApprove(
      {super.key,
      this.onCancel,
      this.onAccountantApprove,
      this.onSkipApprove,
      this.checkRole = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ButtonWidget(
                  buttonText: "Kế toán duyệt",
                  bgcolor: ColorApp.green23,
                  borderColor: ColorApp.green23,
                  textColor: ColorApp.whiteFA,
                  onTap: onAccountantApprove as void Function()?,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              checkRole
                  ? const SizedBox()
                  : Expanded(
                      child: ButtonWidget(
                        buttonText: "Y/c xuất kho",
                        bgcolor: ColorApp.green23,
                        borderColor: ColorApp.green23,
                        textColor: ColorApp.whiteFA,
                        onTap: onSkipApprove as void Function()?,
                      ),
                    ),
              SizedBox(
                width: checkRole ? 0 : 16,
              ),
              Expanded(
                child: ButtonWidget(
                  buttonText: "Huỷ PXK",
                  bgcolor: primaryColor,
                  borderColor: primaryColor,
                  textColor: ColorApp.whiteFA,
                  onTap: onCancel as void Function()?,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class FooterStatusAccountantApprove extends StatelessWidget {
  final Function()? onCancel;
  final Function()? onSkipApprove;
  final Function()? onCustomApprove;
  final bool checkRole;

  const FooterStatusAccountantApprove(
      {super.key,
      this.onCancel,
      this.onSkipApprove,
      this.onCustomApprove,
      this.checkRole = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: ButtonWidget(
                  buttonText: "Huỷ PXK",
                  borderColor: primaryColor,
                  textColor: primaryColor,
                  onTap: onCancel as void Function()?,
                ),
              ),
              SizedBox(
                width: checkRole ? 0 : 16,
              ),
              checkRole
                  ? const SizedBox()
                  : Expanded(
                      child: ButtonWidget(
                        buttonText: "Khách xác nhận",
                        bgcolor: ColorApp.green23,
                        borderColor: ColorApp.green23,
                        textColor: ColorApp.whiteFA,
                        onTap: onCustomApprove as void Function()?,
                      ),
                    ),
            ],
          ),
        ],
      ),
    );
  }
}

class FooterStatusSkipApprove extends StatelessWidget {
  final Function()? onPack;
  final bool checkRole;

  const FooterStatusSkipApprove(
      {super.key, this.onPack, this.checkRole = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          checkRole
              ? const SizedBox()
              : ButtonWidget(
                  buttonText: "Đóng hàng",
                  bgcolor: ColorApp.green23,
                  borderColor: ColorApp.green23,
                  textColor: ColorApp.whiteFA,
                  onTap: onPack as void Function()?,
                ),
        ],
      ),
    );
  }
}

class FooterStatusPacked extends StatelessWidget {
  final Function()? onAddBol;
  final Function()? onCancel;
  final Function()? onDelivering;
  final Function()? onShipper;
  final bool empty;
  final bool checkRole;

  const FooterStatusPacked(
      {super.key,
      this.onAddBol,
      this.onCancel,
      this.onDelivering,
      this.onShipper,
      this.empty = false,
      this.checkRole = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Gap(8.h),
          Row(
            children: [
              Expanded(
                child: ButtonWidget(
                  buttonText: "Hủy PXK",
                  textColor: primaryColor,
                  borderColor: primaryColor,
                  onTap: onCancel as void Function()?,
                ),
              ),
              Gap(16.w),
              Expanded(
                child: ButtonWidget(
                  buttonText: "Xác nhận giao",
                  bgcolor: primaryColor,
                  textColor: ColorApp.whiteFA,
                  borderColor: primaryColor,
                  onTap: onDelivering as void Function()?,
                ),
              ),
            ],
          ),
          Gap(8.h),
          Row(
            children: [
              Expanded(
                child: ButtonWidget(
                  buttonText: "Tạo vận đơn",
                  textColor: primaryColor,
                  borderColor: primaryColor,
                  onTap: onAddBol as void Function()?,
                ),
              ),
              Gap(16.w),
              Expanded(
                child: ButtonWidget(
                  buttonText: "Gán shipper",
                  bgcolor: empty ? ColorApp.grey7F : ColorApp.green26,
                  borderColor: empty ? ColorApp.grey7F : ColorApp.green26,
                  textColor: empty ? ColorApp.black23 : ColorApp.whiteFA,
                  onTap: onShipper as void Function()?,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FooterStatusDelivering extends StatelessWidget {
  final Function()? onAddBol;

  const FooterStatusDelivering({super.key, this.onAddBol});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          ButtonWidget(
            buttonText: "Tạo vận đơn",
            width: context.width,
            bgcolor: primaryColor,
            borderColor: primaryColor,
            textColor: ColorApp.whiteFA,
            onTap: onAddBol as void Function()?,
          ),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}

class FooterUnSuccessful extends StatelessWidget {
  final Function()? onExportAgain;
  final Function()? onCancel;
  final bool bolEmpty;

  const FooterUnSuccessful(
      {super.key, this.onExportAgain, this.bolEmpty = false, this.onCancel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          bolEmpty
              ? const SizedBox()
              : Column(
                children: [
                  ButtonWidget(
                      buttonText: "Xác nhận đóng lại hàng",
                      bgcolor: ColorApp.green23,
                      borderColor: ColorApp.green23,
                      textColor: ColorApp.whiteFA,
                      onTap: onExportAgain as void Function()?,
                    ),
                  const SizedBox(height: 8,),
                  ButtonWidget(
                    buttonText: "Hủy PXK",
                    textColor: primaryColor,
                    borderColor: primaryColor,
                    onTap: onCancel as void Function()?,
                  ),
                ],
              ),
        ],
      ),
    );
  }
}

class FooterStatus7 extends StatelessWidget {
  const FooterStatus7({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          ButtonWidget(
            buttonText: "Xuất Excel",
            bgcolor: ColorApp.green36,
            textColor: ColorApp.whiteFA,
            onTap: () {},
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

class FooterStatus8 extends StatelessWidget {
  const FooterStatus8({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          ButtonWidget(
            buttonText: "Xuất Excel",
            bgcolor: ColorApp.green36,
            textColor: ColorApp.whiteFA,
            onTap: () {},
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
