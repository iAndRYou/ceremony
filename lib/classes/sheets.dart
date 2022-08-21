import 'package:ceremony/classes/preferences.dart';
import 'package:ceremony/classes/security.dart';
import 'package:ceremony/classes/user.dart';
import 'package:ceremony/navigation.dart';
import 'package:ceremony/screens/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

showErrorAlert(title, message) {
  Get.snackbar(
    title,
    message,
    icon: const Icon(CupertinoIcons.exclamationmark, color: Colors.redAccent),
    snackPosition: SnackPosition.BOTTOM,
    margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
    animationDuration: const Duration(milliseconds: 800),
    duration: const Duration(milliseconds: 1600),
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
    duration: const Duration(milliseconds: 2000),
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
    duration: const Duration(milliseconds: 1600),
    backgroundColor: Colors.white,
    borderColor: Colors.black12,
    borderWidth: 1,
    overlayBlur: 2,
  );
}

showPinBar(context, user) async {
  Get.snackbar(
    '',
    '',
    margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
    animationDuration: const Duration(milliseconds: 800),
    duration: const Duration(minutes: 2),
    backgroundColor: Colors.white,
    borderColor: Colors.black12,
    borderWidth: 1,
    overlayBlur: 2,
    titleText: Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Text("Podaj PIN", style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 20),
          PinCodeTextField(
            appContext: context,
            length: 4,
            onChanged: (String value) async {
              if (value.length == 4) {
                Get.back();
                if (value == user.pin) {
                  showCompleteAlert('Odblokowano', 'Wprowadzono poprawny PIN');
                  var valid = await user.valid();
                  var stamp = await TimeNow().getStamp();
                  await Future.delayed(const Duration(milliseconds: 2000));
                  Get.to(() => Navigate(0, user, valid, stamp),
                      transition: Transition.fadeIn,
                      curve: Curves.ease,
                      duration: const Duration(milliseconds: 1500));
                } else {
                  showErrorAlert('Błędny PIN', 'Spróbuj ponownie');
                }
              }
            },
            keyboardType: const TextInputType.numberWithOptions(signed: false, decimal: false),
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
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.black,
              ),
            ),
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.circle,
              fieldHeight: 50,
              fieldWidth: 50,
              fieldOuterPadding: const EdgeInsets.all(10),
              borderWidth: 1,
              inactiveColor: Colors.black26,
              activeColor: Colors.black,
              selectedColor: HexColor('1e4e82'),
              activeFillColor: Colors.black,
            ),
            animationType: AnimationType.none,
            animationDuration: const Duration(milliseconds: 0),
          )
        ],
      ),
    ),
  );
}

_showFirstPinBar2(context, User user, pin) async {
  Get.snackbar(
    '',
    '',
    margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
    animationDuration: const Duration(milliseconds: 800),
    duration: const Duration(minutes: 2),
    backgroundColor: Colors.white,
    borderColor: Colors.black12,
    borderWidth: 1,
    overlayBlur: 2,
    titleText: Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Text("Potwierdź PIN", style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 20),
          PinCodeTextField(
            appContext: context,
            length: 4,
            onChanged: (String value) async {
              if (value.length == 4) {
                Get.back();
                if (value == pin) {
                  user.pin = value;
                  var token = user.toToken();
                  await Cache().setToken(token);
                  var valid = await user.valid();
                  var stamp = await TimeNow().getStamp();
                  showCompleteAlert('Zalogowano', 'Wprowadzono dane pomyślnie');
                  await Future.delayed(const Duration(milliseconds: 2000));
                  Get.offAll(
                    Navigate(0, user, valid, stamp),
                    transition: Transition.fadeIn,
                    curve: Curves.ease,
                    duration: const Duration(milliseconds: 1500),
                  );
                } else {
                  showErrorAlert('Wprowadzono różne kody PIN', 'Spróbuj ponownie');
                }
              }
            },
            keyboardType: const TextInputType.numberWithOptions(signed: false, decimal: false),
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
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.black,
              ),
            ),
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.circle,
              fieldHeight: 50,
              fieldWidth: 50,
              fieldOuterPadding: const EdgeInsets.all(10),
              borderWidth: 1,
              inactiveColor: Colors.black26,
              activeColor: Colors.black,
              selectedColor: HexColor('1e4e82'),
              activeFillColor: Colors.black,
            ),
            animationType: AnimationType.none,
            animationDuration: const Duration(milliseconds: 0),
          )
        ],
      ),
    ),
  );
}

