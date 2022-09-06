import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
import 'package:ceremony/classes/preferences.dart';
import 'package:ceremony/classes/security.dart';
import 'package:ceremony/classes/sheets.dart';
import 'package:ceremony/classes/user.dart';
import 'package:ceremony/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:iconsax/iconsax.dart';
import 'package:local_auth/local_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String welcome = "";
  getWelcome() async {
    var hasToken = await Cache().hasToken();
    if (hasToken) {
      var token = await Cache().getToken();
      var user = User.fromToken(token);
      setState(() {
        welcome = "Witaj, ${user.name}";
      });
    } else {
      setState(() {
        welcome = "";
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getWelcome();
  }

  Future<bool> authenticate() async {
    try {
      return await LocalAuthentication().authenticate(
        localizedReason: 'Ceremony',
        options: const AuthenticationOptions(
          biometricOnly: true,
          useErrorDialogs: true,
          stickyAuth: false,
        ),
      );
    } on PlatformException {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    var token = encrypt(
        'CRMNY+C 0 0+Jan+Kowalski+07.05.2006+0+2023-05+14.05.2023+31.12.2023+1+św. Jana Kantego+4+Kraków+6+0 0 0+0#01.01.2022 0#01.01.2022 0#01.01.2022 0#01.01.2022 0#01.01.2022 0#01.01.2022 0#01.01.2022 0#01.01.2022 0#01.01.2022 0#01.01.2022+0');

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              SvgPicture.asset(
                'lib/assets/cer.svg',
                width: 200,
              ),
              Center(
                child: Text(
                  "Ceremony\nArchidiecezji Krakowskiej",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Center(
                child: Text(
                  welcome,
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                      color: Colors.black26,
                      fontWeight: FontWeight.w700,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  fixedSize: const Size(200, 50),
                  alignment: Alignment.center,
                  elevation: 0,
                  primary: HexColor('1e4e82'),
                  side: BorderSide(
                    width: 3,
                    color: HexColor('1e4e82'),
                    style: BorderStyle.solid,
                  ),
                ),
                child: const Center(
                  child: Text("ZALOGUJ"),
                ),
                onPressed: () async {
                  var hasToken = await Cache().hasToken();
                  if (hasToken) {
                    var token = await Cache().getToken();
                    var user = User.fromToken(token);
                    var valid = await user.valid();
                    var stamp = await TimeNow().getStamp();
                    if (user.pin == '0') {
                      // ignore: use_build_context_synchronously
                      await showFirstPinBar(context, user);
                    } else {
                      var ifSecureLogin = await Cache().ifSecureLogin();
                      if (!ifSecureLogin) {
                        authenticate().then((authenticated) async {
                          if (authenticated) {
                            await Future.delayed(
                                const Duration(milliseconds: 500));
                            Get.offAll(
                              () => Navigate(0, user, valid, stamp),
                              transition: Transition.fadeIn,
                              curve: Curves.ease,
                              duration: const Duration(milliseconds: 1000),
                            );
                          }
                        });
                      } else {
                        // ignore: unused_local_variable
                        var enteredPin = await Get.to(
                          () => const PinPad(),
                          transition: Transition.fadeIn,
                          duration: const Duration(milliseconds: 600),
                        );
                        if (enteredPin == user.pin) {
                          await Future.delayed(
                              const Duration(milliseconds: 700));
                          Get.offAll(
                            () => Navigate(0, user, valid, stamp),
                            transition: Transition.fadeIn,
                            curve: Curves.ease,
                            duration: const Duration(milliseconds: 1000),
                          );
                        } else {
                          if (enteredPin != null) {
                            await Future.delayed(
                                const Duration(milliseconds: 700));
                            showErrorAlert("Błędny PIN", "Spróbuj ponownie");
                          }
                        }
                      }
                    }
                  } else {
                    var availability = await FlutterNfcKit.nfcAvailability;
                    if (availability == NFCAvailability.not_supported) {
                      showErrorAlert('NFC', 'Brak dostępu do modułu NFC');
                    } else {
                      await showLoginIDScanner();
                    }
                  }
                },
              ),
              const SizedBox(height: 50),
              OutlinedButton(
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
                  await Cache().setToken(token);
                  var availability = await FlutterNfcKit.nfcAvailability;
                  if (availability == NFCAvailability.not_supported) {
                    showErrorAlert('NFC', 'Brak dostępu do modułu NFC');
                  } else {
                    var tag = await FlutterNfcKit.poll(
                        timeout: const Duration(seconds: 10),
                        iosMultipleTagMessage: "Wykryto wiele kart",
                        iosAlertMessage: "Zbliż e-Legitymację");
                  }
                },
                child: const Icon(
                  Iconsax.mirroring_screen,
                  size: 50,
                  color: Colors.black26,
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
