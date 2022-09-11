import 'dart:async';

import 'package:ceremony/classes/security.dart';
import 'package:ceremony/classes/user.dart';
import 'package:ceremony/classes/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

showErrorAlert(title, message) {
  Get.snackbar(
    title,
    message,
    icon: const Icon(CupertinoIcons.exclamationmark, color: Colors.redAccent),
    snackPosition: SnackPosition.BOTTOM,
    margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
    animationDuration: const Duration(milliseconds: 800),
    duration: const Duration(milliseconds: 1200),
    backgroundColor: Colors.white,
    borderColor: Colors.black12,
    borderWidth: 1,
    overlayBlur: 2,
  );
}

showAdminAlert(title, message) {
  Get.snackbar(
    title,
    message,
    icon: const Icon(CupertinoIcons.question, color: Colors.orangeAccent),
    snackPosition: SnackPosition.BOTTOM,
    margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
    animationDuration: const Duration(milliseconds: 600),
    duration: const Duration(milliseconds: 1200),
    backgroundColor: Colors.white,
    borderColor: Colors.black12,
    borderWidth: 1,
    overlayBlur: 2,
  );
}

showCompleteAlert(title, message) {
  Get.snackbar(
    title,
    message,
    icon: const Icon(CupertinoIcons.checkmark_alt, color: Colors.green),
    snackPosition: SnackPosition.BOTTOM,
    margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
    animationDuration: const Duration(milliseconds: 600),
    duration: const Duration(milliseconds: 1200),
    backgroundColor: Colors.white,
    borderColor: Colors.black12,
    borderWidth: 1,
    overlayBlur: 2,
  );
}

class PinPad extends StatefulWidget {
  const PinPad({Key? key}) : super(key: key);

  @override
  State<PinPad> createState() => _PinPadState();
}

class _PinPadState extends State<PinPad> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
      ),
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
              Text(
                "Podaj PIN",
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
                child: PinCodeTextField(
                  appContext: context,
                  length: 4,
                  onChanged: (String value) async {
                    if (value.length == 4) {
                      Get.back(result: value);
                    }
                  },
                  keyboardType: const TextInputType.numberWithOptions(
                      signed: false, decimal: false),
                  useHapticFeedback: true,
                  autoFocus: true,
                  autoUnfocus: true,
                  autoDismissKeyboard: true,
                  useExternalAutoFillGroup: false,
                  blinkWhenObscuring: false,
                  showCursor: false,
                  obscureText: true,
                  enableActiveFill: false,
                  enablePinAutofill: false,
                  obscuringWidget: Container(
                    height: 15,
                    width: 15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.black,
                    ),
                  ),
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.circle,
                    fieldHeight: 15,
                    fieldWidth: 15,
                    fieldOuterPadding: const EdgeInsets.all(10),
                    borderWidth: 1,
                    inactiveColor: Colors.black26,
                    activeColor: Colors.black,
                    selectedColor: HexColor('1e4e82'),
                    activeFillColor: Colors.black,
                  ),
                  animationType: AnimationType.none,
                  animationDuration: const Duration(milliseconds: 0),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

class ChangePinPad extends StatefulWidget {
  final String prompt;
  final String title;
  const ChangePinPad({
    Key? key,
    required this.title,
    required this.prompt,
  }) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<ChangePinPad> createState() => _ChangePinPadState(title, prompt);
}

class _ChangePinPadState extends State<ChangePinPad> {
  String title;
  String prompt;
  _ChangePinPadState(this.title, this.prompt);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          title,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 176),
              const Icon(
                Iconsax.edit,
                size: 100,
                color: Colors.black54,
              ),
              const SizedBox(height: 50),
              Text(
                prompt,
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
                child: PinCodeTextField(
                  appContext: context,
                  length: 4,
                  onChanged: (String value) async {
                    if (value.length == 4) {
                      Get.back(result: value);
                    }
                  },
                  keyboardType: const TextInputType.numberWithOptions(
                      signed: false, decimal: false),
                  useHapticFeedback: true,
                  autoFocus: true,
                  autoUnfocus: true,
                  autoDismissKeyboard: true,
                  useExternalAutoFillGroup: false,
                  blinkWhenObscuring: false,
                  showCursor: false,
                  obscureText: true,
                  enableActiveFill: false,
                  enablePinAutofill: false,
                  obscuringWidget: Container(
                    height: 15,
                    width: 15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.black,
                    ),
                  ),
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.circle,
                    fieldHeight: 15,
                    fieldWidth: 15,
                    fieldOuterPadding: const EdgeInsets.all(10),
                    borderWidth: 1,
                    inactiveColor: Colors.black26,
                    activeColor: Colors.black,
                    selectedColor: HexColor('1e4e82'),
                    activeFillColor: Colors.black,
                  ),
                  animationType: AnimationType.none,
                  animationDuration: const Duration(milliseconds: 0),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

