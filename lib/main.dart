import 'package:ceremony/classes/preferences.dart';
import 'package:ceremony/screens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:ceremony/themes/themes.dart';
import 'package:flutter/services.dart';
import 'package:ceremony/screens/login.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  final ifFirstCheck = await Cache().ifFirstBoot() ? true : false;

  runApp(App(
    ifFirstBoot: ifFirstCheck,
  ));
}

// ignore: must_be_immutable
class App extends StatelessWidget {
  final bool ifFirstBoot;
  const App({
    Key? key,
    required this.ifFirstBoot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightThemeData(),
      darkTheme: lightThemeData(),
      home: ifFirstBoot ? const WelcomePage() : const LoginPage(),
    );
  }
}
