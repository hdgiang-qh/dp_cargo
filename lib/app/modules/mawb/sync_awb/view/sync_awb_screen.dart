import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/base/base_view.dart';
import '../controller/sync_awb_controller.dart';
import '../widget/select_sync_awb.dart';
import '../widget/syncing_awb.dart';

class SyncAwbScreen extends StatefulWidget {
  const SyncAwbScreen({super.key});

  @override
  State<SyncAwbScreen> createState() => _SyncAwbScreenState();
}

class _SyncAwbScreenState extends State<SyncAwbScreen> with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);
    return Scaffold(
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
                  const Expanded(
                      child: Center(child: Text("Đồng bộ AWB", style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),))),
                ])),
            Expanded(
              child: Column(children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.black12)
                  ),
                  child: TabBar(
                      controller: _tabController,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      tabs: [
                        Tab(text: "Lựa chọn Awb",),
                        Tab(text: "Awb đang đồng bộ"),
                      ]),
                ),
                Expanded(
                  child: Container(
                    child: TabBarView(
                        controller: _tabController,
                        children: [
                          SelectSyncAwb(),
                          SyncingAwb()
                        ]),
                  ),
                )
              ]),
            ),
          ])
      ),
    );
  }
}
