import 'package:ceremony/classes/preferences.dart';
import 'package:ceremony/classes/security.dart';
import 'package:ceremony/classes/sheets.dart';
import 'package:ceremony/classes/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ceremony/classes/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:local_auth/local_auth.dart';
import 'package:ndef/ndef.dart' as ndef;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var token = encrypt(
        'CRMNY+C 0 0+Jan+Kowalski+07.05.2006+0+2023-05+14.05.2023+31.12.2023+1+św. Jana Kantego+4+Kraków+6+0 0 0+0#01.01.2022 0#01.01.2022 0#01.01.2022 0#01.01.2022 0#01.01.2022 0#01.01.2022 0#01.01.2022 0#01.01.2022 0#01.01.2022 0#01.01.2022+0');

    Future<bool> ifAuthenticated() async {
      try {
        return await LocalAuthentication().authenticate(
          localizedReason: 'Zaloguj się',
          options: const AuthenticationOptions(
            biometricOnly: true,
            useErrorDialogs: true,
            stickyAuth: true,
          ),
        );
      } on PlatformException catch (e) {
        return false;
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Container(),
              ),
              const DSL(200, 300),
              const SizedBox(height: 50),
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
                    if (user.pin == '0') {
                      // ignore: use_build_context_synchronously
                      await showFirstPinBar(context, user);
                    } else {
                      var ifSecureLogin = await Cache().ifSecureLogin();
                      if (ifSecureLogin) {
                      } else {
// ignore: use_build_context_synchronously
                        await showPinBar(context, user);
                      }
                    }
                  } else {
                    var availability = await FlutterNfcKit.nfcAvailability;
                    if (availability != NFCAvailability.available) {
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
                  if (availability != NFCAvailability.available) {
                    showErrorAlert('NFC', 'Brak dostępu do modułu NFC');
                  } else {
                    var tag = await FlutterNfcKit.poll(
                        timeout: const Duration(minutes: 2));
                    if (tag.type == NFCTagType.mifare_classic &&
                        tag.ndefWritable!) {
                      print('got id card');
                      await FlutterNfcKit.writeNDEFRecords([
                        ndef.UriRecord.fromString(token),
                        ndef.SignatureRecord(
                            hashType: 'SHA-256',
                            signatureType: 'DSA-1024',
                            signatureURI: encrypt(tag.id)),
                        ndef.SignatureRecord(
                            hashType: 'SHA-256',
                            signatureType: 'DSA-1024',
                            signatureURI: encrypt(tag.id)),
                      ]);
                      print('written id card');
                    }
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
