import 'dart:math';
import 'package:ceremony/classes/preferences.dart';
import 'package:ceremony/classes/sheets.dart';
import 'package:ceremony/classes/user.dart';
import 'package:encrypt/encrypt.dart' as en;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:local_auth/local_auth.dart';
import 'package:ntp/ntp.dart';

import '../navigation.dart';
import '../screens/login.dart';

List<String> keys = [
  '4t7w!z%C*F)J@NcRfUjXn2r5u8x/A?D(',
  'x!A%D*G-JaNdRgUkXp2s5v8y/B?E(H+M',
  'w!z%C*F-JaNdRfUjXn2r5u8x/A?D(G+K',
  'gUkXp2s5u8x/A?D(G+KbPeShVmYq3t6w',
  'mZq4t7w!z#C&F)J@NcRfUjXn2r5u8x/A',
  '2r5u8x/A%D*G-KaPdSgVkYp3s6v9y=B&',
  'cQfTjWmZq4t7w!z%C*F-JaNdRgUkXp2r',
  '+KbPeShVmYq3t6v9y&B&E)H@McQfTjWn',
  'q3t6w9z%C&F)H@McQfTjWnZr4u7x!A%D',
  'VmYq3t6w9z*C&F)J@NcRfUjWnZr4u7x!',
];

String encrypt(String id) {
  int index = Random.secure().nextInt(10);
  final key = en.Key.fromUtf8(keys[index]);
  final iv = en.IV.fromLength(16);
  return en.Encrypter(en.AES(key)).encrypt(id, iv: iv).base64 +
      index.toString();
}

String decrypt(String id) {
  int index = int.parse(id.substring(id.length - 1));
  id = id.replaceRange(id.length - 1, id.length, '');
  final key = en.Key.fromUtf8(keys[index]);
  final iv = en.IV.fromLength(16);
  String decrypted = en.Encrypter(en.AES(key)).decrypt64(id, iv: iv);
  return decrypted;
}

class TimeNow {
  Future<String> getStamp() async {
    var now = await NTP.now();
    return "${DateFormat('dd.MM.yyyy').format(now)}   ${DateFormat('HH:mm:ss').format(now)}";
  }
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

Future loginUser() async {
  var token = await Cache().getToken();
  var user = User.fromToken(token);
  var valid = await user.valid();
  var stamp = await TimeNow().getStamp();
  if (user.pin == '0') {
    var newPin = await Get.to(
      () => const ChangePinPad(
        title: "Ustaw PIN",
        prompt: "Ustaw PIN",
      ),
      transition: Transition.noTransition,
      duration: const Duration(milliseconds: 600),
    );
    if (newPin != null && newPin.length == 4) {
      await Future.delayed(const Duration(milliseconds: 200));
      var changedPin = await Get.to(
        () => const ChangePinPad(
          title: "Powtórz PIN",
          prompt: "Powtórz PIN",
        ),
        transition: Transition.noTransition,
        duration: const Duration(milliseconds: 600),
      );
      if (changedPin == newPin) {
        user.pin = changedPin;
        Cache().setToken(user.toToken());
        await Future.delayed(const Duration(milliseconds: 700));
      }
    } else {}
  } else {
    var ifSecureLogin = await Cache().ifSecureLogin();
    if (ifSecureLogin) {
      authenticate().then((authenticated) async {
        if (authenticated) {
          await Future.delayed(const Duration(milliseconds: 500));
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
        await Future.delayed(const Duration(milliseconds: 700));
        Get.offAll(
          () => Navigate(0, user, valid, stamp),
          transition: Transition.fadeIn,
          curve: Curves.ease,
          duration: const Duration(milliseconds: 1000),
        );
      } else {
        if (enteredPin != null) {
          await Future.delayed(const Duration(milliseconds: 700));
          showErrorAlert("Błędny PIN", "Spróbuj ponownie");
        }
      }
    }
  }
}

Future logoutUser() async {
  var token = await Cache().getToken();
  var user = User.fromToken(token);
  // ignore: use_build_context_synchronously
  var enteredPin = await Get.to(
    () => const LogoutPad(),
    transition: Transition.noTransition,
    duration: const Duration(milliseconds: 600),
  );
  if (enteredPin == user.pin) {
    Get.offAll(
      () => const LoginPage(),
      transition: Transition.fadeIn,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 1000),
    );
  } else {
    if (enteredPin != null) {
      await Future.delayed(const Duration(milliseconds: 700));
      showErrorAlert("Błędny PIN", "Spróbuj ponownie");
    }
  }
}

Future changePIN() async {
  var token = await Cache().getToken();
  var user = User.fromToken(token);
  var enteredPin = await Get.to(
    () => const ChangePinPad(
      title: "Zmiana PIN",
      prompt: "Podaj PIN",
    ),
    transition: Transition.noTransition,
    duration: const Duration(milliseconds: 600),
  );
  if (enteredPin == user.pin) {
    var newPin = await Get.to(
      () => const ChangePinPad(
        title: "Zmiana PIN",
        prompt: "Ustaw PIN",
      ),
      transition: Transition.noTransition,
      duration: const Duration(milliseconds: 600),
    );
    if (newPin != null) {
      var changedPin = await Get.to(
        () => const ChangePinPad(
          title: "Zmiana PIN",
          prompt: "Powtórz PIN",
        ),
        transition: Transition.noTransition,
        duration: const Duration(milliseconds: 600),
      );
      if (changedPin == newPin) {
        user.pin = changedPin;
        Cache().setToken(user.toToken());
        await Future.delayed(const Duration(milliseconds: 700));
        showCompleteAlert("Zmieniono PIN", "Poprawnie zmieniono dane");
      } else {
        if (changedPin != null) {
          await Future.delayed(const Duration(milliseconds: 700));
          showErrorAlert("Błędny PIN", "Podano różne kody PIN");
        }
      }
    } else {}
  } else {
    if (enteredPin != null) {
      await Future.delayed(const Duration(milliseconds: 700));
      showErrorAlert("Błędny PIN", "Spróbuj ponownie");
    }
  }
}

Future setupUser() async {}
