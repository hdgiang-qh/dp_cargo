import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../generated/l10n.dart';
import '../../../../core/values/app_colors.dart';
import '../../../../core/values/app_text_styles.dart';
import '../../../../core/widget/appbar/custom_appbar.dart';
import '../../../../core/widget/component/date_picker_time_rang_textfield.dart';
import '../../../../core/widget/textfields/app_text_field.dart';

typedef OnChangedFilter = void Function(
  DateTimeRange? dateTimeRange,
  String code,
);

class FilterDeliveryBillsView extends StatefulWidget {
  final String code;
  final DateTimeRange? dateTimeRange;
  final OnChangedFilter onChangedFilter;

  const FilterDeliveryBillsView({super.key, this.dateTimeRange, required this.onChangedFilter, required this.code});

  @override
  State<FilterDeliveryBillsView> createState() => _FilterDeliveryBillsViewState();
}

class _FilterDeliveryBillsViewState extends State<FilterDeliveryBillsView> {
  DateTimeRange? dateTimeRange;
  late TextEditingController textEditingController;

  @override
  void initState() {
    dateTimeRange = widget.dateTimeRange;
    textEditingController = TextEditingController(text: widget.code);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.9,
      child: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppbarCustom(
                centerTitle: false,
                backGroundColor: AppColors.primary,
                titleWidget: Padding(
                  padding: EdgeInsets.all(14.w),
                  child: Text(
                    'Bộ lọc tìm kiếm',
                    style: Theme.of(context).TitleStyle.copyWith(color: AppColors.neutralsWhite),
                  ),
                )),
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nhập thông tin',
                    style: Theme.of(context).BodyText1,
                  ),
                  Gap(10.h),
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
                        hintText: 'Tìm kiếm theo mã phiếu',
                        inputController: textEditingController,
                      )),
                  Gap(16.h),
                  DatePickerTimeRangeTextField(
                    dateTime: dateTimeRange,
                    onChanged: (DateTimeRange value) {
                      dateTimeRange = value;
                    },
                  ),
                ],
              ),
            ),

            const Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.h),
              child: const Divider(color: AppColors.borderPXK),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: AppColors.neutrals08,
                      backgroundColor: AppColors.neutral03,
                    ),
                    onPressed: () {
                      setState(() {
                        widget.onChangedFilter.call(null, '');

                        dateTimeRange = null;
                        textEditingController.clear;
                      });
                    },
                    child: Text(S.current.reset),
                  ),
                  Gap(16.w),
                  ElevatedButton(
                    onPressed: () {
                      widget.onChangedFilter.call(dateTimeRange, textEditingController.text);
                    },
                    child: Text(S.current.apply),
                  ),
                ],
              ),
            ),
            Gap(16.h),
          ],
        ),
      ),
    );
  }
}
