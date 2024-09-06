import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../generated/l10n.dart';
import '../../../core/values/app_colors.dart';

enum AlertEnum {
  @JsonValue(1)
  on,
  @JsonValue(0)
  off,
}

extension AlertEnumExt on AlertEnum {
  String get title {
    switch (this) {
      case AlertEnum.on:
        return S.current.on;
      case AlertEnum.off:
        return S.current.off;
    }
  }

  bool get value {
    switch (this) {
      case AlertEnum.on:
        return true;
      case AlertEnum.off:
        return false;
    }
  }

  Color get color {
    switch (this) {
      case AlertEnum.on:
        return AppColors.secondary;
      case AlertEnum.off:
        return AppColors.secondary2;
    }
  }
}