class LogoutPad extends StatefulWidget {
  const LogoutPad({Key? key}) : super(key: key);

  @override
  State<LogoutPad> createState() => _LogoutPadState();
}

class _LogoutPadState extends State<LogoutPad> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          "Wyloguj",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 176),
              const Icon(
                Iconsax.logout,
                size: 100,
                color: Colors.black54,
              ),
              const SizedBox(height: 50),
              Text(
                "Podaj PIN",
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
                child: PinCodeTextField(
                  appContext: context,
                  length: 4,
                  onChanged: (String value) async {
                    if (value.length == 4) {
                      Get.back(result: value);
                    }
                  },
                  keyboardType: const TextInputType.numberWithOptions(
                      signed: false, decimal: false),
                  useHapticFeedback: true,
                  autoFocus: true,
                  autoUnfocus: true,
                  autoDismissKeyboard: true,
                  useExternalAutoFillGroup: false,
                  blinkWhenObscuring: false,
                  showCursor: false,
                  obscureText: true,
                  enableActiveFill: false,
                  enablePinAutofill: false,
                  obscuringWidget: Container(
                    height: 15,
                    width: 15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.black,
                    ),
                  ),
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.circle,
                    fieldHeight: 15,
                    fieldWidth: 15,
                    fieldOuterPadding: const EdgeInsets.all(10),
                    borderWidth: 1,
                    inactiveColor: Colors.black26,
                    activeColor: Colors.black,
                    selectedColor: HexColor('1e4e82'),
                    activeFillColor: Colors.black,
                  ),
                  animationType: AnimationType.none,
                  animationDuration: const Duration(milliseconds: 0),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

class Stamp extends StatefulWidget {
  const Stamp({Key? key}) : super(key: key);

  @override
  State<Stamp> createState() => _StampState();
}

