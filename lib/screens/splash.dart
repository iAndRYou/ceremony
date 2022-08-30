import 'package:ceremony/screens/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool animate = false;
  @override
  void initState() {
    super.initState();
    goHome();
  }

  goHome() async {
    await Future.delayed(const Duration(milliseconds: 1500));
    Get.to(
      () => const LoginPage(),
      transition: Transition.fadeIn,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 1500),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: MediaQuery.of(context).size.width / 2 - 100,
            top: MediaQuery.of(context).size.height / 2 - 220,
            child: SvgPicture.asset(
              'lib/assets/cer.svg',
              width: 200,
            ),
          ),
          Positioned(
              left: MediaQuery.of(context).size.width / 2 - 25,
              top: MediaQuery.of(context).size.height / 2 + 140,
              child: const CupertinoActivityIndicator(
                animating: true,
                radius: 25,
              )),
        ],
      ),
    );
  }
}
