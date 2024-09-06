import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vncss/app/core/widget/paging_view.dart';
import 'package:vncss/app/data/model/model/transaction.dart';
import 'package:vncss/app/modules/common_widget/button_widget.dart';
import 'package:vncss/app/modules/common_widget/dialog_widget.dart';
import 'package:vncss/app/modules/common_widget/item_detail_list_widget.dart';
import 'package:vncss/app/modules/configuration/controller/configuration_bank_controller.dart';
import 'package:vncss/app/modules/delivery_bills/delivery/widget/skeletonizer_loading.dart';
import 'package:vncss/app/routes/app_pages.dart';
import '../../core/base/base_view.dart';
import '../common_widget/app_bar_widget.dart';
import '../common_widget/const.dart';

class AccountBankScreen extends BaseView<ConfigurationBankController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          AppBarWidget(
            title: "Tài khoản ngân hàng",
            onBack: () => Get.back(),
          ),
          const SizedBox(
            height: 8,
          ),
          Expanded(
              child: FutureBuilder<List<BankModel>>(
                  future: controller.getBankData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return SkeletonizerLoading(
                        loading: controller.isLoading.value,
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                          child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData ||
                        snapshot.data!.isEmpty) {
                      return const Center(
                          child: Text('No bank found'));
                    } else {
                      return Obx(() {
                        return PagingView.separated(
                            onLoadNextPage: () {},
                            onRefresh: () async {
                              controller.onRefreshPage();
                            },
                            builder: (context, index) {
                              return Container(
                                color: Colors.white,
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                child: Column(
                                  children: [
                                    ItemDetailListWidget(
                                        head: "Tên ngân hàng:",
                                        fontWeight: true,
                                        endText: controller
                                            .listBankModelConfigValueConfig[index]
                                            .bankName
                                            .toString()),
                                    ItemDetailListWidget(
                                        head: "Số tài khoản:",
                                        fontWeight: true,
                                        endText: controller
                                            .listBankModelConfigValueConfig[index]
                                            .accountNumber
                                            .toString()),
                                    ItemDetailListWidget(
                                        head: "Tên tài khoản:",
                                        fontWeight: true,
                                        endText: controller
                                            .listBankModelConfigValueConfig[index]
                                            .accountName
                                            .toString()),
                                    ItemDetailListWidget(
                                        head: "Chi nhánh:",
                                        fontWeight: true,
                                        endText: controller
                                            .listBankModelConfigValueConfig[index]
                                            .bankBranch
                                            .toString()),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                            child: ButtonWidget(
                                              buttonText: "Xóa",
                                              margin: const EdgeInsets.only(left: 16),
                                              borderColor: primaryColor,
                                              textColor: primaryColor,
                                              onTap: () {
                                                controller.listBankAdd.clear();
                                                controller.listBankAdd.addAll(controller
                                                    .listBankModelConfigValueConfig);
                                                controller.listBankAdd.removeAt(index);
                                                Get.dialog(
                                                  CustomDialog(
                                                    title:
                                                    "Bạn có chắc chắn muốn xóa tài khoản ngân hàng này không?",
                                                    onTapYes: () async {
                                                      controller.deleteConfigurationBank(
                                                          controller.listBank[0].id ?? 0);
                                                      Get.back();
                                                      Future.delayed(
                                                          const Duration(milliseconds: 500),
                                                              () {
                                                            controller.onRefreshPage();
                                                          });
                                                    },
                                                    onTapNo: () {
                                                      Get.back();
                                                    },
                                                  ),
                                                );
                                              },
                                            )),
                                        const SizedBox(
                                          width: 16,
                                        ),
                                        Expanded(
                                            child: ButtonWidget(
                                              buttonText: "Cập nhật",
                                              margin: const EdgeInsets.only(right: 16),
                                              borderColor: primaryColor,
                                              bgcolor: primaryColor,
                                              textColor: ColorApp.whiteFA,
                                              onTap: () {
                                                Get.toNamed(Routes.UPDATE_COEFFICIENT_BANK,
                                                    arguments: {'id': index});
                                              },
                                            )),
                                      ],
                                    )
                                  ],
                                ),
                              );
                            },
                            count: controller.listBankModelConfigValueConfig.length,
                            separatorBuilder: (context, index) => const SizedBox(
                              height: 16,
                            ));
                      });
                    }
                  })),
          ButtonWidget(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            buttonText: "Thêm tài khoản ngân hàng",
            borderColor: primaryColor,
            bgcolor: primaryColor,
            textColor: ColorApp.whiteFA,
            onTap: () {
              controller.nameBank.clear();
              controller.numberBank.clear();
              controller.nameAcc.clear();
              controller.nameBranch.clear();
              Get.toNamed(Routes.ADD_COEFFICIENT_BANK);
            },
          )
        ]),
      ),
    );
  }
}
