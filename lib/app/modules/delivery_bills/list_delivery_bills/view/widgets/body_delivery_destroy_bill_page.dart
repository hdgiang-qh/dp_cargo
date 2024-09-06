import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/enum/delivery_bill_status.dart';
import '../../../../../core/model/page_state.dart';
import '../../../../../core/widget/paging_view.dart';
import '../../../../../routes/app_pages.dart';
import '../../../delivery_bills_detail/view/widgets/delivery_bill_widget.dart';
import '../../controller/list_delivery_bills_destroy_controller.dart';


class BodyDeliveryDestroyBillPage extends StatefulWidget {
  const BodyDeliveryDestroyBillPage({
    super.key,
  });

  @override
  State<BodyDeliveryDestroyBillPage> createState() => _BodyDeliveryBillPageState();
}

class _BodyDeliveryBillPageState extends State<BodyDeliveryDestroyBillPage> {
  final controller = Get.find<ListDeliveryBillsDestroyController>();
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
      }else{
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
                    controller.onLoadNextDestroyPage();
                  },
                  onRefresh: () async {
                    controller.onRefreshDestroyPage();
                  },
                  isLoading: controller.pageState == PageState.LOADING,
                  builder: (context, index) {
                    return DeliveryBillWidget(
                      onTap: (){
                        Get.toNamed(Routes.DELIVERY_BILL, arguments: {
                          'id': controller.listDeliveryBill[index].id,
                        });
                      },  
                      deliveryBill: controller.listDeliveryBill[index],
                      action: controller.listDeliveryBill[index].deliveryBillStatus == DeliveryStatus.delivering,        
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
