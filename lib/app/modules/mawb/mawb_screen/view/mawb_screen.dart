
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vncss/app/modules/util/images.dart';

import '../../../../core/base/base_view.dart';
import '../../../../core/model/page_state.dart';
import '../../../../core/widget/paging_view.dart';
import '../../../../routes/app_pages.dart';
import '../controller/mawb_controller.dart';
import '../controller/mawb_status_controller.dart';
import '../widget/filter_mawb.dart';
import '../widget/mawb_view.dart';

class MAWBScreen extends BaseView<AWBController> {
  final controller = Get.find<AWBController>();
  final ScrollController _scrollController = ScrollController();
  final GlobalKey<ScaffoldState> _scaffoldAwbKey = GlobalKey<ScaffoldState>();
  final controllerStatus = Get.find<AwbStatusController>();

  void _openDrawer() {
    _scaffoldAwbKey.currentState?.openEndDrawer();
  }

  @override
  Widget body(BuildContext context) {
    return Scaffold(
        key: _scaffoldAwbKey,
        body: SafeArea(
          child: Column(children: [
            Container(
                padding: const EdgeInsets.all(16),
                child: Row(children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(Icons.arrow_back, size: 30),
                  ),
                  const Expanded(child: Center(child: Text("MAWB", style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),))),

                  Row(children: [
                    InkWell(
                      onTap: () {
                        Get.toNamed(Routes.SYNC_AWB);
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
            Obx((){
              return Container(
                height: 70,
                padding: EdgeInsets.only(bottom: 16),
                child: Scrollbar(
                  thumbVisibility: true,
                  controller: _scrollController,
                  thickness: 1,
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      controller: _scrollController,
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
                                      padding: EdgeInsets.symmetric(horizontal: 16),
                                      margin: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(color: controllerStatus.colors[index]),
                                        color: controller.currentIndex.value == index
                                            ? controller.colors[index]
                                            : Colors.white,
                                      ),
                                      child: Text(
                                        controller.tittle[index] == "Tất cả"
                                            ? "Tất cả"
                                            : "${controller.tittle[index]}",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color:
                                            controller.currentIndex.value != index
                                                ? controller.colors[index]
                                                : Colors.white),
                                      )),
                                ),
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: Container(
                                    alignment: Alignment.centerRight,
                                    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                                    decoration: BoxDecoration(
                                        color: controllerStatus.colors[index],
                                        border: Border.all(color: Colors.white),
                                        borderRadius: BorderRadius.circular(4)
                                    ),
                                    child: Text(
                                      controller.tittle[index] == "Tất cả"
                                          ? "${controllerStatus.total}"
                                          : "${controllerStatus.listStatus[index - 1].total}",
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.white),
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
                          Get.toNamed(Routes.MAWB_DETAIL, arguments: {
                            'id': controller.listAwb[index].id,
                          });
                        },
                        child: MawbView(
                          awbModel: controller.listAwb[index],
                        ));
                  },
                  count: controller.listAwb.length,
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 20);
                  });
            })),
          ]),
        ),
        endDrawer: const FilterMawb());
  }
}
