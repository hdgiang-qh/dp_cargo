import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/base/base_view.dart';
import '../controller/sync_awb_controller.dart';

class SyncingAwb extends BaseView<SyncAwbController> {
  @override
  Widget body(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black12)
      ),
      child: Column(
          children: [
            Row(children: [
              Text("Chọn các AWB cần đồng bộ",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight
                    .bold),)
            ]),
            Expanded(
              child: Obx(() {
                return controller.syncAwb.value.processing!.isEmpty
                    ?  SizedBox()
                    : ListView.builder(
                    itemCount: controller.syncAwb.value.notSynced?.length,
                    itemBuilder: (context, index) {
                    return Obx(() {
                      return Text(controller.syncAwb.value.processing![index]);
                      });
                    });
              }),
            ),
            Row()
          ]),
    );
  }
}
