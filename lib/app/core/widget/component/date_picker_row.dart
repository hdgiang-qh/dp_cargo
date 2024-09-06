import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../generated/l10n.dart';
import '../../values/app_colors.dart';
import '../../values/app_text_styles.dart';
import '../textfields/app_text_field.dart';

class DatePickerRow extends StatefulWidget {
  final DateTime? initDateTime;
  final ValueChanged<DateTime> onChanged;

  const DatePickerRow({super.key, this.initDateTime, required this.onChanged});

  @override
  State<DatePickerRow> createState() => _DatePickerRowState();
}

class _DatePickerRowState extends State<DatePickerRow> {
  DateTime? dateTime;

  final TextEditingController dayController = TextEditingController();
  final TextEditingController monthController = TextEditingController();
  final TextEditingController yearController = TextEditingController();

  @override
  void initState() {
    dateTime = widget.initDateTime;
    if (dateTime != null) {
      dayController.text = dateTime!.day.toString();
      monthController.text = dateTime!.month.toString();
      yearController.text = dateTime!.year.toString();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).birth_day,
          style: Theme.of(context).BodyText1.copyWith(color: AppColors.neutrals08),
        ),
        Gap(8.h),
        GestureDetector(
          onTap: () async {
            final date = await showDatePicker(
                context: context,
                initialDate: dateTime,
                firstDate: DateTime(1900),
                lastDate: DateTime(2099),
                builder: (context, child) {
                  return Theme(data: ThemeData(), child: child!);
                });
            if (date != null) {
              dateTime = date;
              dayController.text = dateTime!.day.toString();
              monthController.text = dateTime!.month.toString();
              yearController.text = dateTime!.year.toString();
              widget.onChanged.call(dateTime!);
            }
          },
          child: Row(
            children: [
              Expanded(
                child: AppTextFieldWidget(
                  inputController: dayController,
                  readOnly: true,
                  enable: false,
                  suffixIcon: const Icon(CupertinoIcons.chevron_down),
                ),
              ),
              Gap(12.w),
              Expanded(
                child: AppTextFieldWidget(
                  inputController: monthController,
                  readOnly: true,
                  enable: false,
                  suffixIcon: const Icon(CupertinoIcons.chevron_down),
                ),
              ),
              Gap(12.w),
              Expanded(
                child: AppTextFieldWidget(
                  inputController: yearController,
                  readOnly: true,
                  enable: false,
                  suffixIcon: const Icon(CupertinoIcons.chevron_down),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
