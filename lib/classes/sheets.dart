import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
                padding: const EdgeInsets.fromLTRB(110, 0, 110, 0),
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
  const ChangePinPad({
    Key? key,
    required this.prompt,
  }) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<ChangePinPad> createState() => _ChangePinPadState(prompt);
}

class _ChangePinPadState extends State<ChangePinPad> {
  String prompt;
  _ChangePinPadState(this.prompt);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: TextButton(
          style: OutlinedButton.styleFrom(
            primary: Colors.white,
            side: const BorderSide(
              color: Colors.white,
            ),
            elevation: 0,
          ),
          onPressed: () async {
            Get.back(result: null);
          },
          child: Text(
            "Anuluj",
            textAlign: TextAlign.left,
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                color: HexColor('1e4e82'),
                fontWeight: FontWeight.w700,
                fontSize: 13,
              ),
            ),
          ),
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
                padding: const EdgeInsets.fromLTRB(110, 0, 110, 0),
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
        leading: TextButton(
          style: OutlinedButton.styleFrom(
            primary: Colors.white,
            side: const BorderSide(
              color: Colors.white,
            ),
            elevation: 0,
          ),
          onPressed: () async {
            Get.back(result: null);
          },
          child: Text(
            "Anuluj",
            textAlign: TextAlign.left,
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                color: HexColor('1e4e82'),
                fontWeight: FontWeight.w700,
                fontSize: 13,
              ),
            ),
          ),
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
                padding: const EdgeInsets.fromLTRB(110, 0, 110, 0),
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

showLoginIDScanner() async {
  Get.bottomSheet(
    Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Column(),
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    elevation: 50,
    backgroundColor: Colors.white,
    isDismissible: true,
    enableDrag: true,
    isScrollControlled: false,
    enterBottomSheetDuration: const Duration(milliseconds: 300),
    exitBottomSheetDuration: const Duration(milliseconds: 300),
  );
}
