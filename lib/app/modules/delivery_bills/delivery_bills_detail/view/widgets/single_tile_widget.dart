import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../core/values/app_colors.dart';
import '../../../../../core/values/app_text_styles.dart';
import '../../../../../data/model/model/vn_delivery_box.dart';
import '../../../../../data/model/model/vn_delivery_order.dart';
import '../../../list_delivery_bills/view/widgets/status_widget.dart';

class SingleTileWidget extends StatelessWidget {
  final VnDeliveryOrder vnDeliveryOrder;
  final List<VnDeliveryBox> vnDeliveryBoxes;

  const SingleTileWidget(
      {super.key,
      required this.vnDeliveryOrder,
      required this.vnDeliveryBoxes});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: vnDeliveryBoxes
          .map((vnDeliveryBox) => Container(
        height: 110,
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: AppColors.listTileBorder))),
                child: Row(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: AppColors.neutralDivider),
                            borderRadius: BorderRadius.circular(4.r)),
                        padding: EdgeInsets.all(4.w),
                        width: 100,
                        height: 93,
                        child: CachedNetworkImage(
                          imageUrl: vnDeliveryBox.deliveredImageUrl ??
                              'https://dashboard.dp-cargo.com/themes/dpcargo/logo-dark.png',
                          fit: BoxFit.contain,
                        )),
                    Gap(10.w),
                    SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ChipStatus(
                            color: vnDeliveryBox.status?.color.withOpacity(0.4) ??
                                AppColors.aZShopPrimary,
                            label:
                            vnDeliveryBox.status?.value ?? S.current.isNull,
                            width: null,
                            textColor: vnDeliveryBox.status?.color ??
                                AppColors.aZShopPrimary,
                          ),
                          Text(
                            vnDeliveryBox.code?.toUpperCase() ??
                                S.current.isNull,
                            style: Theme.of(context).BodyText2Bold,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            vnDeliveryOrder.vnDeliveryUnit?.name ??
                                S.current.isNull,
                            style: Theme.of(context)
                                .BodyText1
                                .copyWith(color: AppColors.neutral06),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ))
          .toList(),
    );
  }
}
