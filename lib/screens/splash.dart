import 'package:ceremony/classes/preferences.dart';
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
    goLogin();
    super.initState();
  }

  goLogin() async {
    await Future.delayed(const Duration(milliseconds: 700));
    Get.offAll(
      () => const LoginPage(),
      transition: Transition.fadeIn,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 1000),
    );
  }

  androidHandling() async {
    var page = await Cache().androidPageGet();
    switch (page) {
      case "login":
        await Future.delayed(const Duration(milliseconds: 500));
        Get.offAll(
          () => const LoginPage(),
          transition: Transition.fadeIn,
          curve: Curves.ease,
          duration: const Duration(milliseconds: 1000),
        );
        break;
      default:
        await Future.delayed(const Duration(milliseconds: 500));
        Get.offAll(
          () => const LoginPage(),
          transition: Transition.fadeIn,
          curve: Curves.ease,
          duration: const Duration(milliseconds: 1000),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              SvgPicture.asset(
                'lib/assets/cer.svg',
                width: 200,
              ),
              const SizedBox(height: 60),
              const Center(
                child: CupertinoActivityIndicator(
                  animating: true,
                  radius: 25,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
