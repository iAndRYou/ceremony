import 'package:ceremony/classes/preferences.dart';
import 'package:ceremony/classes/security.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SecurityOptions extends StatefulWidget {
  const SecurityOptions({Key? key}) : super(key: key);

  @override
  State<SecurityOptions> createState() => _SecurityOptionsState();
}

class _SecurityOptionsState extends State<SecurityOptions> {
  bool ifSecureLogin = false;

  @override
  void initState() {
    Cache().ifSecureLogin().then((value) {
      if (mounted) {
        setState(() {
          ifSecureLogin = value;
        });
      }
    });

    super.initState();
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
          "Bezpieczeństwo",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          const Divider(
            height: 3,
            color: Colors.white,
          ),
          ListTile(
            dense: true,
            title: Text(
              "Bezpieczne logowanie",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            trailing: CupertinoSwitch(
                value: ifSecureLogin,
                onChanged: (value) async {
                  if (ifSecureLogin) {
                    await Cache().setIfSecureLogin('false');
                  } else {
                    await Cache().setIfSecureLogin('true');
                  }
                  setState(() {
                    ifSecureLogin = !ifSecureLogin;
                  });
                }),
          ),
          const Divider(
            height: 3,
            color: Colors.white,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
            child: Text(
              "Logowanie do aplikacji wykorzystuje skaner odcisków palców, albo system rozpoznawania twarzy.",
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.justify,
            ),
          ),
          const Divider(
            height: 3,
            color: Colors.white,
          ),
          ListTile(
            dense: true,
            title: Text(
              "Zmień PIN e-legitymacji",
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
                await changePIN();
              },
              child: const Icon(
                Iconsax.edit,
                size: 30,
                color: Colors.black87,
              ),
            ),
          ),
          const Divider(
            height: 3,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
