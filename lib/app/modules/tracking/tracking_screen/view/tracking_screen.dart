import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:vncss/app/modules/util/images.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../core/base/base_view.dart';
import '../../../../core/model/page_state.dart';
import '../../../../core/values/app_colors.dart';
import '../../../../core/values/app_text_styles.dart';
import '../../../../core/widget/paging_view.dart';
import '../../../../data/model/model/box.dart';
import '../../../../data/model/model/tracking.dart';
import '../../../../routes/app_pages.dart';
import '../../../common_widget/button_widget.dart';
import '../../../delivery_bills/delivery/widget/skeletonizer_loading.dart';
import '../../../test_view.dart';
import '../controller/tracking_controller.dart';
import '../controller/tracking_status_controller.dart';
import '../widget/filter_tracking.dart';
import '../widget/tracking_view.dart';

class TrackingScreens extends BaseView<TrackingController> {
  final GlobalKey<ScaffoldState> _scaffoldTrackingKey =
  GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  TrackingStatusController controllerStatus = Get.find<TrackingStatusController>();

  void _openDrawer() {
    _scaffoldTrackingKey.currentState?.openEndDrawer();
  }
  @override
  Widget body(BuildContext context) {
    return Scaffold(
        key: _scaffoldTrackingKey,
        body: SafeArea(
          child: Column(
            children: [
              Container(
                  padding: const EdgeInsets.all(16),
                  child: Row(children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(Icons.arrow_back, size: 30),
                    ),
                    const Expanded(
                        child: Center(
                            child: Text(
                              "Tracking",
                              style:
                              TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ))),
                    Row(children: [
                      InkWell(
                        onTap: () {
                          showDialog(
                              context: Get.context!,
                              builder: (BuildContext context) =>
                                  CupertinoAlertDialog(
                                      content: const Text(
                                        "Xác nhận đồng bộ tracking",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      actions: [
                                        CupertinoDialogAction(
                                          isDefaultAction: true,
                                          child: const Text('Đóng'),
                                          onPressed: () async {
                                            Navigator.of(context,
                                                rootNavigator: true)
                                                .pop();
                                          },
                                        ),
                                        CupertinoDialogAction(
                                          isDefaultAction: true,
                                          child: const Text('Xác nhận'),
                                          onPressed: () async {
                                            Navigator.of(context,
                                                rootNavigator: true)
                                                .pop();
                                            controller.syncTracking();
                                          },
                                        )
                                      ]));
                        },
                        child: SvgPicture.asset(
                          Images.recycle,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 16),
                      InkWell(
                        onTap: () {
                          _openDrawer();
                        },
                        child: SvgPicture.asset(Images.filter1),
                      ),
                    ])
                  ])),
              Obx(() {
                return Container(
                  height: 70,
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Scrollbar(
                    thumbVisibility: true,
                    controller: scrollController,
                    thickness: 1,
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        controller: scrollController,
                        itemCount: controllerStatus.listStatus.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              controller.onTapStatus(index);
                            },
                            child: Obx(() {
                              return Container(
                                height: 60,
                                child: Stack(children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                        alignment: Alignment.center,
                                        height: 28,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16),
                                        margin: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(8),
                                          border: Border.all(
                                              color: controllerStatus
                                                  .colors[index]),
                                          color:
                                          controller.currentIndex.value ==
                                              index
                                              ? controllerStatus.colors[index]
                                              : Colors.white,
                                        ),
                                        child: Text(
                                          controller.tittle[index] == "Tất cả"
                                              ? "Tất cả"
                                              : "${controller.tittle[index]}",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: controller
                                                  .currentIndex.value !=
                                                  index
                                                  ? controllerStatus.colors[index]
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
                                          color: controllerStatus.colors[index],
                                          border:
                                          Border.all(color: Colors.white),
                                          borderRadius:
                                          BorderRadius.circular(4)),
                                      child: Text(
                                        controller.tittle[index] == "Tất cả"
                                            ? "${controllerStatus.totalString}"
                                            : "${controllerStatus.listStatus[index - 1].total}",
                                        style: const TextStyle(
                                            fontSize: 10, color: Colors.white),
                                      ),
                                    ),
                                  )
                                ]),
                              );
                            }),
                          );
                        }),
                  ),
                );
              }),
              Expanded(child: Obx(() {
                if (controller.isLoading.value == false && controller.listTracking.isEmpty) {
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
                            Get.toNamed(Routes.DETAIL_TRACKING, arguments: {
                              'id': controller.listTracking[index].id,
                              'indexTap': 1
                            });
                          },
                          child: Slidable(
                            endActionPane: ActionPane(
                                motion: const ScrollMotion(),
                                children: [
                                  _SlidableAction(
                                      color: AppColors.primary,
                                      nameAction: "Xóa",
                                      icon:
                                      const SvgGenImage('assets/image/trash.svg')
                                          .svg(color: Colors.white),
                                      onTap: (context) {
                                        Slidable.of(context)!.close();
                                        showDialog(
                                          context: Get.context!,
                                          builder: (BuildContext context) =>
                                              CupertinoAlertDialog(
                                                content: Text(
                                                  "Xóa mã tracking: ${controller.listTracking[index].code}",
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.bold),
                                                ),
                                                actions: [
                                                  CupertinoDialogAction(
                                                    isDefaultAction: true,
                                                    child: const Text('Đóng'),
                                                    onPressed: () async {
                                                      Navigator.of(context,
                                                          rootNavigator: true)
                                                          .pop();
                                                    },
                                                  ),
                                                  CupertinoDialogAction(
                                                    isDefaultAction: true,
                                                    child: const Text('Xác nhận'),
                                                    onPressed: () async {
                                                      Navigator.of(context,
                                                          rootNavigator: true)
                                                          .pop();
                                                      controller.deleteTracking(
                                                          controller
                                                              .listTracking[index]
                                                              .id);
                                                      await Future.delayed(
                                                          const Duration(
                                                              milliseconds: 500),
                                                              () {
                                                            controller.onRefreshPage();
                                                          });
                                                    },
                                                  )
                                                ],
                                              ),
                                        );
                                      }),
                                ]),
                            child: TrackingView(
                              tracking: controller.listTracking[index],
                            ),
                          ));
                    },
                    count: controller.listTracking.length,
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 20);
                    });
              })),
              ButtonWidget(
                onTap: () {
                  Get.toNamed(Routes.ADD_TRACKING)?.then((_) {
                    controller.onRefreshPage();
                  });
                },
                buttonText: "Thêm tracking",
                textColor: Colors.white,
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                bgcolor: AppColors.primary,
              )
            ],
          ),
        ),
        endDrawer: FilterTracking());
  }
}
class _SlidableAction extends StatelessWidget {
  final Color color;
  final String nameAction;
  final SvgPicture icon;
  final SlidableActionCallback onTap;

  const _SlidableAction(
      {required this.color,
      required this.nameAction,
      required this.icon,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          onTap(context);
        },
        child: Container(
          decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(6), bottomLeft: Radius.circular(6))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              const Gap(8),
              Text(
                nameAction,
                style: Theme.of(context)
                    .BodyText2Bold
                    .copyWith(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
