import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:vncss/app/modules/common_widget/button_widget.dart';
import 'package:vncss/app/modules/common_widget/const.dart';
import 'package:vncss/app/modules/common_widget/textfield_widget.dart';
import 'package:vncss/app/modules/report/view/report_warehouse_detail.dart';

import '../../../../generated/l10n.dart';
import '../../../core/base/base_view.dart';
import '../../../core/enum/tracking_report_build.dart';
import '../../../core/model/page_state.dart';
import '../../../core/widget/dialog/app_snackbar.dart';
import '../../../core/widget/paging_view.dart';
import '../../../data/model/model/report_model.dart';
import '../../../data/model/model/warehouse.dart';
import '../../../routes/app_pages.dart';
import '../../common_widget/app_bar_widget.dart';
import '../../common_widget/item_detail_list_widget.dart';
import '../../common_widget/title_detail_list.dart';
import '../../main/controllers/main_controller.dart';
import '../controller/report_controller.dart';

class Report extends BaseView<ReportController> {
  final int indexReport;

  Report({required this.indexReport});

  final GlobalKey<ScaffoldState> _scaffoldKeyReport =
      GlobalKey<ScaffoldState>();

  final controllerMain = Get.find<MainController>();
  final scrollController = ScrollController();

  void _openDrawer() {
    _scaffoldKeyReport.currentState?.openEndDrawer();
  }

