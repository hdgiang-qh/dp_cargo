import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../core/base/base_controller.dart';
import '../../../../core/widget/dialog/app_snackbar.dart';
import '../../../../data/model/model/awb.dart';
import '../../../../data/model/model/tracking.dart';
import '../../../../data/model/response/list_awb_response.dart';
import '../../../../data/repository/list_boxes_tracking_repository.dart';
import '../../../../data/repository/tracking_repository.dart';
import '../../../tracking/tracking_screen/controller/tracking_controller.dart';
import '../../mawb_detail/controller/mawb_detail_controller.dart';

class MawbBoxDetailController extends BaseController {
  final AWBController = Get.find<AWBDetailController>();
  final boxTrackingRepo = Get.find<ListBoxesTrackingRepository>();
  final trackingRepo = Get.find<TrackingsRepository>();
  final awbBox = AwbBoxData().obs;
  final trackingController = Get.find<TrackingController>();
  final idCustomer = 0.obs;
  TextEditingController customer = TextEditingController();
  TextEditingController codeTracking = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController price = TextEditingController();

  final exploitStatus = 0.obs;
  final code = "".obs;
  final checkEnable = true.obs;
  final searchCode = TextEditingController();

  int? id;

  int idStatus(String date){
    switch(date){
      case "Tất cả":
        return 0;
      case "Chờ nhập kho US":
        return 1;
      case "Đã nhập kho US":
        return 2;
      case "Đang vận chuyển về VN":
        return 3;
      case "Đã nhập kho VN":
        return 4;
      case "Đã khai thác":
        return 5;
      case "Đã đóng hàng":
        return 6;
      case "Đang giao hàng":
        return 7;
      case "Hoàn thành":
        return 8;
      case "Đã hủy bỏ":
        return 9;

    }
    return 0;
  }

  bool isNumeric(String input) {
    RegExp regex = RegExp(r'^[0-9]+$');
    return regex.hasMatch(input);
  }

  onSelected() {
    getAwbBoxTrackingDetail(
        exploitStatus: exploitStatus.value,
        code: code.value
    );
  }

  @override
  void onInit() {
    id = argument['id'];
    getAwbBoxTrackingDetail(
        exploitStatus: exploitStatus.value,
        code: code.value
    );
    super.onInit();
  }
  clear(){
    codeTracking.text = "";
    idCustomer.value = 0;
    customer.text = "";
    price.text = "";
    description.text = "";
  }
  checkStatus(String status){
    switch(status){
      case "Chờ nhập kho US":case "Đã nhập kho US":case "Đang vận chuyển về VN":
        return true;
      default:
        return false;
    }
  }

  createBoxTracking(List<Map<String, dynamic>> data) {

    callDataService(
        trackingRepo.createBoxTracking(id: id!, createFields: {
          "data": data,
        }), onSuccess: (_) {
      AppSnackBar.showUpdateSuccess(message: "Tạo tracking thành công");
      Future.delayed(Duration(milliseconds: 500),(){
        Get.back(result: true);
      });
    });
    clear();
  }
  void onSubmit() {

    List<Map<String, dynamic>> payload = [
      {
        "code": codeTracking.text,
        "customer": idCustomer.value == 0 ? "" : idCustomer.value,
        "price": price.text == "" ? 0 : price.text,
        "description": description.text,
      }
    ];
    bool isValid = trackingController.listCustomerName
        .any((item) =>"${item.nickName} | ${item.idCustomer} | ${item.name}" == customer.text);
    if(!isValid){
      AppSnackBar.showError(message: "Khách hàng không tồn tại");
    }else{
      for(int i = 0; i <trackingController.listTracking.length; i++){
        if(trackingController.listTracking[i].code == codeTracking.text){
          if(trackingController.listTracking[i].awb?.code == null){
            createBoxTracking(payload);
            break;
          }else{
            AppSnackBar.showError(message: "Tracking đã tồn tại");
          }
        }else{
          createBoxTracking(payload);
          break;
        }
      }
    }
    clear();
  }

  deleteBoxTracking(int? id) {
    callDataService(
        trackingRepo.deleteTracking(id: id), onSuccess: (_) {
      AppSnackBar.showUpdateSuccess(message: "Xóa tracking thành công");
    });
  }

  getAwbBoxTrackingDetail({
    int? exploitStatus,
    String? code
    }) async {
    if (id == null) {
      showMessage("Lỗi id");
    }
    callDataService<ListAWBDetailResponse>(
        boxTrackingRepo.getAwbBoxesTracking(
            id: id!,
            exploitStatus: exploitStatus == 0 ? 0 : exploitStatus,
            code: code == "" ? "" : code
        ), onSuccess: (data) {
      awbBox.value = data.listAwbDetail!;
    }, onError: (error) {
      showErrorMessage(error.toString());
    });
  }
}
