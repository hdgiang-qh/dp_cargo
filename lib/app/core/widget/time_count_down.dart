import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../values/app_colors.dart';

class TimeCountDown extends StatefulWidget {
  final TextStyle textStyle;
  final Duration duration;
  final VoidCallback voidCallback;

  const TimeCountDown({super.key, required this.textStyle, required this.duration, required this.voidCallback});

  @override
  State<TimeCountDown> createState() => _TimeCountDownState();
}

class _TimeCountDownState extends State<TimeCountDown> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Countdown(
        style: widget.textStyle,
        controller: _controller,
        voidCallback: widget.voidCallback,
        animation: StepTween(
          begin: widget.duration.inSeconds,
          end: 0,
        ).animate(_controller),
      ),
    );
  }
}

class Countdown extends AnimatedWidget {
  final AnimationController controller;
  final VoidCallback voidCallback;

  const Countdown({
    super.key,
    required this.animation,
    required this.style,
    required this.controller,
    required this.voidCallback,
  }) : super(listenable: animation);
  final Animation<int> animation;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    Duration clockTimer = Duration(seconds: animation.value);

    // String timerText =
    //     '${(clockTimer.inSeconds.remainder(60) % 60).toString()}';
    String timerText = "${clockTimer.inSeconds}s";
    return GestureDetector(
      onTap: () {
        if (clockTimer.inSeconds == 0) {
          controller.reset();
          controller.forward();
          voidCallback();
        }
      },
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
            text: clockTimer.inSeconds > 0 ? S.of(context).resent_otp_after : S.of(context).resent,
            style: style.copyWith(color: AppColors.text_black),
          ),
          TextSpan(
            text: clockTimer.inSeconds > 0 ? timerText : "",
            style: style.copyWith(color: AppColors.errorColor),
          )
        ]),
      ),
    );
  }
}
