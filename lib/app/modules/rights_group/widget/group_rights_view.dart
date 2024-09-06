import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vncss/app/modules/util/fake_data.dart';
import 'package:vncss/app/modules/util/images.dart';

import '../../../../app/data/model/model/box.dart';


class GroupRightsView extends StatefulWidget {
  const GroupRightsView({super.key});

  @override
  State<GroupRightsView> createState() => _GroupRightsViewState();
}

class _GroupRightsViewState extends State<GroupRightsView> {
  bool checkDropDown = false;
  List<String> listRights = ["Xác thực thông tin", "AWB", "Tracking", "Đơn hàng", "Phiếu xuất kho", "Vận đơn Việt Nam", "Thùng hàng trong vận đơn VN(Vận đơn con)", "Giao dịch", "Nhân viên", "Khách hàng", "Báo cáo", "Cấu hình", "Cms", "Khác"];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
            child: SvgPicture.asset(Images.person2),
          ),
          const Text("Danh sách quyền", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),)
        ]),
        ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: listRights.length,
            itemBuilder: (context, index){
              return InkWell(
                onTap: (){
                  showModalBottomSheet(
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
                      isDismissible: false,
                      context: context,
                      builder: (context){
                        return _BottomSheetView(nameRights: listRights[index],);
                      });
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(children: [
                        Container(
                            width: 300,
                            alignment: Alignment.centerLeft,
                            child: Text(listRights[index], style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)),
                        const SizedBox(height: 8),
                        Container(
                            width: 300,
                            alignment: Alignment.centerLeft,
                            child: const Text("3/5", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)))
                      ]),
                      const Icon(Icons.arrow_forward_ios, size: 20,)
                    ],
                  ),
                ),
              );
            }),
      ],
    );
  }
}
class _BottomSheetView extends StatefulWidget {
  final nameRights;
  const _BottomSheetView({
    super.key,
    required this.nameRights
  });

  @override
  State<_BottomSheetView> createState() => _BottomSheetViewState();
}

class _BottomSheetViewState extends State<_BottomSheetView> {
  List<String> getKey() {
    List<String> keys = [];
    for (var map in nameRightsString(widget.nameRights)) {
      for (var key in map.keys) {
        keys.add(key);
      }
    }
    return keys;
  }
  List<bool> boolList = List.generate(25, (index) => false);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(children: [
        Row(children: [
          Text(widget.nameRights, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
        ]),
        Expanded(
          child: ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: getKey().length,
              itemBuilder: (context, index){
                return Container(
                  decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.black26))
                  ),
                  child: CheckboxListTile(
                    title: Text(getKey()[index], style: const TextStyle(fontSize: 16),),
                    value: boolList[index],
                    onChanged: (bool? newValue){
                      setState(() {
                        boolList[index] = newValue!;
                      });
                    },
                    activeColor: Colors.orange,
                    checkColor: Colors.white,
                    tileColor: Colors.white,
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                );
              }),
        ),
      ]),
    );
  }
  List nameRightsString(String nameRight){
    List listItem=[];
    switch(nameRight){
      case "Xác thực thông tin":
        listItem = listRights().confirmInfList;
      case "AWB":
        listItem = listRights().AWB;
      case "Tracking":
        listItem = listRights().Tracking;
      case "Đơn hàng":
        listItem = listRights().Order;
      case "Phiếu xuất kho":
        listItem = listRights().PXK;
      case "Vận đơn Việt Nam":
        listItem = listRights().billOfLading;
      case "Thùng hàng trong vận đơn Việt Nam (Vận đơn con)":
        listItem = listRights().boxInBillOfLading;
      case "Giao dịch":
        listItem = listRights().transaction;
      case "Nhân viên":
        listItem = listRights().staff;
      case "Khách hàng":
        listItem = listRights().customer;
      case "Báo cáo":
        listItem = listRights().report;
      case "Cấu hình":
        listItem = listRights().config;
      case "Cms":
        listItem = listRights().cms;
      case "Khác":
        listItem = listRights().other;
    }
    return listItem;
  }
}


