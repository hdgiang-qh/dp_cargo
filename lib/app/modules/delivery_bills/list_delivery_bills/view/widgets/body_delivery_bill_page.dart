import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/enum/delivery_bill_status.dart';
import '../../../../../core/model/page_state.dart';
import '../../../../../core/widget/paging_view.dart';
import '../../../../../routes/app_pages.dart';
import '../../../delivery_bills_detail/view/widgets/delivery_bill_widget.dart';
import '../../controller/list_delivery_bills_controller.dart';

class BodyDeliveryBillPage extends StatefulWidget {
  const BodyDeliveryBillPage({
    super.key,
  });

  @override
  State<BodyDeliveryBillPage> createState() => _BodyDeliveryBillPageState();
}

class _BodyDeliveryBillPageState extends State<BodyDeliveryBillPage> {
  final controller = Get.find<ListDeliveryBillController>();
  DateTimeRange? dateTimeRange;
  final scrollController = ScrollController();
  bool isScrolling = false;

  @override
  void initState() {
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
          SizedBox(
            height: 50,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: controller.title.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      controller.onTapStatus(index);
                    },
                    child: Obx(() {
                      return Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 5),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border:
                          Border.all(color: controller.colors[index]),
                          color: controller.currentIndex.value == index
                              ? controller.colors[index]
                              : Colors.white,
                        ),
                        child: Text(
                          controller.title[index],
                          style: TextStyle(
                              fontSize: 14,
                              color: controller.currentIndex.value != index
                                  ? controller.colors[index]
                                  : Colors.white),
                        ),
                      );
                    }),
                  );
                }),
          ),
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
                      action: controller
                              .listDeliveryBill[index].deliveryBillStatus ==
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
