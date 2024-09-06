import 'package:flutter/material.dart';
import '../../../../core/base/base_view.dart';
import '../../../../core/widget/appbar/custom_appbar.dart';
import '../../../home/view/widgets/head_page.dart';
import '../controller/list_delivery_bills_controller.dart';
import 'widgets/body_delivery_bill_page.dart';

class ListDeliveryBillsView extends BaseView<ListDeliveryBillController> {
  final ScrollController scrollController = ScrollController();

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return const AppbarCustom(height: 0);
  }
  DateTimeRange? dateTimeRange;
  @override
  Widget body(BuildContext context) {    
    return const Scaffold(      
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [          
          HeadPage(),
          BodyDeliveryBillPage()
        ]),
      ),
    );
  }
}
