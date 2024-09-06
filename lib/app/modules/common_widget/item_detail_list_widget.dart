import 'package:flutter/material.dart';
import 'package:vncss/app/modules/common_widget/const.dart';

class ItemDetailListWidget extends StatelessWidget {
  final String head, endText;
  final Color? color;
  final bool align;
  final bool fontWeight;
  final double fontSize;
  final bool imageAvt;
  final bool isCode25;
  final Function()? onTap;

  const ItemDetailListWidget({
    super.key,
    required this.head,
    required this.endText,
    this.color,
    this.align = false,
    this.fontWeight = false,
    this.fontSize = 13,
    this.imageAvt = false,
    this.isCode25 = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    String displayEndText = endText.length > 25
        ? '...${endText.substring(endText.length - 25)}'
        : endText;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
      decoration: const BoxDecoration(),
      child: Row(
        crossAxisAlignment:
            align ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              head,
              style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w400,
                  color: textPrimary),
            ),
          ),
          Expanded(
            flex: 3,
            child: imageAvt
                ? endText != "--"
                    ? GestureDetector(
                        onTap: onTap as void Function()?,
                        child: Container(
                          height: 90,
                          width: 100,
                          alignment: Alignment.centerRight,
                          child: Image.network(
                            endText,
                          ),
                        ),
                      )
                    : Text(
                        endText,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            fontSize: fontSize,
                            fontWeight:
                                fontWeight ? FontWeight.w700 : FontWeight.w400,
                            color: color ?? textPrimary),
                      )
                : Text(
                    isCode25 ? displayEndText : endText,
                    maxLines: isCode25 ? 1 : 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        fontSize: fontSize,
                        fontWeight:
                            fontWeight ? FontWeight.w700 : FontWeight.w400,
                        color: color ?? textPrimary),
                  ),
          )
        ],
      ),
    );
  }
}
