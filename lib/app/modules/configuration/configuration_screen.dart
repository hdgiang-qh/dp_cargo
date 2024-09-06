import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vncss/app/data/model/model/interface_model.dart';
import 'package:vncss/app/modules/configuration/controller/configuration_interface_controller.dart';
import 'package:vncss/app/modules/configuration/controller/partner_controller.dart';
import 'package:vncss/app/modules/configuration/widget/item_config.dart';
import 'package:vncss/app/modules/delivery_bills/delivery/widget/skeletonizer_loading.dart';
import 'package:vncss/app/modules/util/images.dart';
import 'package:vncss/app/routes/app_pages.dart';

import '../../core/base/base_view.dart';
import '../common_widget/app_bar_widget.dart';
import '../common_widget/const.dart';

class ConfigurationScreen extends BaseView<ConfigurationInterfaceController> {
  final controllerPartner = Get.find<PartnerController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          AppBarWidget(
            title: "Cấu hình",
            onBack: () => Get.back(),
          ),
          const SizedBox(
            height: 8,
          ),
          Expanded(
              child: FutureBuilder<List<InterfaceModel>>(
                  future: controller.getInterface(),
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
                          child: Text('No delivery bills found'));
                    } else {
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            ItemConfigView(
                              icon: Images.rights_group,
                              title: "Nhóm quyền",
                              subTittle: "Cấu hình quyền người dùng",
                              func: () {
                                Get.toNamed(Routes.COEFFICIENT_GROUP);
                              },
                            ),
                            Obx(() {
                              return CustomScrollView(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                slivers: [
                                  SliverList(
                                      delegate: SliverChildBuilderDelegate(
                                            (BuildContext context, int index) {
                                          return ItemConfigView(
                                            icon: controller
                                                .pathIcon(
                                                key: controller.listInterface[index]
                                                    .configInformation?.key ??
                                                    '')
                                                .toString(),
                                            title: controller.listInterface[index]
                                                .configInformation?.name ??
                                                '',
                                            subTittle: controller.listInterface[index]
                                                .configInformation?.description ??
                                                '',
                                            func: () {
                                              if (controller.listInterface[index]
                                                  .configInformation?.key ==
                                                  "PRICING_CONFIG") {
                                                Get.toNamed(Routes.COEFFICIENT_PRICE);
                                              } else if (controller.listInterface[index]
                                                  .configInformation?.key ==
                                                  "BOX_COEFFICIENT_CONFIG") {
                                                Get.toNamed(Routes.COEFFICIENT_BOX);
                                              } else if (controller.listInterface[index]
                                                  .configInformation?.key ==
                                                  "BANK_ACCOUNT_CONFIG") {
                                                Get.toNamed(Routes.COEFFICIENT_BANK);
                                              } else if (controller.listInterface[index]
                                                  .configInformation?.key ==
                                                  "CONTACT_INFORMATION_CONFIG") {
                                                Get.toNamed(Routes.COEFFICIENT_COMMON);
                                              } else if (controller.listInterface[index]
                                                  .configInformation?.key ==
                                                  "MAIL_SERVER_CONFIG") {
                                                Get.toNamed(Routes.COEFFICIENT_MAIL);
                                              } else if (controller.listInterface[index]
                                                  .configInformation?.key ==
                                                  "CODE_PREFIX_CONFIG") {
                                                Get.toNamed(Routes.COEFFICIENT_PREFIX);
                                              }
                                            },
                                          );
                                        },
                                        childCount: controller.listInterface.length,
                                      )),
                                ],
                              );
                            }),
                            ItemConfigView(
                              icon: Images.shipping_partner,
                              title: "Đối tác vận chuyển",
                              subTittle: "Cấu hình đối tác vận chuyển",
                              func: () {
                                controllerPartner.pagingController.initRefresh();
                                Get.toNamed(Routes.SHIPPING_PARTNER);
                              },
                            ),
                          ],
                        ),
                      );
                    }
                  })),
        ]),
      ),
    );
  }
}
