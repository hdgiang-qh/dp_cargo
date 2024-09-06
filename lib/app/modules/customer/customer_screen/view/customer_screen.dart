import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:vncss/app/modules/delivery_bills/delivery/widget/skeletonizer_loading.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../core/values/app_colors.dart';
import '../../../../core/values/app_text_styles.dart';
import '../../../../routes/app_pages.dart';
import '../../../../core/base/base_view.dart';
import '../../../../core/model/page_state.dart';
import '../../../../core/widget/paging_view.dart';
import '../../customer_add/view/customer_add.dart';
import '../controller/customer_controller.dart';
import '../controller/overview_controller.dart';
import '../widget/filter_customer.dart';
import '../widget/header_customer.dart';
import '../widget/item_customer.dart';

class CustomerScr extends BaseView<CustomerController> {
  @override
  Widget body(BuildContext context) {
    return const CustomerScreen();
  }
}

class CustomerScreen extends StatefulWidget {
  const CustomerScreen({super.key});

  @override
  State<CustomerScreen> createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {

  final GlobalKey<ScaffoldState> _scaffoldCustomerKey = GlobalKey<
      ScaffoldState>();
  final overviewController = Get.find<OverviewController>();
  final controller = Get.find<CustomerController>();
  bool isScrolling = false;

  final scrollController = ScrollController();

  void _openDrawer() {
    _scaffoldCustomerKey.currentState?.openEndDrawer();
  }

  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.position.pixels >
          scrollController.position.minScrollExtent + 5) {
        setState(() {
          isScrolling= true;
        });
      } else {
        setState(() {
          isScrolling = false;
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldCustomerKey,
        body: SafeArea(
          child: Column(children: [
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
                            "Khách hàng",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ))),
                  InkWell(
                    onTap: () {
                      Get.to(() => const CustomerAddScreen())?.then((_) {
                        controller.onRefreshPage();
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(4)
                      ),
                      child: const Icon(Icons.add, color: Colors.white,),
                    ),
                  ),
                  GestureDetector(
                      onTap: () async {
                        _openDrawer();
                      },
                      child: SvgPicture.asset(
                        "assets/image/filter1.svg",
                        color: Colors.black,
                      ))
                ])),
            Expanded(child: Column(children: [
                AnimatedCrossFade(
                firstChild: Container(),
                secondChild: Obx(() {
                  return HeaderCustomerWidget(
                      overviewData: overviewController.overview.value);
                }),
                crossFadeState: isScrolling
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: const Duration(milliseconds: 500)),
              Expanded(
                child: Obx(() {
                  if (controller.isLoading.value == false && controller.listDataCustomer.isEmpty) {
                    return FutureBuilder(
                      future: Future.delayed(const Duration(seconds: 2)),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return SkeletonizerLoading(
                            loading: controller.isLoading.value,
                          );
                        } else {
                          return Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("Danh sách trống"),
                                  Gap(10.h),
                                  ElevatedButton(
                                    onPressed: () {
                                      controller.onRefreshPage();
                                    },
                                    child: const Text('Tải lại'),
                                  ),
                                ],
                              ));
                        }
                      },
                    );
                  }
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
                        return GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.DETAIL_CUSTOMER, arguments: {
                                'id': controller.listDataCustomer[index]
                                    .customer?.id,
                              });
                            },
                            child: Slidable(
                              endActionPane: ActionPane(
                                  motion: const ScrollMotion(),
                                  children: [
                                    _SlidableAction(
                                        color: AppColors.primary,
                                        nameAction: "Xóa",
                                        icon: const SvgGenImage(
                                            'assets/image/trash.svg').svg(
                                            color: Colors.white),
                                        onTap: (context) {
                                          Slidable.of(context)!.close();
                                          showDialog(
                                            context: Get.context!,
                                            builder: (BuildContext context) =>
                                                CupertinoAlertDialog(
                                                  content: Text(
                                                    "Xóa khách hàng: ${controller
                                                        .listDataCustomer[index]
                                                        .fullname ??
                                                        "Chưa có tên"}",
                                                    style: const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight: FontWeight
                                                            .bold),),
                                                  actions: [
                                                    CupertinoDialogAction(
                                                      isDefaultAction: true,
                                                      child: const Text('Đóng'),
                                                      onPressed: () async {
                                                        Navigator.of(context,
                                                            rootNavigator: true)
                                                            .pop();
                                                      },
                                                    ),
                                                    CupertinoDialogAction(
                                                      isDefaultAction: true,
                                                      child: const Text(
                                                          'Xác nhận'),
                                                      onPressed: () async {
                                                        Navigator.of(context,
                                                            rootNavigator: true)
                                                            .pop();
                                                        controller
                                                            .deleteCustomer(
                                                            controller
                                                                .listDataCustomer[index]
                                                                .customer?.id);
                                                        await Future.delayed(
                                                            const Duration(
                                                                milliseconds: 500), () {
                                                          controller
                                                              .onRefreshPage();
                                                        });
                                                      },
                                                    )
                                                  ],
                                                ),
                                          );
                                        }
                                    ),
                                  ]
                              ),
                              child: ItemCustomer(
                                data_customer: controller
                                    .listDataCustomer[index],
                              ),
                            ));
                      },
                      count: controller.listDataCustomer.length,
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 20);
                      });
                }),
              ),
            ])),
          ]),
        ),
        endDrawer: const FilterCustomer());
  }
}


class _SlidableAction extends StatelessWidget {
  final Color color;
  final String nameAction;
  final SvgPicture icon;
  final SlidableActionCallback onTap;

  const _SlidableAction(
      {required this.color, required this.nameAction, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          onTap(context);
        },
        child: Container(
          decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(6), bottomLeft: Radius.circular(6))
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              const Gap(8),
              Text(
                nameAction,
                style: Theme
                    .of(context)
                    .BodyText2Bold
                    .copyWith(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}


