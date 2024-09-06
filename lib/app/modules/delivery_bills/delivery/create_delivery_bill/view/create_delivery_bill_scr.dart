import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:vncss/app/core/model/page_state.dart';
import 'package:vncss/app/core/widget/paging_view.dart';
import 'package:vncss/app/data/model/model/transaction.dart';
import 'package:vncss/app/modules/common_widget/button_widget.dart';
import 'package:vncss/app/modules/common_widget/const.dart';
import 'package:vncss/app/modules/common_widget/textfield_widget.dart';
import 'package:vncss/app/modules/delivery_bills/delivery/widget/skeletonizer_loading.dart';

import '../../../../../core/base/base_view.dart';
import '../../../../../data/model/model/delivery_bill.dart';
import '../../../../../routes/app_pages.dart';
import '../../../../common_widget/app_bar_widget.dart';
import '../../../../common_widget/item_small.dart';
import '../../../../common_widget/title_detail_list.dart';
import '../../../../transaction/controller/transaction_controller.dart';
import '../controller/create_delivery_bill_controller.dart';

class CreateDeliveryBillScr extends BaseView<CreateDeliveryController> {
  @override
  final controller = Get.find<CreateDeliveryController>();
  final controllerName = Get.find<TransactionController>();
  final GlobalKey<ScaffoldState> _scaffoldKeyAddBill =
      GlobalKey<ScaffoldState>();
  List<String> title = ["Được công nợ", "Free ship", "Thu tiền trước"];

  List<Color> colors = [ColorApp.blue00, ColorApp.green26, primaryColor];

  Widget buildTitle(int index) {
    return Row(
      children: [
        SvgPicture.asset(
          "assets/image/tag.svg",
          color: colors[index],
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          title[index],
          style: TextStyle(color: colors[index], fontSize: 12),
        )
      ],
    );
  }

  void _openDrawer() {
    _scaffoldKeyAddBill.currentState?.openEndDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKeyAddBill,
        body: SafeArea(
          child: Column(
            children: [
              AppBarWidget(
                title: "Tạo phiếu xuất kho",
                onBack: () => Get.back(),
                showFilter: true,
                onFilter: () {
                  _openDrawer();
                },
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [buildTitle(0), buildTitle(1), buildTitle(2)],
              ),
              const SizedBox(
                height: 8,
              ),
              Expanded(child: Obx(() {
                if (controller.isLoading.value == false &&
                    controller.listBillCreate.isEmpty) {
                  return SkeletonizerLoading(
                    loading: controller.isLoading.value,
                  );
                }
                return PagingView.separatedAddDelivery(
                    onLoadNextPage: () {
                      controller.onLoadNextPage();
                    },
                    onRefresh: () async {
                      controller.onRefreshPage();
                    },
                    isLoading: controller.pageState == PageState.LOADING,
                    builder: (context, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Column(
                          children: [
                            TitleDetailList(
                              headText: controller.listBillCreate[index].name,
                              svgPath: "assets/image/delivery_bill.svg",
                              showEnd: true,
                              svgPathEnd: "assets/image/pay.svg",
                              endText: controller
                                  .listBillCreate[index].formattedBalance,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 16),
                              color: Colors.white,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ItemSmall(
                                          svgPath: "assets/image/box1.svg",
                                          value:
                                              "${controller.listBillCreate[index].quantityTracking.toString()} tracking"),
                                      ItemSmall(
                                          svgPath: "assets/image/scale.svg",
                                          value: controller
                                              .listBillCreate[index]
                                              .formattedTotalFlyingWeight),
                                      ItemSmall(
                                          svgPath: "assets/image/coin.svg",
                                          value: controller
                                              .listBillCreate[index]
                                              .formattedMoneyTemporary),
                                    ],
                                  ),
                                  ButtonWidget(
                                    buttonText: "Tạo phiếu",
                                    bgcolor: primaryColor,
                                    width: 92,
                                    createDelivery: true,
                                    height: 92,
                                    textColor: ColorApp.whiteFA,
                                    onTap: () {
                                      Get.toNamed(
                                          Routes.CONFIRM_CREATE_DELIVERY_BILLS,
                                          arguments: {
                                            'id': controller
                                                .listBillCreate[index].id
                                          });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    count: controller.listBillCreate.length,
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 8.h);
                    });
              }))
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
                height: context.height - 150,
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
                        TypeAheadField<TransactionName>(
                          controller: controller.custom,
                          suggestionsCallback: (pattern) {
                            return controllerName.listTransactionName
                                .where((TransactionName item) =>
                                    "${item.idCustomer} | ${item.nickName} | ${item.name}"
                                        .toString()
                                        .toLowerCase()
                                        .contains(pattern.toLowerCase()))
                                .toList();
                          },
                          builder: (context, controller, focusNode) {
                            return AppTextInputField(
                              controller: controller,
                              focusNode: focusNode,
                              hint: "Nhập tên khách hàng",
                            );
                          },
                          itemBuilder: (context, suggestion) {
                            return ListTile(
                              title: Text(
                                "${suggestion.idCustomer} | ${suggestion.nickName} | ${suggestion.name}",
                                style: const TextStyle(fontSize: 13),
                              ),
                            );
                          },
                          onSelected: (suggestion) {
                            controller.custom.text =
                                "${suggestion.idCustomer} | ${suggestion.nickName} | ${suggestion.name}";
                            controller.customId = suggestion.id;
                          },
                          loadingBuilder: (context) => const Text('Loading...'),
                          errorBuilder: (context, error) =>
                              const Text('Error!'),
                          emptyBuilder: (context) =>
                              const Text('Không có dữ liệu phù hợp'),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ButtonWidget(
                              buttonText: "Thiết lập lại",
                              width: 140,
                              borderColor: primaryColor,
                              textColor: primaryColor,
                              onTap: () {
                                controller.custom.clear();
                                controller.onRefreshPage();
                                Get.back();
                              },
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            ButtonWidget(
                              buttonText: "Áp dụng",
                              width: 140,
                              bgcolor: primaryColor,
                              textColor: ColorApp.whiteFA,
                              onTap: () {
                                controller.onCreateBill();
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        )
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
