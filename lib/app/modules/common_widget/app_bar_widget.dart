import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'const.dart';

class AppBarWidget extends StatelessWidget {
  final String title;
  final Function()? onBack;
  final Function()? onFilter;
  final bool showFilter;
  final bool disOnBack;

  const AppBarWidget(
      {super.key,
      required this.title,
      this.onBack,
      this.onFilter,
      this.showFilter = false,
      this.disOnBack = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 0),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Stack(
          children: [
            SizedBox(
              height: 30,
              child: Center(
                child: Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: textPrimary),
                ),
              ),
            ),
            disOnBack
                ? const SizedBox()
                : Positioned(
                    left: 0,
                    top: 5,
                    child: GestureDetector(
                        onTap: onBack as void Function()?,
                        child: const Icon(Icons.arrow_back))),
            showFilter
                ? Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                        onTap: onFilter as void Function()?,
                        child: SvgPicture.asset("assets/image/filter1.svg")))
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