class _StampState extends State<Stamp> {
  String stamp = "";
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    var refreshedStamp = "";
    _timer = Timer.periodic(
      const Duration(milliseconds: 10),
      (timer) async {
        refreshedStamp = await TimeNow().getStamp();
        if (mounted) {
          setState(() {
            stamp = refreshedStamp;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      "Stan na dzień:   $stamp",
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}

class NFCScanner extends StatefulWidget {
  final String title;
  const NFCScanner({required this.title, Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<NFCScanner> createState() => _NFCScannerState(title);
}

class _NFCScannerState extends State<NFCScanner> {
  String title;
  late Timer _timer;
  bool inSession = false;
  bool reading = false;
  bool success = false;
  bool failed = false;
  String message = "Szukam";
  _NFCScannerState(this.title);

  Future<String?> read() async {
    var tag = await FlutterNfcKit.poll(
        timeout: const Duration(seconds: 10),
        androidPlatformSound: false,
        readIso14443A: true,
        readIso14443B: true,
        readIso15693: false,
        readIso18092: false,
        probeWebUSBMagic: false,
        iosMultipleTagMessage: "Wykryto wiele kart",
        iosAlertMessage: "Zbliż e-Legitymację");

    if (tag.ndefWritable == false) {
      setState(() {
        failed = true;
        message = "Niepoprawny format";
      });

      await FlutterNfcKit.finish(iosErrorMessage: "Niepoprawny format");
    } else {
      setState(() {
        reading = true;
        message = "Pobieranie danych";
      });

      await FlutterNfcKit.setIosAlertMessage("Pobieranie danych");
      await Future.delayed(const Duration(milliseconds: 500));
      try {
        var data = await FlutterNfcKit.readNDEFRecords(cached: false);
        var identity = data[0].toString().split("/check/")[1];
        var token = data[0].toString().split("/check/")[0].split("uri=")[1];

        setState(() {
          reading = true;
          message = "Szyfrowanie";
        });

        await FlutterNfcKit.setIosAlertMessage("Szyfrowanie");
        await Future.delayed(const Duration(milliseconds: 500));
        if (tag.id.toString() == decrypt(identity) && checkToken(token)) {
          setState(() {
            success = true;
            message = "Odczytano dane";
          });

          await FlutterNfcKit.finish(iosAlertMessage: "Odczytano dane");
          return token;
        } else {
          setState(() {
            failed = true;
            message = "Niepoprawny dokument";
          });

          await FlutterNfcKit.finish(iosErrorMessage: "Niepoprawny dokument");
          return null;
        }
      } catch (e) {
        setState(() {
          failed = true;
          message = "Błąd odczytu";
        });

        await FlutterNfcKit.finish(iosErrorMessage: "Błąd odczytu");
        return null;
      }
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    int count = 0;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      setState(() {
        count++;
      });

      if (inSession && !reading && !success && !failed) {
        if (count % 4 != 0) {
          message += ".";
        } else {
          message = "Szukam";
        }
      } else if (reading) {
        setState(() {
          count = 0;
        });
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.white),
        child: Column(
          children: [
            Expanded(
              child: Container(),
            ),
            success
                ? Icon(
                    Iconsax.tick_square,
                    size: 100,
                    color: Colors.green.withOpacity(0.8),
                  )
                : failed
                    ? Icon(
                        Iconsax.close_square,
                        size: 100,
                        color: Colors.red.withOpacity(0.8),
                      )
                    : const Icon(
                        Iconsax.mirroring_screen,
                        size: 100,
                        color: Colors.black54,
                      ),
            const SizedBox(
              height: 30,
            ),
            reading
                ? Text(
                    "",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                        color: Colors.black26,
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                  )
                : Text(
                    "Zbliż e-Legitymację",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                        color: Colors.black26,
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                  ),
            const SizedBox(
              height: 10,
            ),
            inSession
                ? OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      fixedSize: const Size(200, 50),
                      alignment: Alignment.center,
                      elevation: 0,
                      primary: Colors.white,
                      side: const BorderSide(
                        width: 3,
                        color: Colors.white,
                        style: BorderStyle.solid,
                      ),
                    ),
                    onPressed: null,
                    child: Center(
                      child: Text(
                        message,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                            color: Colors.black26,
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  )
                : OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      fixedSize: const Size(200, 50),
                      alignment: Alignment.center,
                      elevation: 0,
                      primary: Colors.black26,
                      side: const BorderSide(
                        width: 3,
                        color: Colors.black26,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: const Center(
                      child: Text("SKANUJ"),
                    ),
                    onPressed: () async {
                      setState(() {
                        inSession = true;
                      });
                      var readToken = await read();
                      Get.back();
                    },
                  ),
            Expanded(
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}

showDocumentScanned(String token) async {
  var user = User.fromToken(token);
  var valid = await user.valid();
  await Future.delayed(const Duration(milliseconds: 2800));
  Get.bottomSheet(
    Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Icon(
              Iconsax.arrow_down_1,
              color: Colors.white,
              size: 30,
            ),
          ),
          Document(user, valid),
          const SizedBox(
            height: 15,
          ),
          Text(
            "Zobacz więcej",
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              textStyle: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    elevation: 50,
    backgroundColor: Colors.transparent,
    isDismissible: true,
    enableDrag: true,
    isScrollControlled: false,
    enterBottomSheetDuration: const Duration(milliseconds: 400),
    exitBottomSheetDuration: const Duration(milliseconds: 400),
  );
}

scanDocument() async {
  Get.bottomSheet(
    const Padding(
      padding: EdgeInsets.only(top: 20, bottom: 10),
      child: NFCScanner(
        title: "Logowanie",
      ),
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    elevation: 50,
    backgroundColor: Colors.transparent,
    isDismissible: true,
    enableDrag: true,
    isScrollControlled: false,
    enterBottomSheetDuration: const Duration(milliseconds: 400),
    exitBottomSheetDuration: const Duration(milliseconds: 400),
  );
}
