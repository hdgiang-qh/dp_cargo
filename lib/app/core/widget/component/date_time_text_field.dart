import 'package:flutter/material.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../generated/l10n.dart';
import '../../utils/date_utils.dart';
import '../textfields/app_text_field.dart';

class DateTimeTextField extends StatefulWidget {
  final DateTime? dateTime;
  final ValueChanged<DateTime> onChanged;

  const DateTimeTextField({super.key, this.dateTime, required this.onChanged});

  @override
  State<DateTimeTextField> createState() => _DateTimeTextFieldState();
}

class _DateTimeTextFieldState extends State<DateTimeTextField> {
  late DateTime dateTime;

  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    dateTime = widget.dateTime ?? DateTime.now();
    if (widget.dateTime != null) {
      controller.text = dateTime.toDateAPIString();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppTextFieldWidget(
      inputController: controller,
      label: S.current.input_info,
      hintText: S.of(context).time,
      suffixIcon: Assets.icons.icCalendar.svg(),
      readOnly: true,
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
          controller.text = dateTime.toDateAPIString();
          widget.onChanged.call(dateTime);
        }
      },
    );
  }
}