  Widget buildReportWarehouse({required int index}) {
    return Obx(() {
      return Column(
        children: [
          const TitleDetailList(
            svgPath: "assets/image/bag.svg",
            headText: "Thông tin doanh thu kho khai thác",
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                ItemDetailListWidget(
                    head: "Kho:",
                    fontWeight: true,
                    endText:
                        controller.listReportWarehouse[index].name.toString()),
                ItemDetailListWidget(
                    head: "Phiếu xuất kho:",
                    fontWeight: true,
                    endText: controller
                        .listReportWarehouse[index].deliveryBillCount
                        .toString()),
                ItemDetailListWidget(
                    head: "Tổng TLKT:",
                    fontWeight: true,
                    endText: controller.listReportWarehouse[index]
                        .formattedTrackingMiningWeight),
                ItemDetailListWidget(
                    head: "Tổng TLTT:",
                    fontWeight: true,
                    endText: controller.listReportWarehouse[index]
                        .formattedTrackingCalculationWeight),
                ItemDetailListWidget(
                    head: "Giá trung bình:",
                    fontWeight: true,
                    endText:
                        "${controller.listReportWarehouse[index].formattedAvg}/kg"),
                ItemDetailListWidget(
                    head: "Tổng tiền:",
                    fontWeight: true,
                    endText: controller.listReportWarehouse[index]
                        .formattedTrackingTotalMoney),
                ButtonWidget(
                  buttonText: "Chi tiết",
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  bgcolor: primaryColor,
                  onTap: () {
                    Get.toNamed(Routes.REPORT_WAREHOUSE_DETAIL, arguments: {
                      "id": (index + 1).toString(),
                      "fromDate": controller.fromDateChoose.value == null
                          ? controller.fromDate.toIso8601String()
                          : controller.fromDateChoose.value
                              ?.toUtc()
                              .toIso8601String(),
                      "toDate": controller.toDateChoose.value == null
                          ? controller.toDate.toIso8601String()
                          : controller.toDateChoose.value
                              ?.toUtc()
                              .toIso8601String(),
                      "idWarehouse": controller.warehouseId.value.toString(),
                      'nameWh': controller.listReportWarehouse[index].name
                    });
                  },
                  textColor: ColorApp.whiteFA,
                )
              ],
            ),
          )
        ],
      );
    });
  }

  Widget buildReportBill({required int index}) {
    return controller.indexReport.value == 0
        ? Obx(() {
            return Column(
              children: [
                TitleDetailList(
                  svgPath: "assets/image/bag.svg",
                  headText: controller.listBillSale[index].fullname.toString(),
                ),
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    children: [
                      ItemDetailListWidget(
                          head: "Kho:",
                          fontWeight: true,
                          endText: controller
                              .listBillSale[index].formattedWarehouseName),
                      ItemDetailListWidget(
                          head: "Số lượng PXK:",
                          fontWeight: true,
                          endText: controller
                              .listBillSale[index].deliveryBillCount
                              .toString()),
                      ItemDetailListWidget(
                          head: "Tổng TLKT:",
                          fontWeight: true,
                          endText: controller.listBillSale[index]
                              .formattedTrackingMiningWeight),
                      ItemDetailListWidget(
                          head: "Tổng TLTT:",
                          fontWeight: true,
                          endText: controller.listBillSale[index]
                              .formattedTrackingCalculationWeight),
                      ItemDetailListWidget(
                          head: "Tổng tiền:",
                          fontWeight: true,
                          endText: controller
                              .listBillSale[index].formattedTrackingTotalMoney),
                      ButtonWidget(
                        buttonText: "Chi tiết",
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        bgcolor: primaryColor,
                        onTap: () {
                          Get.toNamed(Routes.REPORT_BILL_SALE, arguments: {
                            "id": controller.listBillSale[index].id.toString(),
                            "fromDate": controller.fromDateChoose.value == null
                                ? controller.fromDate.toIso8601String()
                                : controller.fromDateChoose.value
                                    ?.toUtc()
                                    .toIso8601String(),
                            "toDate": controller.toDateChoose.value == null
                                ? controller.toDate.toIso8601String()
                                : controller.toDateChoose.value
                                    ?.toUtc()
                                    .toIso8601String()
                          });
                        },
                        textColor: ColorApp.whiteFA,
                      )
                    ],
                  ),
                )
              ],
            );
          })
        : buildReportBillCustom(index: index);
  }

  Widget buildReportBillCustom({required int index}) {
    return Obx(() {
      return Column(
        children: [
          TitleDetailList(
            svgPath: "assets/image/person.svg",
            headText: controller.listBillCustom[index].name.toString(),
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                ItemDetailListWidget(
                    head: "Nickname:",
                    fontWeight: true,
                    endText: controller.listBillCustom[index].nickName ??
                        S.current.update),
                ItemDetailListWidget(
                    head: "Sale:",
                    fontWeight: true,
                    endText: controller.listBillCustom[index].saleName ??
                        S.current.update),
                ItemDetailListWidget(
                    head: "Số lượng PXK:",
                    fontWeight: true,
                    endText: controller.listBillCustom[index].deliveryBillCount
                        .toString()),
                ItemDetailListWidget(
                    head: "Tổng TLKT:",
                    fontWeight: true,
                    endText: controller
                        .listBillCustom[index].formattedTrackingMiningWeight),
                ItemDetailListWidget(
                    head: "Tổng TLTT:",
                    fontWeight: true,
                    endText: controller.listBillCustom[index]
                        .formattedTrackingCalculationWeight),
                ItemDetailListWidget(
                    head: "Tổng tiền:",
                    fontWeight: true,
                    endText: controller
                        .listBillCustom[index].formattedTrackingTotalMoney),
              ],
            ),
          )
        ],
      );
    });
  }

  Widget buildAwb({required int index}) {
    return Obx(() {
      return Column(
        children: [
          const TitleDetailList(
            svgPath: "assets/image/bag.svg",
            headText: "Thông tin doanh thu AWB",
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                ItemDetailListWidget(
                    head: "Trạng thái:",
                    fontWeight: true,
                    endText: controller.listAwb[index].exploitStatus.toString()),
                ItemDetailListWidget(
                    head: "Mã AWB:",
                    align: true,
                    fontWeight: true,
                    endText: controller.listAwb[index].code.toString()),
                ItemDetailListWidget(
                    head: "SL thùng:",
                    fontWeight: true,
                    endText: controller.listAwb[index].boxesCount.toString()),
                ItemDetailListWidget(
                    head: "SL Tracking:",
                    fontWeight: true,
                    endText:
                        controller.listAwb[index].trackingCount.toString()),
                ItemDetailListWidget(
                    head: "TLKT/TLTT:",
                    fontWeight: true,
                    endText: controller.listAwb[index].formattedTwo),
                ItemDetailListWidget(
                    head: "Tổng tiền:",
                    fontWeight: true,
                    endText:
                        controller.listAwb[index].formattedTrackingTotalMoney),
              ],
            ),
          )
        ],
      );
    });
  }

  Widget buildReportChart() {
    return Obx(() {
      return Column(
        children: [
          Gap(8.h),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Tổng doanh thu",
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(controller.listChartValue.value.formattedTotalMoney,
                        style: const TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w700))
                  ],
                ),
                Container(
                  decoration: const BoxDecoration(),
                  child: Transform.scale(
                      scale: 1.0,
                      child: SvgPicture.asset("assets/image/chart.svg")),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Thời gian trung bình xử lý 1 tracking",
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                        controller
                            .listChartValue.value.formattedAvgProcessingTime,
                        style: const TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w700))
                  ],
                ),
                Container(
                  decoration: const BoxDecoration(),
                  child: Transform.scale(
                      scale: 1.0,
                      child: SvgPicture.asset("assets/image/chart.svg")),
                ),
              ],
            ),
          ),
          Gap(8.h),
          SfCartesianChart(
              primaryXAxis: const CategoryAxis(
                labelRotation: -30,
                interval: 1,
                labelStyle: TextStyle(fontSize: 9),
              ),
              primaryYAxis: const NumericAxis(
                labelStyle: TextStyle(
                  fontSize: 10,
                ),
                majorGridLines: MajorGridLines(width: 0.5),
                axisLine: AxisLine(width: 0),
              ),
              legend: Legend(
                isVisible: false,
                position: LegendPosition.bottom,
                legendItemBuilder:
                    (String name, dynamic series, dynamic point, int index) {
                  return Text(controller.data[index].day);
                },
              ),
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <CartesianSeries<TrackingData, String>>[
                ColumnSeries<TrackingData, String>(
                    dataSource: controller.data,
                    xValueMapper: (TrackingData tracking, _) => tracking.day,
                    yValueMapper: (TrackingData tracking, _) => tracking.value,
                    name: "Trackings",
                    color: Colors.blue,
                    width: 0.5,
                    dataLabelSettings:
                        const DataLabelSettings(isVisible: false))
              ]),
        ],
      );
    });
  }

  Widget buildExploitation({required int index}) {
    return Obx(() {
      return Column(
        children: [
          TitleDetailList(
            svgPath: "assets/image/person.svg",
            headText: controller.listExploitation[index].fullname.toString(),
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                ItemDetailListWidget(
                    head: "STT:",
                    fontWeight: true,
                    endText: (index + 1).toString()),
                ItemDetailListWidget(
                    head: "Tổng số đơn khai thác:",
                    fontWeight: true,
                    endText: controller
                        .listExploitation[index].deliveryBillCount
                        .toString()),
                ItemDetailListWidget(
                    head: "Tổng TL đã khai thác:",
                    fontWeight: true,
                    endText: controller
                        .listExploitation[index].formattedTrackingMiningWeight),
              ],
            ),
          )
        ],
      );
    });
  }

  Widget buildCommon({required int index}) {
    return indexReport == 0
        ? buildReportWarehouse(index: index)
        : indexReport == 1
            ? buildReportBill(index: index)
            : indexReport == 2
                ? buildAwb(index: index)
                : indexReport == 3
                    ? buildReportChart()
                    : buildExploitation(index: index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKeyReport,
        body: SafeArea(
          child: Obx(() {
            return Column(
              children: [
                AppBarWidget(
                  title: controller.reportTitle(index: indexReport),
                  onBack: () {
                    controller.onClearValue();
                    controller.isLoading.value= false;
                    Get.back();
                  },
                  showFilter: true,
                  onFilter: () {
                    _openDrawer();
                  },
                ),
                Gap(8.h),
                Expanded(
                    child: PagingView.builder(
                        scrollController: scrollController,
                        onLoadNextPage: () {
                          controller.onLoadNextPage();
                        },
                        onRefresh: () async {
                          await controller.onSelectedV();
                        },
                        isLoading: controller.pageState == PageState.LOADING,
                        builder: (context, index) {
                          return Column(
                            children: [buildCommon(index: index), Gap(8.h)],
                          );
                        },
                        count: controller.buildLength(
                            index: indexReport,
                            indexDelivery: controller.indexReport.value))),
                Gap(8.h),
              ],
            );
          }),
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
                            child: const Text(
                              "Chọn thông tin",
                              style: TextStyle(fontSize: 16),
                            )),
                        AppTextInputField(
                          controller: controller.date,
                          //  label: "Chọn thời gian thống kê",
                          // showLabel: true,
                          hint: "Ngày",
                          showSuffix: true,
                          readOnly: true,
                          suffixPath: "assets/image/calendar.svg",
                          onSuffix: () async {
                            showDateRangePicker(
                                confirmText: "Lưu",
                                cancelText: "Huỷ",
                                context: context,
                                initialDateRange: controller.selectedDates,
                                firstDate: DateTime(2020),
                                lastDate: DateTime(2030),
                                builder: (context, child) {
                                  return Theme(
                                      data: ThemeData(), child: child!);
                                }).then((value) {
                              if (value != null) {
                                controller.fromDateChoose.value = value.start;
                                controller.toDateChoose.value = value.end;
                                controller.startDate =
                                    value.start.toDateTimeStringWithoutHour();
                                controller.endDate =
                                    value.end.toDateTimeStringWithoutHour();
                                controller.date.text =
                                    "${controller.startDate} - ${controller.endDate}";
                              }
                            });
                          },
                        ),
                        Gap(8.h),
                        indexReport == 0 || indexReport == 1 || indexReport == 2
                            ? Obx(() {
                                return Column(
                                  children: [
                                    Container(
                                      height: 48,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              width: 0.5,
                                              color: ColorApp.greyD7),
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      child: DropdownButton(
                                        hint: Text(
                                          controllerMain.warehouseId == 1
                                              ? "DP-HCM"
                                              : controllerMain.warehouseId == 2
                                                  ? "DP-HN"
                                                  : "Kho khai thác",
                                          style: const TextStyle(fontSize: 13),
                                        ),
                                        underline: Container(),
                                        isExpanded: true,
                                        icon: const Icon(Icons.expand_more),
                                        value:
                                            controller.selectedWareHouse.value,
                                        items: controller.listWareHouse
                                            .map<DropdownMenuItem<WareHouse>>(
                                                (e) =>
                                                    DropdownMenuItem<WareHouse>(
                                                      value: e,
                                                      child: Text(e.name ?? ""),
                                                    ))
                                            .toList(),
                                        onChanged: controllerMain.warehouseId ==
                                                0
                                            ? (WareHouse? category) {
                                                controller
                                                    .updateWareHouse(category);
                                              }
                                            : null,
                                      ),
                                    ),
                                    Gap(16.h)
                                  ],
                                );
                              })
                            : const SizedBox(),
                        indexReport == 1
                            ? Obx(() {
                                return Column(
                                  children: [
                                    Container(
                                      height: 48,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              width: 0.5,
                                              color: ColorApp.greyD7),
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      child: DropdownButton<TrackingReportBill>(
                                        hint: const Text(
                                          "Theo tăng dần/giảm dần",
                                          style: TextStyle(fontSize: 13),
                                        ),
                                        underline: Container(),
                                        isExpanded: true,
                                        icon: const Icon(Icons.expand_more),
                                        value:
                                            controller.trackingReportBill.value,
                                        items: TrackingReportBill.values
                                            .map<
                                                DropdownMenuItem<
                                                    TrackingReportBill>>((e) =>
                                                DropdownMenuItem<
                                                    TrackingReportBill>(
                                                  value: e,
                                                  child: Text(e.title),
                                                ))
                                            .toList(),
                                        onChanged:
                                            (TrackingReportBill? category) {
                                          controller.updateTrackingReportBill(
                                              category);
                                        },
                                      ),
                                    ),
                                    Gap(16.h),
                                    ButtonWidget(
                                      buttonText: "Nhân viên sale",
                                      borderColor: primaryColor,
                                      bgcolor: controller.indexReport.value == 0
                                          ? primaryColor
                                          : Colors.white,
                                      textColor:
                                          controller.indexReport.value == 0
                                              ? ColorApp.whiteFA
                                              : primaryColor,
                                      onTap: () {
                                        controller.onTapSale();
                                      },
                                    ),
                                    Gap(16.h),
                                    ButtonWidget(
                                      buttonText: "Khách hàng",
                                      borderColor: primaryColor,
                                      bgcolor: controller.indexReport.value == 1
                                          ? primaryColor
                                          : Colors.white,
                                      textColor:
                                          controller.indexReport.value == 1
                                              ? ColorApp.whiteFA
                                              : primaryColor,
                                      onTap: () {
                                        controller.onTapCustom();
                                      },
                                    ),
                                  ],
                                );
                              })
                            : const SizedBox(),
                        indexReport == 4
                            ? TypeAheadField<ExploitationEmployee>(
                                controller: controller.nameStaff,
                                suggestionsCallback: (pattern) {
                                  return controller.listExploitationEmployee
                                      .where((ExploitationEmployee item) => "${item.fullname}"
                                          .toString()
                                          .toLowerCase()
                                          .contains(pattern.toLowerCase()))
                                      .toList();
                                },
                                builder: (context, controller, focusNode) {
                                  return AppTextInputField(
                                    controller: controller,
                                    focusNode: focusNode,
                                    hint: "Tìm theo tên nhân viên",
                                  );
                                },
                                itemBuilder: (context, suggestion) {
                                  return ListTile(
                                    title: Text(
                                      suggestion.fullname.toString(),
                                      style: const TextStyle(fontSize: 13),
                                    ),
                                  );
                                },
                                onSelected: (suggestion) {
                                  controller.nameStaff.text =
                                      suggestion.fullname.toString();
                                  controller.employeeId.value =
                                      suggestion.id.toString();
                                },
                                loadingBuilder: (context) =>
                                    const Text('Loading...'),
                                errorBuilder: (context, error) =>
                                    const Text('Error!'),
                                emptyBuilder: (context) =>
                                    const Text('Không có dữ liệu phù hợp'),
                              )
                            : const SizedBox()
                      ],
                    ),
                    Column(
                      children: [
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
                                textColor: ColorApp.whiteFA,
                                onTap: () async {
                                  if(indexReport == 4){
                                    bool isValid = controller.listExploitationEmployee.any((item) =>
                                    item.fullname?.toLowerCase() ==
                                        controller.nameStaff.text.toLowerCase());
                                    if(!isValid){
                                      AppSnackBar.showIsEmpty(message: "Tên nhân viên không tồn tại");
                                      controller.nameStaff.clear();
                                    } else{
                                      for (int i = 0; i < controller.listExploitationEmployee.length; i++) {
                                        var item = controller.listExploitationEmployee[i];
                                        if (item.fullname?.toLowerCase() ==
                                            controller.nameStaff.text.toLowerCase()) {
                                          controller.employeeId.value =
                                              item.id.toString();
                                          break;
                                        }
                                      }
                                      controller.onSelected();
                                      Get.back();
                                    }
                                  } else{
                                    controller.onSelected();
                                    Get.back();
                                  }

                                },
                              ),
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
