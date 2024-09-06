
import 'package:flutter/material.dart';
import 'package:vncss/app/modules/common_widget/const.dart';

class ItemChoose extends StatelessWidget {
  final Function onTap;
  final IconData pre;
  final String title;

  const ItemChoose(
      {super.key,
      required this.onTap,
      required this.pre,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap as void Function()?,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
        margin: const EdgeInsets.only(top: 8),
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(width: 0.5, color: Colors.grey))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(pre,  color: ColorApp.greyD7,),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  title,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}
