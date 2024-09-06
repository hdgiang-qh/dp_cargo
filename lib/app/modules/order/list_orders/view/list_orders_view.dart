import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../../core/base/base_view.dart';
import '../../../../core/model/page_state.dart';
import '../../../../core/values/app_colors.dart';
import '../../../../core/widget/paging_view.dart';
import '../../../../routes/app_pages.dart';
import '../../../common_widget/app_bar_widget.dart';
import '../../../common_widget/button_widget.dart';
import '../../../delivery_bills/delivery/widget/skeletonizer_loading.dart';
import '../../order_add/view/order_add_screen.dart';
import '../controller/list_orders_controller.dart';
import '../controller/order_status_controller.dart';
import 'widgets/filter_order.dart';
import 'widgets/order_widget.dart';

class ListOrder extends BaseView<ListOrdersController> {
  final int? index;

  ListOrder({this.index});

  final GlobalKey<ScaffoldState> _scaffoldOrderKey = GlobalKey<ScaffoldState>();
  @override
  final ScrollController _scrollController = ScrollController();

  void _openDrawer() {
    _scaffoldOrderKey.currentState?.openEndDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldOrderKey,
        body: SafeArea(
            child: Column(children: [
          AppBarWidget(
            title: "Đơn hàng",
            disOnBack: index == 0 ? true : false,
            onBack: () => Get.back(),
            onFilter: () {
              _openDrawer();
            },
            showFilter: true,
          ),
          Obx(() {
            return Container(
              height: 60,
              padding: const EdgeInsets.only(bottom: 10),
              child: Scrollbar(
                controller: _scrollController,
                thumbVisibility: true,
                thickness: 1,
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    controller: _scrollController,
                    itemCount: controller.listStatus.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          controller.onTapStatus(index);
                          controller.clearFilter();
                        },
                        child: Obx(() {
                          return Stack(children: [
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  margin: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: controller.colors[index]),
                                    color:
                                        controller.currentIndex.value == index
                                            ? controller.colors[index]
                                            : Colors.white,
                                  ),
                                  child: Text(
                                    controller.tittle[index] == "Tất cả"
                                        ? "Tất cả"
                                        : controller.tittle[index],
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: controller.currentIndex.value !=
                                                index
                                            ? controller.colors[index]
                                            : Colors.white),
                                  )),
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: Container(
                                alignment: Alignment.centerRight,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 2, horizontal: 8),
                                decoration: BoxDecoration(
                                    color: controller.colors[index],
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(4)),
                                child: Text(
                                  controller.tittle[index] == "Tất cả"
                                      ? "${controller.totalString}"
                                      : "${controller.listStatus[index - 1].total}",
                                  style: const TextStyle(
                                      fontSize: 10, color: Colors.white),
                                ),
                              ),
                            )
                          ]);
                        }),
                      );
                    }),
              ),
            );
          }),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value == false && controller.listOrder.isEmpty) {
                return FutureBuilder(
                  future: Future.delayed(const Duration(seconds: 2)),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return SkeletonizerLoading(
                        loading: controller.isLoading.value,
                      );
                    } else {
                      return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Danh sách trống"),
                              Gap(10.h),
                              ElevatedButton(
                                onPressed: () {
                                  controller.onRefreshPage();
                                },
                                child: const Text('Tải lại'),
                              ),
                            ],
                          ));
                    }
                  },
                );
              }
              return PagingView.separated(
                  onLoadNextPage: () {
                    controller.onLoadNextPage();
                  },
                  onRefresh: () async {
                    controller.onRefreshPage();
                  },
                  isLoading: controller.pageState == PageState.LOADING,
                  builder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Get.toNamed(Routes.DETAIL_ORDER, arguments: {
                          'id': controller.listOrder[index].id,
                        });
                      },
                      child: OrderWidget(
                        order: controller.listOrder[index],
                      ),
                    );
                  },
                  count: controller.listOrder.length,
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 10.h);
                  });
            }),
          ),
          ButtonWidget(
            onTap: (){
              controller.clear();
              Get.to(() => const OrderAddScreen())?.then((_)async{
                await Future.delayed(Duration(milliseconds: 1),(){
                  controller.onRefreshPage();
                });
              });
            },
            buttonText: "Thêm đơn hàng",
            fontSize: 13,
            textColor: Colors.white,
            margin: const EdgeInsets.symmetric(horizontal: 16 ,vertical: 8),
            bgcolor: AppColors.primary,
          )
        ])),
        endDrawer: const FilterOrder());
  }
}
