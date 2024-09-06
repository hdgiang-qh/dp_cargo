import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vncss/app/data/repository/tracking_repository.dart';
import '../../../../core/base/base_controller.dart';
import '../../../../data/model/model/search_tracking.dart';
import '../../../../data/model/response/list_trackings_response.dart';


class SearchAwbTrackingController extends BaseController {
  final trackingRepo = Get.find<TrackingsRepository>();
  final listSearchTracking = <SearchTracking>[].obs;
  final code = TextEditingController().obs;

  getSearchTrackingList() {
    callDataService<SearchTrackingResponse>(
        trackingRepo.getListSearchTracking(
          code: code.value.text.toString(),
        ),
        onSuccess: (data) {
          listSearchTracking.value = data.listSearchTracking ?? [];
        },
        onError: (error){
          print(error);
        }
    );
  }

  onGetBarcode(){
    Get.back();
    getSearchTrackingList();
  }

  onChoose() {
    getSearchTrackingList();
  }
  onClear(){
    listSearchTracking.clear();
    code.value.clear();
  }

  @override
  void onInit() {
 //   getSearchTrackingList();
    super.onInit();
  }

}
