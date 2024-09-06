import 'package:flutter/material.dart';

class CustomItem extends StatelessWidget {
  final IconData? leading;
  final String? text;
  final String? textTotal;
  final Color? color;
  const CustomItem(
      {
        this.leading,
        this.text,
        this.textTotal,
        this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Icon(
                leading,
                size: 24,
                color: color,
              )),
          Expanded(
              flex: 4,
              child: Text(
                "$text",
                style: const TextStyle(
                    color: Color(0xff1f1f1f),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Roboto"),
              )),
          Expanded(
              flex: 4,
              child: Text(
                "$textTotal",
                style: const TextStyle(
                    color: Color(0xffe1655b),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Roboto"),
              )),
          const Expanded(
              flex: 1,
              child: Icon(
                Icons.arrow_forward_ios,
                size: 24,
                color: Color(0xff858585),
              ))
        ],
      ),
    );
  }
}
