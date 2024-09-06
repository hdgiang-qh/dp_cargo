import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vncss/app/core/widget/dialog/app_snackbar.dart';

import '../../../../core/base/base_controller.dart';
import '../../../../core/base/paging_controller.dart';
import '../../../../data/model/model/customers.dart';
import '../../../../data/model/model/data_customers.dart';
import '../../../../data/model/model/overview.dart';
import '../../../../data/model/model/sale_employee.dart';
import '../../../../data/model/response/list_customer_response.dart';
import '../../../../data/model/response/list_sale_employee.dart';
import '../../../../data/model/response/list_transaction_response.dart';
import '../../../../data/model/response/overview_response.dart';
import '../../../../data/repository/customer_repository.dart';
import '../../../../data/repository/overview_repository.dart';
import '../../../../data/repository/staff_repository.dart';

class CustomerController extends BaseController {
  final pagingController = PagingController<DataCustomers>();
  final scrollController = ScrollController();

  final orderByFilter = "Tất cả".obs;
  final customerFilter = TextEditingController();
  final nicknameFilter = TextEditingController();
  final saleFilter = TextEditingController();
  final isDebt = false.obs;
  final undefinedSale = false.obs;
  final isCard = false.obs;
  final isBlocked = false.obs;

  final customers = Customers().obs;
  String? date;
  TextEditingController birthday = TextEditingController();
  DateTime? selectedDates;

  final fullnameController = TextEditingController();
  final nicknameController = TextEditingController();
  final customIdController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();
  final creditAmountController = TextEditingController();
  final noteController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordRetypeController = TextEditingController();

  final forConfigController = TextEditingController();
  final forSaleController = TextEditingController();
  final forCSKHController = TextEditingController();
  var gender;
  var shippingCost = 0.obs;
  var saleId = 1.obs;
  var customerServiceStaffId;
  int? creditAmount;
  Rxn<String> birthdayChoose = Rxn<String>();
  List<dynamic> tags = <dynamic>[].obs;

  final customerRepo = Get.find<CustomerRepository>();
  final saleRepo = Get.find<StaffRepository>();
  final listDataCustomer = <DataCustomers>[].obs;
  final listSaleName = <SaleEmployee>[].obs;
  final listCSKHName = <SaleEmployee>[].obs;
  final listEmployeeName = <SaleEmployee>[].obs;
  var idSaleEmployeeFilter = "".obs;

  var indexStatus = 0.obs;
  var currentIndex = 0.obs;
  var orderBy = "".obs;
  var warehouse = "".obs;

  var idSaleEmployee = "".obs;

  List<String> items = [
    "Tất cả",
    "Công nợ tối đa tăng dần",
    "Công nợ tối đa giảm dần",
    "Công nợ tăng dần",
    "Công nợ giảm dần",
    "Thời gian tạo cũ nhất",
    "Thời gian tạo mới nhất"
  ].obs;

  int checkGenderRadio(String gender) {
    switch (gender) {
      case "male":
        return 0;
      case "female":
        return 1;
      default:
        return 2;
    }
  }

  String checkGender(int gender) {
    switch (gender) {
      case 0:
        return "male";
      case 1:
        return "female";
      default:
        return "";
    }
  }

  getOrderBy(String orderby) {
    switch (orderby) {
      case "Công nợ tối đa tăng dần":
        return "creditAmount-asc";
      case "Công nợ tối đa giảm dần":
        return "creditAmount-desc";
      case "Công nợ tăng dần":
        return "balance-asc";
      case "Công nợ giảm dần":
        return "balance-desc";
      case "Thời gian tạo cũ nhất":
        return "createAt-asc";
      case "Thời gian tạo mới nhất":
        return "createAt-desc";
      default:
        return "";
    }
  }

  deleteCustomer(int? id) {
    callDataService(customerRepo.deleteCustomer(id: id), onSuccess: (_) {
      AppSnackBar.showUpdateSuccess(message: "Xóa khách hàng thành công");
    });
  }

  createCustomers() {
    if (passwordController.text == passwordRetypeController.text) {
      creditAmount = int.parse(creditAmountController.text.toString());
      callDataService(
          customerRepo.createCustomer(payload: {
            "address": addressController.text.toString(),
            "birthday": birthday.text.isEmpty ? "" : birthday.text.toString(),
            "creditAmount": creditAmount,
            "customerId": customIdController.text.toString(),
            "customerServiceStaffId": customerServiceStaffId,
            "email": emailController.text.toString(),
            "fullname": fullnameController.text.toString(),
            "gender": gender == null ? "" : gender.toString(),
            "nickName": nicknameController.text.toString(),
            "note": noteController.text.isEmpty
                ? ""
                : noteController.text.toString(),
            "password": passwordController.text.toString(),
            "phone": phoneController.text.toString(),
            "saleId": saleId.toInt(),
            "shippingCost": shippingCost.toInt(),
            "tagIds": tags.toList(),
          }), onSuccess: (_) {
        AppSnackBar.showUpdateSuccess(message: "Cập nhật thông tin thành công");
        clear();
        Get.back(result: true);
      });
    }
  }

