
import 'package:flutter/material.dart';
import 'package:vncss/app/modules/common_widget/const.dart';


class ItemChoose extends StatelessWidget {
  final IconData pre;
  final String title;

  const ItemChoose(
      {super.key,
      required this.pre,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      margin: const EdgeInsets.only(top: 16),
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(width: 0.5, color: Colors.grey))),
      child: Row(
        children: [
          Icon(pre,  color: primaryColor,),
          const SizedBox(
            width: 10,
          ),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 13,fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
