import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sophie_messenger_app/utilities/components/custom_page_body.dart';
import 'package:sophie_messenger_app/utilities/theme/media.dart';

import '../../../handlers/shared_handler.dart';
import '../../../routers/navigator.dart';
import '../../../routers/routers.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> opacityAnimation;

  _setAnimation() {
    controller = AnimationController(vsync: this, duration: const Duration(seconds: 300));
    opacityAnimation = Tween<double>(end: 1, begin: 0).animate(controller);
    controller.forward();
    controller.addListener(() => setState(() {}));
  }

  @override
  void initState() {
    Timer(
      const Duration(seconds: 2),
      () {
        if (SharedHandler.instance!.getData(key: SharedKeys().isLogin, valueType: ValueType.bool)) {
          CustomNavigator.push(Routes.register);
        } else {
          CustomNavigator.push(Routes.register);
        }
      },
    );
    _setAnimation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPageBody(
     
      body: Container(
        color: HexColor("56cfca"),
        width: MediaHelper.width,
        height: MediaHelper.height,
        child: Column(
          children: [
            Expanded(
              child: AnimatedContainer(

                duration: const Duration(seconds: 200),
                child: Center(
                  child: Text("Sophie",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,fontSize: 55),)
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
