import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:vncss/app/core/base/base_controller.dart';

import '../../../../core/widget/dialog/app_snackbar.dart';
import '../../../../data/model/model/customers.dart';
import '../../../../data/repository/customer_repository.dart';
import '../../../common_widget/const.dart';

class DetailCustomerController extends BaseController {

  final customerRepo = Get.find<CustomerRepository>();
  final customers = Customers().obs;
  String? date;
  TextEditingController birthday = TextEditingController();
  DateTime? selectedDates;

  final fullname = TextEditingController();
  final nickname = TextEditingController();
  final customIdController = TextEditingController();
  final email = TextEditingController();
  final address = TextEditingController();
  final phone = TextEditingController();
  final balance = TextEditingController();
  final creditAmount = TextEditingController();
  final note = TextEditingController();
  final password = TextEditingController();
  final passwordRetype = TextEditingController();
  final forConfigController = TextEditingController();
  final forSaleController = TextEditingController();
  final forCSKHController = TextEditingController();
  final gender = "".obs;
  var shippingCost;
  int? saleId;
  var customerServiceStaffId;

  Rxn<String> birthdayChoose = Rxn<String>();
  List<dynamic> tags = <dynamic>[].obs;

  int? id;
  
  checkGenderRadio(String gender) {
    switch (gender) {
      case "Nam":
        return 0;
      case "Nữ":
        return 1;
      default:
        return null;
    }
  }
  checkGender(var gender){
    switch (gender) {
      case 0:
        return "male";
      case 1:
        return "female";
      default:
        return null;
    }
  }

  @override
  void onInit() {
    id = argument['id'];
    getDetailCustomers();
    super.onInit();
  }
  updateDetailCustomers() {
    if (id == null) {
      showMessage("Lỗi id");
    }
    if(password.text == passwordRetype.text){
      callDataService(
          customerRepo.updateCustomerDetail(id: id!, payload: {
            "address": address.text.toString(),
            "balance": balance.text.toString(),
            "birthday": birthday.text == "--" ? "" : birthday.text.toString(),
            "customerId": customIdController.text.toString(),
            "creditAmount": creditAmount.text.toString(),
            "customerServiceStaffId": customerServiceStaffId.toString(),
            "email": email.text.toString(),
            "gender": gender.toString(),
            "name": fullname.text.toString(),
            "nickName": nickname.text.toString(),
            "note": note.text.toString(),
            "password": password.text.toString(),
            "phone": phone.text.toString(),
            "saleId": saleId,
            "shippingCost": shippingCost ?? "",
            "tagIds": tags.toList(),
          }), onSuccess: (_) {
        AppSnackBar.showUpdateSuccess(message: "Cập nhật thông tin thành công");
      });
    }
  }

  getDetailCustomers() {
    if (id == null) {
      showMessage("Lỗi id");
    }
    callDataService<Customers>(
        customerRepo.getCustomerDetail(id: id!), onSuccess: (data) {
      customers.value = data;
      fullname.text = data.name ?? "";
      birthday.text = Const.convertDateWithoutHour(data.birthday);
      nickname.text = data.nickName ?? "";
      email.text = data.email ?? "";
      customIdController.text = data.idCustomer ?? '';
      address.text = data.address ?? "";
      phone.text = data.phone ?? "";
      balance.text = data.balance ?? "";
      creditAmount.text = data.creditAmount!.toString();
      note.text = data.note ?? "";
      forSaleController.text = data.sale?.fullname ?? "";
      forCSKHController.text = data.customerServiceStaff?.fullname ?? "";
      saleId = data.sale?.id;
      customerServiceStaffId = data.customerServiceStaff?.id;
      gender.value = data.gender?.name ?? "";
    }, onError: (error) {
      showErrorMessage(error.toString());
    });
  }
}
