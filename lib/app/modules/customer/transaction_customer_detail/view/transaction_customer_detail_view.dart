import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../generated/l10n.dart';
import '../../../../core/base/base_view.dart';
import '../../../../core/utils/converter_utils.dart';
import '../../../common_widget/const.dart';
import '../../../common_widget/item_list_widget.dart';
import '../../../util/images.dart';
import '../controller/transaction_customer_detail_controller.dart';

class TransactionCustomerDetail extends BaseView<TransactionCustomerDetailController> {
  Future<void> onRefreshPage() async {
    await controller.getTransactionCustomerDetail();
  }

  @override
  Widget body(BuildContext context) {
    return const TransactionCustomerDetailView();
  }
}

class TransactionCustomerDetailView extends StatefulWidget {
  const TransactionCustomerDetailView();

  @override
  State<TransactionCustomerDetailView> createState() => _TransactionCustomerDetailViewState();
}

class _TransactionCustomerDetailViewState extends State<TransactionCustomerDetailView> {
  final controller = Get.find<TransactionCustomerDetailController>();
  @override
  Widget build(BuildContext context) {
    return Obx((){
      return  controller.transactionCustomerDetail.isEmpty
          ? Center(child: Text("Chưa có giao dịch"))
          : Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: controller.transactionCustomerDetail.length,
                  itemBuilder: (context, index){
                    return Container(
                      color: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Column(children: [
                        ItemListWidget(
                            headText: "${controller.transactionCustomerDetail[index].id ?? S.current.isNull}",
                            svgPath: Images.copy,
                            showIcon: true,
                            showChip: true,
                            fontWeightHead: true,
                            colorText: controller.transactionCustomerDetail[index].status?.color,
                            color: controller.transactionCustomerDetail[index].status?.colorBg,
                            endText: "${controller.transactionCustomerDetail[index].status?.title ?? S.current.isNull}"
                        ),
                        ItemListWidget(
                          headText: "Khách hàng",
                          endText: "${controller.transactionCustomerDetail[index].customer?[0]?.name}",
                        ),
                        ItemListWidget(
                          headText: "Loại giao dịch",
                          endText: "${controller.transactionCustomerDetail[index].customerTransactionType}",
                        ),
                        ItemListWidget(
                          headText: "Số tiền GD",
                          endText: "${formatNumberCommas(controller.transactionCustomerDetail[index].customerTransactionMoney ?? "0")}đ",
                        ),
                        ItemListWidget(
                          headText: "Số dư sau GD",
                          endText: "${formatNumberCommas(controller.transactionCustomerDetail[index].customerTransactionBalance ?? "0")}đ",
                        ),
                        ItemListWidget(
                          headText: "Ngày tạo",
                          endText: "${Const.convertDate(controller.transactionCustomerDetail[index].createdAt)}",
                        ),
                        ItemListWidget(
                          headText: "Ngày cập nhật",
                          endText: "${Const.convertDate(controller.transactionCustomerDetail[index].updatedAt)}",
                        ),
                        ItemListWidget(
                          headText: "Ghi chú",
                          endText: "${controller.transactionCustomerDetail[index].customerTransactionNote ?? S.current.isNull}",

                        ),
                      ]),
                    );
                  }
              ),
            ),
          ]);
    });
  }
}
