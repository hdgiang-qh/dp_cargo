import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/enum/delivery_bill_status.dart';
import '../../../../core/model/page_state.dart';
import '../../../../core/widget/paging_view.dart';
import '../../../../routes/app_pages.dart';
import '../../../delivery_bills/delivery_bills_detail/view/widgets/delivery_bill_widget.dart';
import '../../controller/home_controller.dart';

class BodyPage extends StatefulWidget {
  const BodyPage({
    super.key,
  });

  @override
  State<BodyPage> createState() => _BodyPageState();
}

class _BodyPageState extends State<BodyPage> {
  final controller = Get.find<HomeController>();
  DateTimeRange? dateTimeRange;
  final scrollController = ScrollController();
  bool isScrolling = false;
  final controllerHome = Get.put(HomeController());

  @override
  void initState() {
    controllerHome.getDeliveryBillsList();
    scrollController.addListener(() {
      if (scrollController.position.pixels >
          scrollController.position.minScrollExtent + 5) {
        setState(() {
          isScrolling = true;
        });
      } else {
        setState(() {
          isScrolling = false;
        });
      }
    });
    super.initState();
  }


  
  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Obx(() {
              return PagingView.separated(
                  scrollController: scrollController,
                  onLoadNextPage: () {
                    controller.onLoadNextPage();
                  },
                  onRefresh: () async {
                    controller.onRefreshPage();
                  },
                  isLoading: controller.pageState == PageState.LOADING,
                  builder: (context, index) {
                    return DeliveryBillWidget(
                            onTap: () {
                              Get.toNamed(Routes.DELIVERY_BILL, arguments: {
                                'id': controller.listDeliveryBill[index].id,
                              });
                            },
                            deliveryBill: controller.listDeliveryBill[index],
                            action: controller.listDeliveryBill[index]
                                    .deliveryBillStatus ==
                                DeliveryStatus.delivering,
                          );
                  },
                  count: controller.listDeliveryBill.length,
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 10.h);
                  });
            }),
          ),
        ],
      ),
    );
  }
}
