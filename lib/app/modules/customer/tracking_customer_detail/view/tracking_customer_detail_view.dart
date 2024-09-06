import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../core/base/base_view.dart';
import '../../../../core/utils/color_app.dart';
import '../../../../core/utils/converter_utils.dart';
import '../../../../routes/app_pages.dart';
import '../../../util/images.dart';
import '../controller/tracking_customer_detail_controller.dart';

class TrackingCustomerDetail extends BaseView<TrackingCustomerDetailController> {
  Future<void> onRefreshPage() async {
    await controller.getTrackingCustomerDetail();
  }

  @override
  Widget body(BuildContext context) {
    return const TrackingCustomerDetailView();
  }
}

class TrackingCustomerDetailView extends StatefulWidget {
  const TrackingCustomerDetailView();

  @override
  State<TrackingCustomerDetailView> createState() => _TrackingCustomerDetailViewState();
}

class _TrackingCustomerDetailViewState extends State<TrackingCustomerDetailView> {
  final controller = Get.find<TrackingCustomerDetailController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Obx((){
        return controller.trackingCustomerDetail.isEmpty
            ? Center(child: Text("Chưa có tracking"),)
            : Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              child: Row(children: [
                SvgPicture.asset(Images.menu),
                const SizedBox(width: 8),
                Text("Danh sách tracking", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),)
              ]),
            ),
            Expanded(
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: controller.trackingCustomerDetail.length,
                  itemBuilder: (context, index){
                    return InkWell(
                      onTap: () {
                        Get.toNamed(Routes.DETAIL_TRACKING, arguments: {
                          'id': controller.trackingCustomerDetail[index].id,
                        });
                      },
                      child: Column(children: [
                        _Item(
                            codeTracking: "${controller.trackingCustomerDetail[index].code}",
                            weight: "${controller.trackingCustomerDetail[index].weight ?? "không có thông tin"}",
                            money: "${formatNumberCommas("${controller.trackingCustomerDetail[index].trackingTotalMoney ?? 0}")} đ"),
                      ]),
                    );
                  }
              ),
            ),
          ],
        );
      }),
    );
  }
}
class _Item extends StatelessWidget {
  final String codeTracking;
  final String weight;
  final String money;
  const _Item({super.key,
    required this.codeTracking,
    required this.weight,
    required this.money,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(bottom: BorderSide(color: Colors.grey))
        ),
        child: Column(children: [
          Row(children: [
            SvgPicture.asset("assets/image/note_search.svg", width: 20,color: ColorApp.grey74),
            const SizedBox(width: 8),
            Text(codeTracking, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),)
          ]),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  SvgPicture.asset("assets/image/scale.svg", width: 20, color: ColorApp.grey74,),
                  const SizedBox(width: 8),
                  Text(weight, style: TextStyle(fontSize: 16,))
                ]),
                const SizedBox(height: 10),
                Row(children: [
                  SvgPicture.asset("assets/image/coin.svg", width: 20, color: ColorApp.grey74),
                  const SizedBox(width: 8),
                  Text(money, style: TextStyle(fontSize: 16),)
                ]),
              ]
          )
        ])
    );
  }
}

