import 'package:flutter/material.dart';
import 'package:vncss/app/modules/common_widget/const.dart';
import 'package:vncss/app/modules/common_widget/button_widget.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String? content;
  final Widget? widget;
  final String? textYes;
  final String? textNo;
  final bool showContent;
  final Function onTapYes, onTapNo;

  const CustomDialog(
      {super.key,
      required this.title,
      required this.onTapYes,
      required this.onTapNo,
      this.content,
      this.textYes,
      this.textNo,
      this.widget,
      this.showContent = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: AlertDialog(
        actionsPadding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16))),
        contentPadding: EdgeInsets.zero,
        title: Center(
            child: Column(
          children: [
            Text(title),
            showContent
                ? Container(
                    child: widget,
                  )
                : const SizedBox()
          ],
        )),
        titleTextStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Color(0xff353535)),
        backgroundColor: ColorApp.whiteFA,
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ButtonWidget(
                  buttonText: textYes ?? "có",
                  borderColor: primaryColor,
                  textColor: primaryColor,
                  onTap: onTapYes,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: ButtonWidget(
                  buttonText: textNo ?? "không",
                  bgcolor: primaryColor,
                  textColor: ColorApp.whiteFA,
                  onTap: onTapNo,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CustomDialogShipper extends StatelessWidget {
  final String title;
  final Function onTapYes, onTapNo;
  final String? textYes;
  final String? textNo;
  final Widget? widget;

  const CustomDialogShipper(
      {super.key,
      required this.title,
      required this.onTapYes,
      this.textYes,
      this.textNo,
      required this.onTapNo,
      this.widget});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsPadding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16))),
      title: Center(
        child: Column(
          children: [
            Text(title),
            const SizedBox(
              height: 16,
            ),
            Container(child: widget),
          ],
        ),
      ),
      titleTextStyle: const TextStyle(
          fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xff353535)),
      backgroundColor: ColorApp.whiteFA,
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ButtonWidget(
                buttonText: textNo ?? "Hủy",
                borderColor: primaryColor,
                textColor: primaryColor,
                onTap: onTapNo,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: ButtonWidget(
                buttonText: textYes ?? "Cập nhật",
                bgcolor: primaryColor,
                textColor: ColorApp.whiteFA,
                onTap: onTapYes,
              ),
            ),
          ],
        )
      ],
    );
  }
}
