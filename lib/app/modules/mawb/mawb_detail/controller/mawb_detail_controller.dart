import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../core/base/base_controller.dart';
import '../../../../core/widget/dialog/app_snackbar.dart';
import '../../../../data/model/model/awb.dart';
import '../../../../data/model/model/tracking.dart';
import '../../../../data/model/model/warehouse.dart';
import '../../../../data/model/response/report_response.dart';
import '../../../../data/repository/awb_repository.dart';
import '../../../../data/repository/tracking_repository.dart';


class AWBDetailController extends BaseController {
  final awbRepo = Get.find<AwbRepository>();
  final awb = AwbDetailModel().obs;
  final listWareHouse = <WareHouse>[].obs;
  final trackings = Trackings().obs;
  final awbBox = AwbBoxData().obs;
  final listAwbTracking = <AwbTrackings>[].obs;
  final trackingRepo = Get.find<TrackingsRepository>();
  final code = TextEditingController().obs;
  final checkEnable = true.obs;
  final idWarehouse = "".obs;
  final nameWarehouse = "".obs;
  final nameType = Rxn<String>();


  int? id;

  @override
  void onInit() async {
    id = argument['id'];
    getWareHouse();
    getMAWBDetail();
    await Future.delayed(Duration(seconds: 1), () {
      getDetailAwbBox();
    });
    super.onInit();
  }


  getWareHouse({String? keyword,}) {
    callDataService<ListWarehouseResponse>(
      awbRepo.getWareHouse(),
      onSuccess: (data) {
        listWareHouse.value = data.listWarehouse ?? [];
      },
    );
  }

  void importProducts(int idBox) {
    callDataService(
        awbRepo.importProducts(id: idBox, updateFields: {
          "idWarehouse": idWarehouse.value,
        }), onSuccess: (_) {
          AppSnackBar.showUpdateSuccess(message: "Nhập hàng thành công");
    }, onError: (error){
      showErrorMessage(error.toString());
    });
  }

  getMAWBDetail() {
    if (id == null) {
      showMessage("Lỗi id");
    }
    callDataService<AwbDetailModel>(
        awbRepo.getAwbDetail(id: id!), onSuccess: (data) {
      awb.value = data;
      // listMerge.add(Merge(code: data.))
    }, onError: (error) {
      showErrorMessage(error.toString());
    });
  }

  onReload() {
    getMAWBDetail();
  }

  getDetailAwbBox() {
    for (int i = 0; i < awb.value.box!.length; i++) {
      callDataService<AwbBoxData>(
          awbRepo.getDetailAwbBox(id: awb.value.box?[i].id ?? 0),
          onSuccess: (data) async {
            await Future.delayed(Duration(milliseconds: 1), () {
              awbBox.value = data;
              idWarehouse.value =
                  data.boxInfo?.warehouseVN?.id.toString() ?? "";
              nameWarehouse.value =
                  data.boxInfo?.warehouseVN?.name.toString() ?? "";
              listAwbTracking.addAll(data.trackings ?? []);
            });
          }, onError: (error) {
        showErrorMessage(error.toString());
      });
    }
  }
}
