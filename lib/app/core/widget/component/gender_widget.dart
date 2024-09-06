import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../enum/sex.dart';
import '../../values/app_colors.dart';

class GenderWidget extends StatefulWidget {
  final Sex? initSex;
  final ValueChanged<Sex> onChanged;

  const GenderWidget({super.key, this.initSex, required this.onChanged});

  @override
  State<GenderWidget> createState() => _GenderWidgetState();
}

class _GenderWidgetState extends State<GenderWidget> {
  Sex? gender;

  @override
  void initState() {
    gender = widget.initSex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List<Widget>.generate(Sex.values.length, (index) {
        return Row(
          children: [
            Radio<Sex>(
              activeColor: AppColors.primary,
                value: Sex.values[index],
                groupValue: gender,
                onChanged: (sex) {
                  setState(() {
                    gender = sex;
                  });
                  widget.onChanged.call(gender!);
                }),
            Gap(8.w),
            Text(Sex.values[index].title(context)),
            Gap(20.w),
          ],
        );
      }),
    );
  }
}