  clear() {
    addressController.clear();
    birthday.text = "";
    creditAmountController.clear();
    forCSKHController.clear();
    forConfigController.clear();
    forSaleController.clear();
    forCSKHController.clear();
    emailController.clear();
    gender = "";
    fullnameController.clear();
    nicknameController.clear();
    noteController.clear();
    passwordController.clear();
    passwordRetypeController.clear();
    phoneController.clear();
    saleId.value = 1;
    shippingCost.value = 0;
  }

  clearFilter() {
    customerFilter.clear();
    nicknameFilter.clear();
    saleFilter.clear();
    idSaleEmployeeFilter.value = "";
    orderByFilter.value = "Tất cả";
    undefinedSale.value = false;
    isDebt.value = false;
    isCard.value = false;
    isBlocked.value = false;
  }

  var isLoading = false.obs;

  void getCustomersList(
      {String? fullname,
      String? nickName,
      String? sale,
      bool? isDebt,
      bool? undefinedSale,
      bool? isCard,
      bool? isBlocked,
      String? orderBy,
      String? warehouse_id}) {
    if (!pagingController.canLoadNextPage()) return;
    pagingController.isLoadingPage = true;
    callDataService<ListDataCustomerResponse>(
      customerRepo.getListCustomer(
          page: pagingController.pageNumber,
          pageSize: 10,
          fullname: fullname == "" ? "" : fullname,
          nickName: nickName == "" ? "" : nickName,
          sale: sale ?? "",
          isDebt: isDebt == false ? false : isDebt,
          undefinedSale: undefinedSale == false ? false : undefinedSale,
          isCard: isCard == false ? false : isCard,
          isBlocked: isBlocked == false ? false : isBlocked,
          orderBy: orderBy ?? "",
          warehouse_id: warehouse_id ?? ""),
      onSuccess: (data) {
        isLoading.value = true;
        final repoList = data.data ?? [];
        if (_isLastPage(repoList.length, data.meta!.total!)) {
          pagingController.appendLastPage(repoList);
        } else {
          pagingController.appendPage(repoList);
        }

        var newList = [...pagingController.listItems];

        listDataCustomer.value = newList;
      },
    );

    pagingController.isLoadingPage = false;
  }

  getSaleName() {
    callDataService<ListSaleEmployeeResponse>(
      saleRepo.getListSaleEmployee(search: "", idRole: "11"),
      onSuccess: (data) {
        listSaleName.value = data.listSaleEmployeee ?? [];
      },
    );
  }

  getEmployeeName() {
    callDataService<ListSaleEmployeeResponse>(
      saleRepo.getListSaleEmployee(
        search: "",
      ),
      onSuccess: (data) {
        listEmployeeName.value = data.listSaleEmployeee ?? [];
      },
    );
  }

  getCSKHName() {
    callDataService<ListSaleEmployeeResponse>(
      saleRepo.getListSaleEmployee(search: "", idRole: "10"),
      onSuccess: (data) {
        listCSKHName.value = data.listSaleEmployeee ?? [];
      },
    );
  }

  bool _isLastPage(int newListItemCount, int totalCount) {
    return (listDataCustomer.length) >= totalCount;
  }

  onSelected() {
    pagingController.initRefresh();
    listDataCustomer.clear();
    getCustomersList(
        fullname: customerFilter.text,
        nickName: nicknameFilter.text,
        sale: idSaleEmployeeFilter.value,
        isDebt: isDebt.value,
        undefinedSale: undefinedSale.value,
        isCard: isCard.value,
        isBlocked: isBlocked.value,
        orderBy: getOrderBy(orderByFilter.value),
        warehouse_id: warehouse.value);
  }

  onRefreshPage() {
    customIdController.clear();
    pagingController.initRefresh();
    listDataCustomer.clear();
    getCustomersList(
        fullname: customerFilter.text,
        nickName: nicknameFilter.text,
        sale: idSaleEmployeeFilter.value,
        isDebt: isDebt.value,
        undefinedSale: undefinedSale.value,
        isCard: isCard.value,
        isBlocked: isBlocked.value,
        orderBy: getOrderBy(orderByFilter.value),
        warehouse_id: warehouse.value);
  }

  onLoadNextPage() {
    logger.i("On load next");
    getCustomersList(
        fullname: customerFilter.text,
        nickName: nicknameFilter.text,
        sale: idSaleEmployeeFilter.value,
        isDebt: isDebt.value,
        undefinedSale: undefinedSale.value,
        isCard: isCard.value,
        isBlocked: isBlocked.value,
        orderBy: getOrderBy(orderByFilter.value),
        warehouse_id: warehouse.value);
  }

  @override
  void onInit() {
    getCustomersList();
    getSaleName();
    getCSKHName();
    getEmployeeName();
    super.onInit();
  }
}
