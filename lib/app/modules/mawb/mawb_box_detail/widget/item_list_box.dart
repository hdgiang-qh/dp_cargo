import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../generated/l10n.dart';
import '../../../../core/values/app_colors.dart';
import '../../../../data/model/model/awb.dart';
import '../../../../routes/app_pages.dart';
import '../../../common_widget/button_widget.dart';
import '../../../common_widget/const.dart';
import '../../../common_widget/item_detail_list_widget.dart';
import '../../mawb_detail/controller/mawb_detail_controller.dart';

class ItemListBox extends StatefulWidget {
  final BoxAwbDetail boxAwb;

  const ItemListBox({required this.boxAwb});

  @override
  State<ItemListBox> createState() => _ItemListBoxState();
}

class _ItemListBoxState extends State<ItemListBox> {
  final controller = Get.find<AWBDetailController>();
  String? valueChoose;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Column(children: [
          ItemDetailListWidget(
              head: "Trạng thái",
              endText: widget.boxAwb
                  .exploitStatus?.value ??
                  S.current.isNull,
              fontWeight: true),
          ItemDetailListWidget(
              head: "Mô tả",
              endText: widget.boxAwb.description ??
                  S.current.isNull,
              fontWeight: true),
          widget.boxAwb.warehouseVN?.length == 0 ||
              widget.boxAwb.exploitStatus?.value == "Đang vận chuyển về vn"
              ? Container(
            margin:
            EdgeInsets.symmetric(horizontal: 16),
            child: Obx(() {
              return Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Kho khai thác",
                        style: TextStyle(fontSize: 13)),
                    Container(
                      height: 40,
                      width: 150,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                          BorderRadius.circular(6),
                          border: Border.all(
                              color: Colors.black12)),
                      child: DropdownButton(
                          hint: Text("${widget.boxAwb.warehouseVN!.isEmpty ? "Chọn kho" : widget.boxAwb.warehouseVN![0].name}"),
                          value: valueChoose,
                          style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black),
                          isExpanded: true,
                          underline: const SizedBox(),
                          items: controller.listWareHouse
                              .map((valueItem) {
                            return DropdownMenuItem(
                                onTap: () {
                                  controller.idWarehouse.value =
                                      valueItem.id.toString();
                                  print(controller.idWarehouse.value);
                                },
                                value: valueItem.name,
                                child: Text("${valueItem.name}"));
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              valueChoose = newValue;
                            });
                          }),
                    ),
                  ]);
            }),
          )
              : ItemDetailListWidget(
              head: "Kho khai thác",
              endText:
              "${widget.boxAwb.warehouseVN?[0].name}",
              fontWeight: true),
          ItemDetailListWidget(
              head: "Ngày bắt đầu",
              endText: Const.convertDate(widget.boxAwb.exploitStartDate) ??
                  S.current.isNull,
              fontWeight: true),
          ItemDetailListWidget(
              head: "Ngày kết thúc",
              endText: Const.convertDate(widget.boxAwb.exploitEndDate) ??
                  S.current.isNull,
              fontWeight: true),

          checkStatus("${widget.boxAwb.exploitStatus?.value}") ==
              0
              ? ButtonWidget(
            onTap: () async {
              controller.importProducts(widget.boxAwb.id ?? 0);
              await Future.delayed(Duration(milliseconds: 500), () {
                controller.getMAWBDetail();
              });
            },
            buttonText: "Nhập hàng",
            textColor: Colors.white,
            bgcolor: AppColors.primary,
            margin:
            EdgeInsets.symmetric(horizontal: 16),
          )
              : checkStatus(
              "${widget.boxAwb.exploitStatus?.value}") ==
              1
              ? ButtonWidget(
            onTap: (){
              Get.toNamed(Routes.ADD_BOX_TRACKING,
                  arguments: {
                    'id': widget.boxAwb.id
                  });
            },
            buttonText: "Thêm tracking",
            textColor: Colors.white,
            bgcolor: AppColors.primary,
            margin: EdgeInsets.symmetric(
                horizontal: 16),
          )
              : SizedBox()
        ]));
  }

  checkStatus(String status) {
    switch (status) {
      case "Đang vận chuyển về vn":
        return 0;
      default:
        return 1;
    }
  }
}