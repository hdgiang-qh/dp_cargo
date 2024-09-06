import 'package:flutter/material.dart';
import '../../../../generated/l10n.dart';
import '../../../core/values/app_text_styles.dart';
import '../../../data/model/model/vn_delivery_box.dart';

class ItemCode extends StatelessWidget {
  const ItemCode({
    super.key,
    required this.vnDeliveryBoxes,
    this.widget,
  });
  final VnDeliveryBox vnDeliveryBoxes;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget ?? const SizedBox(),
              const SizedBox(
                width: 4,
              ),
              Text(
                vnDeliveryBoxes.code?.toUpperCase() ?? S.current.isNull,
                style: Theme.of(context).BodyText2Bold,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
