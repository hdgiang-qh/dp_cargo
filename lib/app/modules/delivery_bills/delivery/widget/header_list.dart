
import 'package:flutter/material.dart';
import 'package:vncss/app/modules/common_widget/const.dart';


class HeaderListTracking extends StatefulWidget {
  final bool addTrack;

  const HeaderListTracking({
    super.key,
    this.addTrack = false,
  });

  @override
  State<HeaderListTracking> createState() => _HeaderListTrackingState();
}

class _HeaderListTrackingState extends State<HeaderListTracking> {
  bool check = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
        color: ColorApp.greyD7,
        border: Border(
            right: BorderSide(width: 0.5, color: ColorApp.greyC4),
            left: BorderSide(width: 0.5, color: ColorApp.greyC4),
            top: BorderSide(width: 0.5, color: ColorApp.greyC4)),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24), topRight: Radius.circular(24)),
      ),
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 80,
            child: Center(
              child: widget.addTrack
                  ? Checkbox(
                      value: check,activeColor: primaryColor,
                      onChanged: (value) {
                        setState(() {
                          check = value!;
                        });
                      },
                    )
                  : const Text(
                      'STT',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
                    ),
            ),
          ),
          widget.addTrack ? Container() :const SizedBox(
            width: 150,
            child: Center(
              child: Text(
                'Mã đơn hàng',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
              ),
            ),
          ),
          const SizedBox(
            width: 150,
            child: Center(
              child: Text(
                'Mã tracking',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
              ),
            ),
          ),
          SizedBox(
            width: 150,
            child: Center(
              child: Text(
                widget.addTrack ? "Tên sản phẩm": 'Sản phẩm',
                style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
              ),
            ),
          ),
          const SizedBox(
            width: 80,
            child: Center(
              child: Text(
                'Số lượng',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
              ),
            ),
          ),
          SizedBox(
            width: 120,
            child: Center(
              child: Text(
                widget.addTrack ? "TLTT/TLKT":'Trọng lượng',
                style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
              ),
            ),
          ),
          widget.addTrack ? Container(): const Row(
            children: [
              SizedBox(
                width: 100,
                child: Center(
                  child: Text(
                    'Giá cước',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
                  ),
                ),
              ),
              SizedBox(
                width: 120,
                child: Center(
                  child: Text(
                    "Phí vận chuyển",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
                  ),
                ),
              ),
              SizedBox(
                width: 120,
                child: Center(
                  child: Text(
                    "Phụ thu",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
                  ),
                ),
              ),
              SizedBox(
                width: 120,
                child: Center(
                  child: Text(
                    "Phí khác",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
                  ),
                ),
              ),
              SizedBox(
                width: 120,
                child: Center(
                  child: Text(
                    "Giảm giá",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
                  ),
                ),
              ),
              SizedBox(
                width: 120,
                child: Center(
                  child: Text(
                    "Thành tiền",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class HeaderListTransport extends StatelessWidget {
  const HeaderListTransport({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
        color: ColorApp.greyD7,
        border: Border(
            right: BorderSide(width: 0.5, color: ColorApp.greyC4),
            left: BorderSide(width: 0.5, color: ColorApp.greyC4),
            top: BorderSide(width: 0.5, color: ColorApp.greyC4)),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24), topRight: Radius.circular(24)),
      ),
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 80,
            child: Center(
              child: Text(
                'STT',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
              ),
            ),
          ),
          SizedBox(
            width: 150,
            child: Center(
              child: Text(
                'Mã vận đơn',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
              ),
            ),
          ),
          SizedBox(
            width: 150,
            child: Center(
              child: Text(
                'Trạng thái',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
              ),
            ),
          ),
          SizedBox(
            width: 80,
            child: Center(
              child: Text(
                'Số lượng',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
              ),
            ),
          ),
          SizedBox(
            width: 150,
            child: Center(
              child: Text(
                'Đơn vị vận chuyển',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HeaderListUpdate extends StatelessWidget {
  const HeaderListUpdate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
        color: ColorApp.greyD7,
        border: Border(
            right: BorderSide(width: 0.5, color: ColorApp.greyC4),
            left: BorderSide(width: 0.5, color: ColorApp.greyC4),
            top: BorderSide(width: 0.5, color: ColorApp.greyC4)),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(24)),
      ),
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 150,
            child: Center(
              child: Text(
                'Mã tracking',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
              ),
            ),
          ),
          SizedBox(
            width: 180,
            child: Center(
              child: Text(
                'Số lượng',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
              ),
            ),
          ),
          SizedBox(
            width: 150,
            child: Center(
              child: Text(
                'TlTT/TLKT',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
              ),
            ),
          ),
          SizedBox(
            width: 150,
            child: Center(
              child: Text(
                'Giá cước VC',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
              ),
            ),
          ),
          SizedBox(
            width: 200,
            child: Center(
              child: Text(
                'Cước VC',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
              ),
            ),
          ),
          SizedBox(
            width: 100,
            child: Center(
              child: Text(
                'Giảm giá',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
              ),
            ),
          ),
          SizedBox(
            width: 100,
            child: Center(
              child: Text(
                'Phụ thu',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
              ),
            ),
          ),
          SizedBox(
            width: 100,
            child: Center(
              child: Text(
                'Tổng tiền',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
