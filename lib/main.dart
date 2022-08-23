import 'package:flutter/material.dart';
import 'package:ceremony/themes/themes.dart';
import 'package:flutter/services.dart';
import 'package:ceremony/screens/login.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const App());
}

// ignore: must_be_immutable
class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: lightThemeData(),
      darkTheme: lightThemeData(),
      home: const LoginPage(),
    );
  }
}
