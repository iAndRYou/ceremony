import 'dart:async';
import 'dart:io';
import 'package:ceremony/classes/preferences.dart';
import 'package:ceremony/classes/security.dart';
import 'package:ceremony/classes/sheets.dart';
import 'package:ceremony/classes/user.dart';
import 'package:ceremony/options/about.dart';
import 'package:ceremony/options/sec.dart';
import 'package:ceremony/options/who.dart';
import 'package:ceremony/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class OptionsPage extends StatefulWidget {
  const OptionsPage({Key? key}) : super(key: key);

  @override
  State<OptionsPage> createState() => _OptionsPageState();
}

class _OptionsPageState extends State<OptionsPage> with WidgetsBindingObserver {
  late Timer _updateTimer;
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    _updateTimer.cancel();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (Platform.isIOS && state == AppLifecycleState.resumed) {
      _updateTimer.cancel();
    } else if (Platform.isAndroid && state == AppLifecycleState.resumed) {
      _updateTimer.cancel();
    }
    if (Platform.isIOS && state == AppLifecycleState.paused) {
      _updateTimer = Timer(const Duration(seconds: 5), () => secureBack());
    } else if (Platform.isAndroid && state == AppLifecycleState.paused) {
      _updateTimer = Timer(const Duration(seconds: 5), () => secureBack());
    }
  }

  secureBack() async {
    Get.offAll(
      () => const LoginPage(),
      transition: Transition.noTransition,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 700),
    );
    Future.delayed(const Duration(milliseconds: 500));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: OutlinedButton(
          style: OutlinedButton.styleFrom(
            primary: Colors.white,
            side: const BorderSide(
              color: Colors.white,
            ),
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(1500)),
          ),
          onPressed: () async {
            Get.back();
          },
          child: const Icon(
            Iconsax.arrow_left_2,
            size: 30,
            color: Colors.black87,
          ),
        ),
        title: Text(
          "Opcje",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Divider(
            height: 3,
            color: Theme.of(context).dividerColor,
          ),
          ListTile(
            dense: true,
            title: Text(
              "Kim jest Ceremoniarz?",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            trailing: OutlinedButton(
              style: OutlinedButton.styleFrom(
                primary: Colors.white,
                side: const BorderSide(
                  color: Colors.white,
                ),
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(1500)),
              ),
              onPressed: () {
                Get.to(() => const WhoIs(), transition: Transition.cupertino);
              },
              child: const Icon(
                Iconsax.message_question,
                size: 30,
                color: Colors.black87,
              ),
            ),
          ),
          Divider(
            height: 3,
            color: Theme.of(context).dividerColor,
          ),
          ListTile(
            dense: true,
            title: Text(
              "Bezpieczeństwo",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            trailing: OutlinedButton(
              style: OutlinedButton.styleFrom(
                primary: Colors.white,
                side: const BorderSide(
                  color: Colors.white,
                ),
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(1500)),
              ),
              onPressed: () {
                Get.to(() => const SecurityOptions(),
                    transition: Transition.cupertino);
              },
              child: const Icon(
                Iconsax.key,
                size: 30,
                color: Colors.black87,
              ),
            ),
          ),
          Divider(
            height: 3,
            color: Theme.of(context).dividerColor,
          ),
          ListTile(
            dense: true,
            title: Text(
              "Aktualizuj dane",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            trailing: OutlinedButton(
              style: OutlinedButton.styleFrom(
                primary: Colors.white,
                side: const BorderSide(
                  color: Colors.white,
                ),
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(1500)),
              ),
              onPressed: () async {
                if (Platform.isAndroid) {
                  // TODO: Implement scan UI for Android
                }
                if (Platform.isIOS) {
                  var cachedToken = await Cache().getToken();
                  var gotToken = await readToken();
                  if (gotToken != null) {
                    var cachedUser = User.fromToken(cachedToken);
                    var gotUser = User.fromToken(gotToken);
                    if (cachedUser.id == gotUser.id) {
                      await Cache().setToken(gotToken);
                      await Future.delayed(const Duration(milliseconds: 2800));
                      showCompleteAlert(
                          "Zaktualizowano", "Zapisano dane pomyślnie");
                    } else {
                      showErrorAlert(
                          "Błąd zapisywania", "Niepoprawny dokument");
                    }
                  }
                }
              },
              child: const Icon(
                Iconsax.refresh,
                size: 30,
                color: Colors.black87,
              ),
            ),
          ),
          Divider(
            height: 3,
            color: Theme.of(context).dividerColor,
          ),
          ListTile(
            dense: true,
            title: Text(
              "Przedłuż ważność",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            trailing: OutlinedButton(
              style: OutlinedButton.styleFrom(
                primary: Colors.white,
                side: const BorderSide(
                  color: Colors.white,
                ),
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(1500)),
              ),
              onPressed: () async {},
              child: const Icon(
                Iconsax.calendar_tick,
                size: 30,
                color: Colors.black87,
              ),
            ),
          ),
          Divider(
            height: 3,
            color: Theme.of(context).dividerColor,
          ),
          ListTile(
            dense: true,
            title: Text(
              "O aplikacji",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            trailing: OutlinedButton(
              style: OutlinedButton.styleFrom(
                primary: Colors.white,
                side: const BorderSide(
                  color: Colors.white,
                ),
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(1500)),
              ),
              onPressed: () {
                Get.to(() => const AboutPage(),
                    transition: Transition.noTransition, popGesture: false);
              },
              child: const Icon(
                Iconsax.book_1,
                size: 30,
                color: Colors.black87,
              ),
            ),
          ),
          Divider(
            height: 3,
            color: Theme.of(context).dividerColor,
          ),
          ListTile(
            dense: true,
            title: Text(
              "Pomoc",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            trailing: OutlinedButton(
              style: OutlinedButton.styleFrom(
                primary: Colors.white,
                side: const BorderSide(
                  color: Colors.white,
                ),
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(1500)),
              ),
              onPressed: () async {},
              child: const Icon(
                Iconsax.information,
                size: 30,
                color: Colors.black87,
              ),
            ),
          ),
          Divider(
            height: 3,
            color: Theme.of(context).dividerColor,
          ),
        ],
      ),
    );
  }
}
