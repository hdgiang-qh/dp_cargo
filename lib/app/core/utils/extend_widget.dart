import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

extension ColumnSpacingExtension on Column {
  static Column withSpacing({
    Key? key,
    required List<Widget> children,
    double spacing = 10,
    Widget? separated,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    MainAxisSize mainAxisSize = MainAxisSize.max,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    TextDirection? textDirection,
    VerticalDirection verticalDirection = VerticalDirection.down,
    TextBaseline? textBaseline,
  }) {
    var spacedChildren = children.expand((widget) => [widget, separated ?? Gap(spacing)]).toList();
    spacedChildren.removeLast(); // Remove the extra SizedBox
    return Column(
      key: key,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      textBaseline: textBaseline,
      children: spacedChildren,
    );
  }
}

extension RowSpacingExtension on Row {
  static Row withSpacing({
    Key? key,
    required List<Widget> children,
    double spacing = 10,
    Widget? separated,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    MainAxisSize mainAxisSize = MainAxisSize.max,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    TextDirection? textDirection,
    VerticalDirection verticalDirection = VerticalDirection.down,
    TextBaseline? textBaseline,
  }) {
    var spacedChildren = children.expand((widget) => [widget, separated ?? Gap(spacing)]).toList();
    spacedChildren.removeLast(); // Remove the extra SizedBox
    return Row(
      key: key,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      textBaseline: textBaseline,
      children: spacedChildren,
    );
  }
}

extension ListWidgetExtension on List<Widget> {
  List<Widget> separatedList({
    double spacing = 10,
    Widget? separated,
  }) {
    var spacedChildren = expand((widget) => [widget, separated ?? Gap(spacing)]).toList();
    spacedChildren.removeLast();
    return spacedChildren;
  }
}
