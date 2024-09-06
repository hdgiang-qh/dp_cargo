import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:vncss/app/modules/tracking/tracking_screen/controller/tracking_controller.dart';

import '../../generated/l10n.dart';
import '../core/base/base_view.dart';
import '../core/values/app_colors.dart';
import 'customer/customer_screen/controller/customer_controller.dart';
import 'customer/customer_screen/controller/overview_controller.dart';
import 'customer/customer_update/controller/config_price_controller.dart';
import 'mawb/mawb_screen/controller/mawb_status_controller.dart';
import 'order/list_orders/controller/order_status_controller.dart';
import 'tracking/tracking_screen/controller/tracking_status_controller.dart';


class Test extends BaseView<TrackingTypeController> {
  @override
  Widget body(BuildContext context) {
    return const TestView();
  }
}
class TestView extends StatefulWidget {
  const TestView();

  @override
  State<TestView> createState() => _TestViewState();
}

class _TestViewState extends State<TestView> with SingleTickerProviderStateMixin {
  final controller = Get.find<TrackingTypeController>();
  final ScrollController _scrollController = ScrollController();
  String? valueChoose;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx((){
          return Column(children: [
            Container(
                padding: const EdgeInsets.all(16),
                child: Row(children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(Icons.arrow_back, size: 30),
                  ),
                  const Expanded(
                      child: Center(
                          child: Text(
                            "TestView",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ))),
                ])),
            Container(
              height: 60,
              width: 120,
              child: Stack(children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    alignment: Alignment.center,
                    height: 28,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text("Tất cả", style: TextStyle(fontSize: 13, color: Colors.white),),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(4)
                    ),
                    child: Text("100", style: TextStyle(fontSize: 10, color: Colors.white),),
                  ),
                )
              ]),
            ),
            CustomTextTruncation(
              text: 'This is a very long text that should truncate the beginning part if it is too long to fit in the provided space.',
              maxLength: 50,
            ),
            Container(
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: Colors.black12)
              ),
              child: MultiSelectDropDown(
                onOptionSelected: (options) {
                  debugPrint(options.toString());
                },
                options: const <ValueItem>[
                  ValueItem(label: 'Option 1', value: '1'),
                  ValueItem(label: 'Option 2', value: '2'),
                  ValueItem(label: 'Option 3', value: '3'),
                  ValueItem(label: 'Option 4', value: '4'),
                  ValueItem(label: 'Option 5', value: '5'),
                  ValueItem(label: 'Option 6', value: '6'),
                ],
                disabledOptions: const [ValueItem(label: 'Option 1', value: '1')],
                selectionType: SelectionType.multi,
                chipConfig: const ChipConfig(wrapType: WrapType.scroll),
                dropdownHeight: 200,
                optionTextStyle: const TextStyle(fontSize: 13),
                selectedOptionIcon: const Icon(Icons.check_circle),
                borderRadius: 4,
              ),
            ),
            Expanded(
              child: Container(
                child: ListView.builder(
                    itemCount: controller.listTrackingType.length,
                    itemBuilder: (context, index){
                      return Center(child: Row(
                        children: [
                          Text("${controller.listTrackingType[index].id}"),
                          Text("${controller.listTrackingType[index].name}"),
                        ],
                      ));
                    }
                ),
              ),
            ),
          ]);
        })
      ),
    );
  }
}
class CustomTextTruncation extends StatelessWidget {
  final String text;
  final int maxLength;

  CustomTextTruncation({required this.text, required this.maxLength});

  @override
  Widget build(BuildContext context) {
    String displayText = text.length > maxLength
        ? '...${text.substring(text.length - maxLength)}'
        : text;

    return Text(displayText);
  }
}
