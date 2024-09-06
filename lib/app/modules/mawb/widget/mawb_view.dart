import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vncss/app/modules/common_widget/const.dart';

class MAWBView extends StatefulWidget {
  final String AWBcode;
  final String status;
  final quatityTracking;
  final kg;
  final total;

  MAWBView({
    Key? key,
    required this.AWBcode,
    required this.status,
    this.quatityTracking,
    this.kg,
    this.total,
  }) : super(key: key);

  @override
  State<MAWBView> createState() => _MAWBViewState();
}

class _MAWBViewState extends State<MAWBView> {
  bool delete = false;
  bool edit = false;
  bool checkGoods = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black54),
          borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 4),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset("assets/image/copy_text.svg"),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      widget.AWBcode,
                      style: const TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 12),
                    ),
                  ]),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    decoration: BoxDecoration(
                      color: statusAWBColor(widget.status),
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                    ),
                    child: Text(
                      widget.status,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: 13),
                    ),
                  )
                ]),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Số lượng tracking:",
                    style: TextStyle(fontSize: 12, color: ColorApp.grey7F),
                  ),
                  Row(children: [
                    Text(
                      "${widget.quatityTracking}",
                      style: const TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 12),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset("assets/image/copy_text.svg"),
                    )
                  ]),
                ]),
          ),
          _ItemAWB(head: "TLTT/TLKT(kg)", endText: "${widget.kg}"),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Tổng tiền(VNĐ):",
                      style: TextStyle(fontSize: 12, color: ColorApp.grey7F)),
                  widget.total != ""
                      ? Text(
                          widget.total,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 12),
                        )
                      : const SizedBox(),
                ]),
          ),
        ],
      ),
    );
  }

  bool checkStatusGoods(String status, bool checkGoods) {
    switch (status) {
      case "Chờ nhập kho US":
      case "Đã nhập kho US":
      case "Đang vận chuyển về VN":
      case "Đã nhập kho VN":
      case "Đã khai thác":
      case "Đã đóng hàng":
      case "Đang giao hàng":
      case "Hoàn thành":
        checkGoods = true;
      case "Đã hủy bỏ":
        checkGoods = false;
    }
    return checkGoods;
  }

  bool checkStatusEdit(String status, bool edit) {
    switch (status) {
      case "Chờ nhập kho US":
      case "Đã nhập kho US":
      case "Đang vận chuyển về VN":
      case "Đã nhập kho VN":
      case "Đã khai thác":
      case "Đã hủy bỏ":
        edit = true;
      default:
        edit = false;
    }
    return edit;
  }

  bool checkStatusDelete(String status, bool delete) {
    switch (status) {
      case "Chờ nhập kho US":
      case "Đã nhập kho US":
      case "Đang vận chuyển về VN":
      case "Đã nhập kho VN":
      case "Đã đóng hàng":
      case "Đang giao hàng":
      case "Đã hủy bỏ":
        delete = true;
      default:
        delete = false;
    }
    return delete;
  }

  Color statusAWBColor(String status) {
    Color color = Colors.black54;
    switch (status) {
      case "Tất cả":
        color = Colors.red;
      case "Đang đồng bộ":
        color = Colors.orange;
      case "Đồng bộ thất bại":
        color = Colors.purpleAccent;
      case "Đang vận chuyển về VN":
        color = Colors.blue;
      case "Đã vận chuyển về VN":
        color = Colors.lightBlueAccent;
      case "Đang khai thác":
        color = Colors.deepPurple;
      case "Đã khai thác":
        color = Colors.yellow;
    }
    return color;
  }
}

class _ItemAWB extends StatelessWidget {
  final String head;
  final endText;

  const _ItemAWB({
    super.key,
    required this.head,
    this.endText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(head,
              style: const TextStyle(fontSize: 12, color: ColorApp.grey7F)),
          Text(
            endText,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
          )
        ],
      ),
    );
  }
}
