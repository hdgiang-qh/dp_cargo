import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:vncss/app/modules/common_widget/item_detail_list_widget.dart';

import 'modules/common_widget/button_widget.dart';
import 'modules/common_widget/const.dart';
import 'modules/common_widget/item_list_widget.dart';
import 'modules/common_widget/item_small.dart';
import 'modules/common_widget/title_detail_list.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            // Container(
            //   padding: const EdgeInsets.symmetric(vertical: 8),
            //   decoration: const BoxDecoration(),
            //   child: const Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Text("Item List Widget (2)"),
            //       ItemListWidget(
            //         showIcon: true,
            //         showChip: true,
            //         svgPath: "assets/image/person.svg",
            //         headText: 'Sinh',
            //         color: Colors.red,
            //         endText: 'Khu đô thị FPT',
            //       ),
            //       ItemListWidget(
            //         headText: 'SDT',
            //         endText: '0944822777',
            //       ),
            //       ItemListWidget(
            //         headText: 'Email',
            //         endText: 'gaugau@gmail.com',
            //       ),
            //       ItemListWidget(
            //         headText: 'Kho',
            //         endText: 'DP-HN',
            //       ),
            //     ],
            //   ),
            // ),
            // const SizedBox(
            //   height: 10,
            // ),
            // const Text("Button Widget"),
            // ButtonWidget(
            //   buttonText: "buttonText",
            //   bgcolor: primaryColor,
            //   textColor: ColorApp.whiteFA,
            //   onTap: () {},
            // ),
            // const SizedBox(
            //   height: 10,
            // ),
            // const ButtonWidget(
            //   buttonText: "buttonText",
            //   showIcon: true,
            //   bgcolor: ColorApp.green23,
            //   textColor: ColorApp.whiteFA,
            // ),
            // const SizedBox(
            //   height: 10,
            // ),
            // const ButtonWidget(
            //   buttonText: "buttonText",
            //   width: 90,
            //   createDelivery: true,
            //   height: 90,
            //   bgcolor: primaryColor,
            //   textColor: ColorApp.whiteFA,
            // ),
            // const SizedBox(
            //   height: 10,
            // ),
            // const ButtonWidget(
            //   buttonText: "buttonText",
            //   bgcolor: ColorApp.whiteFA,
            //   textColor: primaryColor,
            //   borderColor: primaryColor,
            // ),
            // const SizedBox(
            //   height: 10,
            // ),
            // const ItemListWidget(
            //   showIcon: true,
            //   showChip: true,
            //   fontWeightHead: true,
            //   svgPath: "assets/image/copy_text.svg",
            //   headText: 'DPOP22042400001',
            //   color: Colors.red,
            //   endText: 'Đơn hàng giao không thành công',
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
            // const Text("Item Detail List Widget (3)"),
            // const ItemDetailListWidget(
            //   head: 'Khách hàng',
            //   endText: 'Khánh Sky',
            // ),
            // const ItemDetailListWidget(
            //   head: 'Tổng khối lượng (TLKT/TLTT):',
            //   fontWeight: true,
            //   endText: 'Thanh toán cho PXK DPOP22042400001',
            // ),
            // const ItemDetailListWidget(
            //   head: 'Địa chỉ',
            //   align: true,
            //   color: ColorApp.green23,
            //   endText:
            //       'Khu đô thị FPT, Phường hoa ngải,Quận Ngũ Dương Chỉ, Thành Phố Sương mù',
            // ),
            // const Text("Title Detail List (1)"),
            // const TitleDetailList(
            //   svgPath: "assets/image/delivery_bill.svg",
            //   headText: "KH: Oliver",
            //   showEnd: true,
            //   svgPathEnd: "assets/image/pay.svg",
            //   endText: "2.400.000đ",
            // ),
            // const Text("Item Small (4)"),
            const ItemSmall(
              svgPath: "assets/image/coin.svg",
              value: "27.090d",
            ),
            MyHomePage()
          ],
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> data = [
    'Item 1',
    'Item 2',
    'Item 3',
  ];
  TextEditingController values = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all()
      ),
      child: TypeAheadField(
        controller: values,
        suggestionsCallback: (pattern) {
          return data
              .where((String item) =>
                  item.toLowerCase().contains(pattern.toLowerCase()))
              .toList();
        },
        builder: (context, controller, focusNode) {
          return TextField(
              controller: controller,
              focusNode: focusNode,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              hintText: "Chọn"
              )
          );
        },
        itemBuilder: (context, suggestion) {
          return ListTile(
            title: Text(suggestion),
          );
        },
        onSelected: (suggestion) {
          values.text = suggestion;
        },
        loadingBuilder: (context) => const Text('Loading...'),
        errorBuilder: (context, error) => const Text('Error!'),
        emptyBuilder: (context) => const Text('No items found!'),
      ),
    );
  }
}
