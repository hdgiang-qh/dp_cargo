import 'package:flutter/material.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../generated/l10n.dart';
import '../../utils/date_utils.dart';
import '../textfields/app_text_field.dart';

class DatePickerTimeRangeTextField extends StatefulWidget {
  final DateTimeRange? dateTime;
  final ValueChanged<DateTimeRange> onChanged;

  const DatePickerTimeRangeTextField(
      {super.key, this.dateTime, required this.onChanged});

  @override
  State<DatePickerTimeRangeTextField> createState() =>
      _DatePickerTimeRangeTextFieldState();
}

class _DatePickerTimeRangeTextFieldState
    extends State<DatePickerTimeRangeTextField> {
  DateTimeRange? dateTime;

  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    dateTime = widget.dateTime;
    if (widget.dateTime != null) {
      controller.text =
          '${dateTime?.start.toDateAPIString()} - ${dateTime?.end.toDateAPIString()}';
    } else {
      controller.clear();
    }
    super.initState();
  }

  @override
  void didUpdateWidget(covariant DatePickerTimeRangeTextField oldWidget) {
    if (oldWidget.dateTime != widget.dateTime) {
      dateTime = widget.dateTime;
      if (widget.dateTime != null) {
        controller.text =
            '${dateTime?.start.toDateAPIString()} - ${dateTime?.end.toDateAPIString()}';
      } else {
        controller.clear();
      }
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return AppTextFieldWidget(
      inputController: controller,
      hintText: S.of(context).time,
      suffixIcon: Assets.icons.icCalendar.svg(),
      readOnly: true,
      onTap: () async {
        final date = await showDateRangePicker(
            context: context,
            initialDateRange: dateTime,
            firstDate: DateTime(1900),
            lastDate: DateTime(2099),
            builder: (context, child) {
              return Theme(data: ThemeData(), child: child!);
            });
        if (date != null) {
          dateTime = date;
          controller.text =
              '${dateTime?.start.toDateAPIString()} - ${dateTime?.end.toDateAPIString()}';
          widget.onChanged.call(dateTime!);
        }
      },
    );
  }
}
