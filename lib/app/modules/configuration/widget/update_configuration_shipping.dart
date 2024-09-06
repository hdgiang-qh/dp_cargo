import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vncss/app/core/widget/avatar.dart';
import 'package:vncss/app/data/model/model/bill_of_lading.dart';
import 'package:vncss/app/modules/common_widget/app_bar_widget.dart';
import 'package:vncss/app/modules/common_widget/button_widget.dart';
import 'package:vncss/app/modules/common_widget/textfield_widget.dart';
import 'package:vncss/app/modules/configuration/controller/detail_partner_controller.dart';
import 'package:vncss/app/modules/configuration/controller/partner_controller.dart';
import 'package:vncss/app/modules/delivery_bills/delivery/widget/skeletonizer_loading.dart';

import '../../../core/base/base_view.dart';
import '../../common_widget/const.dart';

class UpdateConfigurationShipping extends BaseView<DetailPartnerController> {
  final controllerList = Get.find<PartnerController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppBarWidget(
              title: "Sửa đối tác vận chuyển",
              onBack: () => Get.back(),
            ),
            const SizedBox(
              height: 8,
            ),
            Expanded(
                child: FutureBuilder<BillOfLadingVnDeliveryUnit>(
                    future: controller.getDetailDeliveryUnit(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return SkeletonizerLoading(
                          loading: controller.isLoading.value,
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                            child: Text('Error: ${snapshot.error}'));
                      } else if (!snapshot.hasData) {
                        return const Center(
                            child: Text('No delivery bills found'));
                      } else {
                        return Obx(() {
                          return SingleChildScrollView(
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Column(
                                children: [
                                  Center(
                                    child: AvatarWidget(
                                      url: controller.detailDeliveryUnit.value.logoUrl,
                                      onChanged: (file) {
                                        controller.onSetValue();
                                        controller.uploadAvatar(file: file);
                                      },
                                    ),
                                  ),
                                  AppTextInputField(
                                    controller: controller.nameUpdate,
                                    label: "Tên",
                                    showLabel: true,
                                    hint: "Tên",
                                  ),
                                  AppTextInputField(
                                    controller: controller.codeUpdate,
                                    label: "Code",
                                    showLabel: true,
                                    hint: "Code",
                                    inputFormatters: [UppercaseTextFormatter()],
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                      }
                    })),
            ButtonWidget(
              buttonText: "Cập nhật",
              margin: const EdgeInsets.symmetric(horizontal: 16),
              bgcolor: primaryColor,
              borderColor: primaryColor,
              textColor: Colors.white,
              onTap: () {
                controller.updateDeliveryUnit();
              },
            ),
            const SizedBox(height: 8,)
          ],
        ),
      ),
    );
  }
}
