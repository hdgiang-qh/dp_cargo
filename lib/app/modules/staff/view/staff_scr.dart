import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:vncss/app/core/model/page_state.dart';
import 'package:vncss/app/core/widget/paging_view.dart';
import 'package:vncss/app/data/model/model/staff.dart';
import 'package:vncss/app/modules/common_widget/button_widget.dart';
import 'package:vncss/app/modules/common_widget/const.dart';
import 'package:vncss/app/modules/common_widget/textfield_widget.dart';
import 'package:vncss/app/modules/delivery_bills/delivery/widget/skeletonizer_loading.dart';

import '../../../core/base/base_view.dart';
import '../../../routes/app_pages.dart';
import '../../common_widget/app_bar_widget.dart';
import '../../common_widget/item_detail_list_widget.dart';
import '../../common_widget/item_list_widget.dart';
import '../controller/staff_controller.dart';

class Staffs extends BaseView<StaffController> {
  final GlobalKey<ScaffoldState> _scaffoldKeys = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();

  void _openDrawer() {
    _scaffoldKeys.currentState?.openEndDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKeys,
        body: SafeArea(
          child: Column(
            children: [
              AppBarWidget(
                title: "Nhân viên",
                onBack: () {
                  Get.back();
                },
                showFilter: true,
                onFilter: () {
                  _openDrawer();
                },
              ),
              Gap(8.h),
              Expanded(child: Obx(() {
                if (controller.isLoading.value == false &&
                    controller.listStaff.isEmpty) {
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
                    scrollController: scrollController,
                    onLoadNextPage: () {
                      controller.onLoadNextPage();
                    },
                    onRefresh: () async {
                      controller.onRefreshPage();
                    },
                    isLoading: controller.pageState == PageState.LOADING,
                    builder: (context, index) {
                      return GestureDetector(
                        onTap: () async {
                          controller.listPhone = controller.listStaff
                              .map((item) => item.phone)
                              .toList();
                          final result = await Get.toNamed(Routes.DETAIL_STAFF,
                              arguments: {
                                'id': controller.listStaff[index].id,
                              });
                          if (result == true) {
                            Future.delayed(const Duration(milliseconds: 200),
                                () {
                              controller.onRefreshPage();
                            });
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ItemListWidget(
                                showIcon: true,
                                svgPath: "assets/image/person.svg",
                                headText: controller.listStaff[index].fullname
                                    .toString(),
                                showChip: true,
                                fontWeightHead: true,
                                endText: controller.listStaff[index].role!.name
                                    .toString(),
                                colorText: Colors.white,
                                color: controller.colorLevel(
                                    level:
                                        controller.listStaff[index].role!.id ??
                                            0),
                              ),
                              ItemDetailListWidget(
                                  head: "SĐT",
                                  endText: controller.listStaff[index].phone
                                      .toString()),
                              ItemDetailListWidget(
                                  head: "Email",
                                  endText: controller.listStaff[index].email
                                      .toString()),
                              ItemDetailListWidget(
                                  head: "Kho",
                                  endText: controller
                                          .listStaff[index].warehouseVN?.name
                                          .toString() ??
                                      "Tất cả"),
                            ],
                          ),
                        ),
                      );
                    },
                    count: controller.listStaff.length,
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 20.h);
                    });
              })),
              Gap(8.h),
              ButtonWidget(
                buttonText: "Thêm nhân viên",
                margin: const EdgeInsets.symmetric(horizontal: 16),
                bgcolor: primaryColor,
                textColor: ColorApp.whiteFA,
                onTap: () async {
                  controller.nameAdd.clear();
                  controller.phoneAdd.clear();
                  controller.emailAdd.clear();
                  controller.passAdd.clear();
                  controller.confirmPassAdd.clear();
                  controller.levelAdd.clear();
                  controller.warehouseAdd.clear();
                  controller.error.value = null;
                  final result = await Get.toNamed(Routes.ADD_STAFF);
                  if (result == true) {
                    Future.delayed(const Duration(milliseconds: 500), () {
                      controller.onRefreshPage();
                    });
                  }
                },
              ),
              Gap(8.h),
            ],
          ),
        ),
        endDrawer: Drawer(
          width: context.width * 0.9,
          child: ListView(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            children: <Widget>[
              const SizedBox(
                height: 150,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: primaryColor,
                  ),
                  child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'Bộ lọc tìm kiếm',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: ColorApp.whiteFA),
                      )),
                ),
              ),
              Container(
                height: context.height - 180,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Nhập thông tin",
                              style:
                                  TextStyle(fontSize: 16, color: textPrimary),
                            )),
                        AppTextInputField(
                          hint: "Tìm kiếm theo tên",
                          controller: controller.name,
                          textInputType: TextInputType.name,
                        ),
                        AppTextInputField(
                          hint: "Tìm kiếm theo SĐT",
                          controller: controller.phone,
                          textInputType: TextInputType.phone,
                        ),
                        AppTextInputField(
                          hint: "Tìm kiếm theo mail",
                          controller: controller.email,
                          textInputType: TextInputType.emailAddress,
                        ),
                        TypeAheadField<StaffRoleName>(
                          controller: controller.values,
                          suggestionsCallback: (pattern) {
                            return controller.listStaffRoleName;
                          },
                          builder: (context, controller, focusNode) {
                            return AppTextInputField(
                              controller: controller,
                              focusNode: focusNode,
                              hint: "Chọn quyền",
                              showSuffix: true,
                              readOnly: true,
                              suffixPath: "assets/image/drop.svg",
                            );
                          },
                          itemBuilder: (context, suggestion) {
                            return ListTile(
                              title: Text(suggestion.name.toString()),
                            );
                          },
                          onSelected: (suggestion) {
                            controller.values.text = suggestion.name.toString();
                            controller.role.value = suggestion.id.toString();
                          },
                          loadingBuilder: (context) => const Text('Loading...'),
                          errorBuilder: (context, error) =>
                              const Text('Error!'),
                          emptyBuilder: (context) =>
                              const Text('Không có dữ liệu phù hợp'),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: ButtonWidget(
                            buttonText: "Thiết lập lại",
                            borderColor: primaryColor,
                            textColor: primaryColor,
                            onTap: () {
                              controller.onClearValue();
                              Get.back();
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: ButtonWidget(
                            buttonText: "Áp dụng",
                            bgcolor: primaryColor,
                            borderColor: primaryColor,
                            textColor: ColorApp.whiteFA,
                            onTap: () {
                              controller.onSelected();
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