showFirstPinBar(context, user) async {
  Get.snackbar(
    '',
    '',
    margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
    animationDuration: const Duration(milliseconds: 800),
    duration: const Duration(minutes: 2),
    backgroundColor: Colors.white,
    borderColor: Colors.black12,
    borderWidth: 1,
    overlayBlur: 2,
    titleText: Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Text("Ustaw PIN", style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 20),
          PinCodeTextField(
            appContext: context,
            length: 4,
            onChanged: (String value) async {
              if (value.length == 4) {
                Get.back();
                await _showFirstPinBar2(context, user, value);
              }
            },
            keyboardType: const TextInputType.numberWithOptions(signed: false, decimal: false),
            useHapticFeedback: true,
            autoFocus: true,
            autoUnfocus: true,
            autoDismissKeyboard: false,
            useExternalAutoFillGroup: false,
            blinkWhenObscuring: false,
            showCursor: false,
            obscureText: true,
            enableActiveFill: false,
            enablePinAutofill: false,
            obscuringWidget: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.black,
              ),
            ),
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.circle,
              fieldHeight: 50,
              fieldWidth: 50,
              fieldOuterPadding: const EdgeInsets.all(10),
              borderWidth: 1,
              inactiveColor: Colors.black26,
              activeColor: Colors.black,
              selectedColor: HexColor('1e4e82'),
              activeFillColor: Colors.black,
            ),
            animationType: AnimationType.fade,
            animationDuration: const Duration(milliseconds: 100),
          )
        ],
      ),
    ),
  );
}

showChangePinBar(context, user) async {
  Get.snackbar(
    '',
    '',
    margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
    animationDuration: const Duration(milliseconds: 800),
    duration: const Duration(minutes: 2),
    backgroundColor: Colors.white,
    borderColor: Colors.black12,
    borderWidth: 1,
    overlayBlur: 2,
    titleText: Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Text("Podaj PIN", style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 20),
          PinCodeTextField(
            appContext: context,
            length: 4,
            onChanged: (String value) async {
              if (value.length == 4) {
                Get.back();
                if (value == user.pin!) {
                  await showFirstPinBar(context, user);
                } else {
                  showErrorAlert('Błędny PIN', 'Spróbuj ponownie');
                }
              }
            },
            keyboardType: const TextInputType.numberWithOptions(signed: false, decimal: false),
            useHapticFeedback: true,
            autoFocus: true,
            autoUnfocus: true,
            autoDismissKeyboard: false,
            useExternalAutoFillGroup: false,
            blinkWhenObscuring: false,
            showCursor: false,
            obscureText: true,
            enableActiveFill: false,
            enablePinAutofill: false,
            obscuringWidget: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.black,
              ),
            ),
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.circle,
              fieldHeight: 50,
              fieldWidth: 50,
              fieldOuterPadding: const EdgeInsets.all(10),
              borderWidth: 1,
              inactiveColor: Colors.black26,
              activeColor: Colors.black,
              selectedColor: HexColor('1e4e82'),
              activeFillColor: Colors.black,
            ),
            animationType: AnimationType.fade,
            animationDuration: const Duration(milliseconds: 100),
          )
        ],
      ),
    ),
  );
}

showLogoutBar(context, user) async {
  Get.snackbar(
    '',
    '',
    margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
    animationDuration: const Duration(milliseconds: 800),
    duration: const Duration(minutes: 2),
    backgroundColor: Colors.white,
    borderColor: Colors.black26,
    borderWidth: 1,
    overlayBlur: 2,
    titleText: Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Text("Podaj PIN", style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 20),
          PinCodeTextField(
            appContext: context,
            length: 4,
            onChanged: (String value) async {
              if (value.length == 4) {
                Get.back();
                var loggedOut = false;
                if (value == user.pin) {
                  loggedOut = true;
                }
                if (loggedOut) {
                  await Cache().deleteToken();
                  showCompleteAlert('Wylogowano', 'Usunięto dane pomyślnie');
                  await Future.delayed(const Duration(milliseconds: 2000));
                  Get.offAll(
                    const LoginPage(),
                    transition: Transition.fadeIn,
                    curve: Curves.ease,
                    duration: const Duration(milliseconds: 1500),
                  );
                } else {
                  showErrorAlert('Błędny PIN', 'Spróbuj ponownie');
                }
              }
            },
            keyboardType: const TextInputType.numberWithOptions(signed: false, decimal: false),
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
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.black,
              ),
            ),
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.circle,
              fieldHeight: 50,
              fieldWidth: 50,
              fieldOuterPadding: const EdgeInsets.all(10),
              borderWidth: 1,
              inactiveColor: Colors.black26,
              activeColor: Colors.black,
              selectedColor: HexColor('1e4e82'),
              activeFillColor: Colors.black,
            ),
            animationType: AnimationType.none,
            animationDuration: const Duration(milliseconds: 0),
          )
        ],
      ),
    ),
  );
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
