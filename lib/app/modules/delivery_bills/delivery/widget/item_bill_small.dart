import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vncss/app/modules/common_widget/const.dart';

class ItemBillSmall extends StatelessWidget {
  final String head, endText;
  final bool status;

  const ItemBillSmall({
    super.key,
    required this.head,
    required this.endText,
    this.status = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
        decoration: const BoxDecoration(),
        child: Column(
          children: [
            status
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        head,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          endText,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 16),
                        ),
                      )
                    ],
                  )
                : Row(
                    children: [
                      Text(
                        head,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        endText,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 16),
                      )
                    ],
                  ),
            const Divider()
          ],
        ));
  }
}

class ItemBillSmall2 extends StatelessWidget {
  final String head, endText;
  final Color? color;
  final bool align;

  const ItemBillSmall2({
    super.key,
    required this.head,
    required this.endText,
    this.color,
    this.align = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: const BoxDecoration(),
      child: Row(
        crossAxisAlignment:
            align  ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              head,
              style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: ColorApp.grey74),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              endText,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.end,
              style: TextStyle(
                  fontSize: 13, fontWeight: FontWeight.w700, color: color),
            ),
          )
        ],
      ),
    );
  }
}

class ItemBillSmall3 extends StatelessWidget {
  final String head;

  const ItemBillSmall3({
    super.key,
    required this.head,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4),
      decoration: const BoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            head,
            style: const TextStyle(fontWeight: FontWeight.w400),
          ),
          const Divider()
        ],
      ),
    );
  }
}
