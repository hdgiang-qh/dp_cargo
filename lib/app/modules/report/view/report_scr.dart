import 'package:flutter/material.dart';

import '../widget/item_report.dart';

class ReportScr extends StatefulWidget {
  const ReportScr({super.key});

  @override
  State<ReportScr> createState() => _ReportScrState();
}

class _ReportScrState extends State<ReportScr> {
  List<String> title = [
    "Thống kê doanh thu",
    "Thống kê doanh thu",
    "Thống kê doanh thu",
    "Thống kê doanh thu",
    "Thống kê khai thác"
  ];

  List<String> content = [
    "Kho khai thác",
    "Phiếu xuất kho",
    "AWB",
    "Thống kê",
    ""
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Stack(
                  children: [
                    SizedBox(
                      height: 30,
                      child: Center(
                        child: Text(
                          "Báo cáo",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
                ItemReport(
                  svgPath: 'assets/image/statistical1.svg',
                  index: 0,
                  title: title[0],
                  content: content[0],
                ),
                ItemReport(
                  svgPath: 'assets/image/statistical1.svg',
                  index: 1,
                  title: title[1],
                  content: content[1],
                ),
                ItemReport(
                  svgPath: 'assets/image/statistical1.svg',
                  index: 2,
                  title: title[2],
                  content: content[2],
                ),
                ItemReport(
                  svgPath: 'assets/image/statistical1.svg',
                  index: 3,
                  title: title[3],
                  content: content[3],
                ),
                ItemReport(
                  svgPath: 'assets/image/statistical.svg',
                  index: 4,
                  title: title[4],
                  content: content[4],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
