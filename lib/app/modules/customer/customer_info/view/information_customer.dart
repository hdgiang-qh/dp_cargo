import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../generated/l10n.dart';
import '../../../../core/base/base_view.dart';
import '../../../../core/enum/sex.dart';
import '../../../../core/utils/color_app.dart';
import '../../../../core/utils/converter_utils.dart';
import '../../../common_widget/const.dart';
import '../../../common_widget/item_detail_list_widget.dart';
import '../../../common_widget/item_list_widget.dart';
import '../../../util/images.dart';
import '../../customer_detail/controller/detail_customer_controller.dart';
import '../../customer_update/view/customer_update.dart';

class DetailCustomerInfo extends BaseView<DetailCustomerController> {
  Future<void> onRefreshPage() async {
    await controller.getDetailCustomers();
  }

  @override
  Widget body(BuildContext context) {
    return const InformationCustomerView();
  }
}

class InformationCustomerView extends StatefulWidget {
  const InformationCustomerView();

  @override
  State<InformationCustomerView> createState() =>
      _InformationCustomerViewState();
}

class _InformationCustomerViewState extends State<InformationCustomerView> {
  final controller = Get.find<DetailCustomerController>();

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Row(children: [
                    SvgPicture.asset(Images.file2),
                    const SizedBox(width: 8),
                    const Text(
                      "Thông tin khách hàng",
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w700),
                    )
                  ]),
                ),
                Obx(() {
                  return Container(
                    color: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Column(children: [
                      ItemDetailListWidget(
                        head: "Mã khách hàng:",
                        endText:
                        controller.customers.value.idCustomer ??
                            S.current.isNull,
                        fontWeight: true,
                      ),
                      ItemDetailListWidget(
                          head: "Họ và tên:",
                          endText:
                          controller.customers.value.name ?? S.current.isNull,
                          fontWeight: true),
                      ItemDetailListWidget(
                          head: "Nickname:",
                          endText:
                          controller.customers.value.nickName ??
                              S.current.isNull,
                          fontWeight: true),
                      ItemDetailListWidget(
                          head: "Email:",
                          endText:
                          controller.customers.value.email ?? S.current.isNull,
                          fontWeight: true),
                      ItemDetailListWidget(
                          head: "Địa chỉ:",
                          endText:
                          controller.customers.value.address ??
                              S.current.isNull,
                          fontWeight: true),
                      ItemDetailListWidget(
                          head: "Số điện thoại:",
                          endText: "${controller.customers.value.phone ??
                              S.current.isNull}",
                          fontWeight: true),
                      ItemDetailListWidget(
                          head: "Giới tính:",
                          endText: controller.customers.value.gender
                              .toString() == "null"
                              ? "--"
                              : controller.customers.value.gender!.title(context),
                          fontWeight: true),
                      ItemDetailListWidget(
                          head: "Ngày sinh:",
                          endText:
                          Const.convertDateWithoutHour(
                              controller.customers.value.birthday) ??
                              "Không có thông tin",
                          fontWeight: true),
                      ItemDetailListWidget(
                          head: "Công nợ:",
                          endText:
                          "${formatNumberCommas(
                              controller.customers.value.balance ?? "0")} đ",
                          fontWeight: true),
                      ItemDetailListWidget(
                          head: "Công nợ tối đa:",
                          endText:
                          "${formatNumberCommas(
                              "${controller.customers.value.creditAmount ??
                                  0}")} đ",
                          fontWeight: true),
                      ItemDetailListWidget(
                          head: "Sale phụ trách:",
                          endText:
                          controller.customers.value.sale?.fullname ?? "--",
                          fontWeight: true),
                      ItemDetailListWidget(
                          head: "Ghi chú:",
                          endText: controller.customers.value.note ?? "",
                          fontWeight: true),
                    ]),
                  );
                }),
              ]),
            ),
          ),
          InkWell(
            onTap: () {
              Get.to(() => CustomerUpdateScreen())?.then((_)async{
                await Future.delayed(Duration(milliseconds: 500),(){
                  controller.getDetailCustomers();
                });
              });
            },
            child: Container(
              height: 40,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(171, 59, 53, 1),
                  borderRadius: BorderRadius.circular(8)),
              child: const Text(
                "Cập nhật",
                style: TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
            ),
          )
        ]);
  }
}
