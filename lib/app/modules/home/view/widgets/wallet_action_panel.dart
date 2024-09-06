import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../core/utils/converter_utils.dart';
import '../../../../core/values/app_colors.dart';
import '../../../../core/values/app_text_styles.dart';

class WalletActionPanel extends StatelessWidget {
  final String balance;
  final VoidCallback? onWalletTap;
  final VoidCallback? onBuyHelpTap;
  final VoidCallback? onConsignmentTap;

  const WalletActionPanel({
    super.key,
    required this.balance,
    this.onWalletTap,
    this.onBuyHelpTap,
    this.onConsignmentTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(0, 4),
            blurRadius: 10,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                )),
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    'Số dư',
                    style: Theme.of(context).BodyText4.copyWith(color: AppColors.neutralsWhite),
                  ),
                ),
                Text(
                  formatNumberDot(balance),
                  style: Theme.of(context).BodyText4.copyWith(color: AppColors.neutralsWhite, fontSize: 18),
                ),
                Text(
                  ' đ',
                  style: Theme.of(context).BodyText4.copyWith(color: AppColors.neutralsWhite),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _ServiceButton(
                  icon: Assets.icons.recharge.svg(height: 36.h),
                  label: 'Nạp tiền',
                  onTap: onWalletTap,
                ),
                _ServiceButton(
                  icon: Assets.icons.withdraw.svg(height: 36.h),
                  label: 'Rút tiền',
                  onTap: onBuyHelpTap,
                ),
                _ServiceButton(
                  icon: Assets.icons.history.svg(height: 36.h),
                  label: 'Lịch sử',
                  onTap: onConsignmentTap,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ServiceButton extends StatelessWidget {
  final Widget icon;
  final String label;
  final VoidCallback? onTap;

  const _ServiceButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          SizedBox(height: 4.h),
          Text(label,
              style: Theme.of(context)
                  .labelNavBarStyle
                  .copyWith(fontWeight: FontWeight.w700, color: AppColors.greyScale1)),
        ],
      ),
    );
  }
}
