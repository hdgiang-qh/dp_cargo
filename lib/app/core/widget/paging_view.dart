import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '/app/core/utils/debouncer.dart';

typedef NullableIndexedWidgetBuilder = Widget? Function(
    BuildContext context, int index);

typedef IndexedWidgetBuilder = Widget Function(BuildContext context, int index);

typedef IndexedWidgetBuilder2 = Widget Function(BuildContext context, int index);

///ignore: must_be_immutable
class PagingView extends StatelessWidget {
  final Function() onLoadNextPage;
  final Future<void> Function()? onRefresh;
  ScrollController? scrollController;
  late final _debouncer = Debouncer(milliseconds: 500);

  PagingView({
    super.key,
    required Widget child,
    required this.onLoadNextPage,
    this.onRefresh,
    this.scrollController,
  }) {
    scrollController ??= ScrollController();
    body = _getScrollableView(child);
  }

  late Widget body;

  Widget EmptyWidget() {
    return  Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Không tìm thấy kết quả"),
        Gap(10.h),
        ElevatedButton(
          onPressed: () {
            onRefresh?.call();
          },
          child: const Text('Tải lại'),
        ),
      ],
    ));
  }

  Widget EmptyWidget2() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Không tìm thấy kết quả"),
        Gap(10.h),
        ElevatedButton(
          onPressed: () {
            onRefresh?.call();
          },
          child: const Text('Tải lại dữ liệu'),
        ),
      ],
    ));
  }

  Widget EmptyWidgetTracking() {
    return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Danh sách trống"),
          ],
        ));
  }
  Widget SearchEmpty() {
    return SvgPicture.asset("assets/image/search_empty.svg");
  }

  PagingView.builderSearch({
    super.key,
    required this.onLoadNextPage,
    this.onRefresh,
    this.scrollController,
    required NullableIndexedWidgetBuilder builder,
    required int count,
    Widget? emptyWidget,
    EdgeInsetsGeometry? padding,
    bool isLoading = false,
  }) {
    scrollController ??= ScrollController();
    body = (count == 0 && isLoading == false)
        ? (emptyWidget == null ? SearchEmpty() : EmptyWidget2())
        : ListView.builder(
            itemBuilder: builder,
            padding: padding,
            itemCount: count,
            shrinkWrap: true,
            controller: scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
          );
  }

  PagingView.builder({
    super.key,
    required this.onLoadNextPage,
    this.onRefresh,
    this.scrollController,
    required NullableIndexedWidgetBuilder builder,
    required int count,
    Widget? emptyWidget,
    EdgeInsetsGeometry? padding,
    bool isLoading = false,
    bool scroll = true
  }) {
    scrollController ??= ScrollController();
    body = (count == 0 && isLoading == false)
        ? (emptyWidget ?? EmptyWidget2())
        : ListView.builder(
            itemBuilder: builder,
            padding: padding,
            itemCount: count,
            shrinkWrap: true,
            controller: scrollController,
            physics: scroll
                ? const AlwaysScrollableScrollPhysics()
                : const NeverScrollableScrollPhysics(),
          );
  }

  PagingView.builderTracking({
    super.key,
    required this.onLoadNextPage,
    this.onRefresh,
    this.scrollController,
    required NullableIndexedWidgetBuilder builder,
    required IndexedWidgetBuilder2 separatorBuilder,
    required int count,
    Widget? emptyWidget,
    EdgeInsetsGeometry? padding,
    bool isLoading = false,
    bool scroll = true
  }) {
    scrollController ??= ScrollController();
    body = (count == 0 && isLoading == false)
        ? (emptyWidget ?? EmptyWidgetTracking())
        : ListView.separated(
      itemBuilder: builder,
      padding: padding,
      itemCount: count,
      shrinkWrap: true,
      controller: scrollController,
      physics: scroll
          ? const AlwaysScrollableScrollPhysics()
          : const NeverScrollableScrollPhysics(),
      separatorBuilder: separatorBuilder,
    );
  }


  PagingView.separated(
      {super.key,
      required this.onLoadNextPage,
      this.onRefresh,
      this.scrollController,
      required NullableIndexedWidgetBuilder builder,
      required int count,
      required IndexedWidgetBuilder separatorBuilder,
      Widget? emptyWidget,
      bool isLoading = false,
        bool scroll = true,
      EdgeInsetsGeometry? padding}) {
    scrollController ??= ScrollController();
    body = (count == 0 && isLoading == false)
        ? (emptyWidget ?? EmptyWidget())
        : ListView.separated(
            itemBuilder: builder,
            padding: padding,
            itemCount: count,
            shrinkWrap: true,
            controller: scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            separatorBuilder: separatorBuilder,
          );
  }

  PagingView.separatedAddDelivery(
      {super.key,
      required this.onLoadNextPage,
      this.onRefresh,
      this.scrollController,
      required NullableIndexedWidgetBuilder builder,
      required int count,
      required IndexedWidgetBuilder separatorBuilder,
      Widget? emptyWidget,
      bool isLoading = false,
        bool scroll = true,
      EdgeInsetsGeometry? padding}) {
    scrollController ??= ScrollController();
    body = (count == 0 && isLoading == false)
        ? (emptyWidget ?? EmptyWidget())
        : ListView.separated(
            itemBuilder: builder,
            padding: padding,
            itemCount: count,
            shrinkWrap: true,
            controller: scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            separatorBuilder: separatorBuilder,
          );
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: (ScrollNotification scrollInfo) {
        if (scrollController != null) {
          var triggerFetchMoreSize =
              0.75 * scrollController!.position.maxScrollExtent;
          if (scrollController!.position.pixels >= triggerFetchMoreSize &&
              (scrollController!.position.userScrollDirection ==
                  ScrollDirection.reverse)) {
            _debouncer.run(() {
              onLoadNextPage();
            });
          }
        }

        return true;
      },
      child: onRefresh == null
          ? body
          : RefreshIndicator(
              onRefresh: onRefresh!,
              child: body,
            ),
    );
  }

  _getScrollableView(Widget child) {
    return SingleChildScrollView(
      controller: scrollController,
      physics: const AlwaysScrollableScrollPhysics(),
      child: child,
    );
  }
}
