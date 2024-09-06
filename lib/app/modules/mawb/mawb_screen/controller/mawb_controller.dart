import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/base/base_controller.dart';
import '../../../../core/base/paging_controller.dart';
import '../../../../data/model/model/awb.dart';
import '../../../../data/model/response/list_awb_response.dart';
import '../../../../data/repository/awb_repository.dart';


class AWBController extends BaseController {
  final pagingController = PagingController<AWBModel>();
  final scrollController = ScrollController();

  final awbRepo = Get.find<AwbRepository>();
  final listAwb = <AWBModel>[].obs;
  var indexStatus = 0.obs;
  var currentIndex = 0.obs;
  var exploitStatus = 0.obs;

  TextEditingController awbCodeFilter = TextEditingController();
  TextEditingController trackingCodeFilter = TextEditingController();
  TextEditingController boxCodeFilter = TextEditingController();

  var warehouse = "".obs;

  final tittle = [
    "Tất cả",
    "Đang đồng bộ",
    "Đồng bộ thất bại ",
    "Đang vận chuyển về vn",
    "Đã vận chuyển về vn",
    "Đang khai thác",
    "Đã khai thác"
  ];
  final colors = [
    const Color(0xffb92f2e),
    const Color(0xFFB58A00),
    const Color(0xFF751414),
    const Color(0xFF70BBFD),
    const Color(0xFF3380FF),
    const Color(0xFF367A56),
    const Color(0xFF2D346F),
  ].obs;

  void changeStatusTracking(int newValue) {
    indexStatus.value = newValue;
  }

  void onTapStatus(int index) {
    currentIndex.value = index;
    exploitStatus.value = index;
    changeStatusTracking(exploitStatus.value);
    pagingController.initRefresh();
    onSelected();
  }

  void getListAwb({
    String? keyWords,
    String? boxCode,
    String? trackingCode,
    String? warehouse_id
    }) {
    if (!pagingController.canLoadNextPage()) return;
    pagingController.isLoadingPage = true;
    callDataService<ListAWBResponse>(
      awbRepo.getListAWB(
        page: pagingController.pageNumber,
        pageSize: 10,
        keyWords: keyWords ?? "",
        exploitStatus: exploitStatus.value,
        boxCode: boxCode ?? "",
        trackingCode: trackingCode ?? "",
          warehouse_id: warehouse_id ?? ""
      ),
      onSuccess: (data) {
        final repoList = data.awbs ?? [];
        if (_isLastPage(repoList.length, data.meta!.total!)) {
          pagingController.appendLastPage(repoList.cast<AWBModel>());
        } else {
          pagingController.appendPage(repoList.cast<AWBModel>());
        }
        var newList = [...pagingController.listItems];
        listAwb.value = newList;
      },
    );

    pagingController.isLoadingPage = false;
  }

  bool _isLastPage(int newListItemCount, int totalCount) {
    return (listAwb.length) >= totalCount;
  }

  clearFilter(){
    awbCodeFilter.clear();
    trackingCodeFilter.clear();
    boxCodeFilter.clear();
  }

  onSelected() {
    pagingController.initRefresh();
    listAwb.clear();
    getListAwb(
        keyWords: awbCodeFilter.text,
        boxCode: boxCodeFilter.text,
        trackingCode: trackingCodeFilter.text,
        warehouse_id: warehouse.value
    );
  }

  onRefreshPage() {
    pagingController.initRefresh();
    listAwb.clear();
    getListAwb(
        keyWords: awbCodeFilter.text,
        boxCode: boxCodeFilter.text,
        trackingCode: trackingCodeFilter.text,
        warehouse_id: warehouse.value
    );
  }

  onLoadNextPage() {
    logger.i("On load next");
    getListAwb();
  }

  @override
  void onInit() {
    getListAwb(
        keyWords: awbCodeFilter.text,
        boxCode: boxCodeFilter.text,
        trackingCode: trackingCodeFilter.text,
        warehouse_id: warehouse.value
    );
    onLoadNextPage();
    super.onInit();
  }
}