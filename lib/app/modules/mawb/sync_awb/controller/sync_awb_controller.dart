import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vncss/app/data/repository/tracking_repository.dart';
import '../../../../core/base/base_controller.dart';
import '../../../../core/widget/dialog/app_snackbar.dart';
import '../../../../data/model/model/search_tracking.dart';
import '../../../../data/model/model/sync_awb.dart';
import '../../../../data/model/response/list_trackings_response.dart';
import '../../../../data/model/response/sync_awb_response.dart';
import '../../../../data/repository/sync_awb_repository.dart';


class SyncAwbController extends BaseController {
  final syncAwbRepo = Get.find<SyncAwbRepository>();
  final syncAwb = SyncAwb().obs;
  final code = TextEditingController().obs;
  final checkPermission = <bool>[].obs;
  final listSyncAwb = <String>[].obs;
  getSyncAwb() {
    callDataService<SyncAwbResponse>(
        syncAwbRepo.getSyncAwb(),
        onSuccess: (data) {
          syncAwb.value = data.syncAwb!;
          checkPermission.value =
              List.generate(syncAwb.value.notSynced!.length, (index) => false);        },
        onError: (error){
          print(error);
        }
    );
  }

  postSyncAwb() {
    callDataService(
        syncAwbRepo.postSyncAwb(payload: {
          "awbs": listSyncAwb,
        }), onSuccess: (_) {
      AppSnackBar.showUpdateSuccess(message: "Đồng bộ thành công");
    });
  }

  @override
  void onInit() {
    getSyncAwb();
    super.onInit();
  }

}
