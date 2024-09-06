import 'dart:async';


import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:vncss/app/modules/authencation/views/sign_in_src.dart';


class SplashScr extends StatefulWidget {
  const SplashScr({super.key});

  @override
  State<SplashScr> createState() => _SplashScrState();
}

class _SplashScrState extends State<SplashScr> {
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(microseconds: 500), () {
      setState(() {
        _visible = true;
      });
      Future.delayed(const Duration(milliseconds: 4000),(){
        Get.to(()=> const SignInScr());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        //mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedOpacity(
            opacity: _visible ? 1 : 0,
            duration: const Duration(milliseconds: 500),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Transform.scale(
                  scale: 1.5,
                  child: SvgPicture.asset(
                    "assets/image/logo.svg",
                  ),
                ),
                const SizedBox(height: 30,),
                AnimatedOpacity(
                  opacity: _visible ? 1 : 0,
                  duration: const Duration(milliseconds: 1000),
                  child: Transform.scale(
                      scale: 1.3,
                      child: SvgPicture.asset(
                        "assets/image/content_app.svg",
                      )),
                ),
                AnimatedOpacity(
                  opacity: _visible ? 1 : 0,
                  duration: const Duration(milliseconds: 3000),
                  child: SizedBox(
                      height: 280,
                      width: context.width,
                      child: const Image(
                        image: AssetImage("assets/image/running_app.png"),
                        fit: BoxFit.contain,
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
