import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../generated/l10n.dart';

enum Sex {
  @JsonValue("male")
  male,
  @JsonValue("female")
  female,
  @JsonValue("other")
  other,
}

extension SexExt on Sex {
  String title(BuildContext context) {
    switch (this) {
      case Sex.male:
        return S.of(context).male;
      case Sex.female:
        return S.of(context).female;
      case Sex.other:
        return S.of(context).other;
    }
  }
}
