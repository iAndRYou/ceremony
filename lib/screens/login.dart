import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
import 'package:ceremony/classes/preferences.dart';
import 'package:ceremony/classes/security.dart';
import 'package:ceremony/classes/sheets.dart';
import 'package:ceremony/classes/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:iconsax/iconsax.dart';

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
              const SizedBox(height: 30),
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
                    await loginUser();
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
              const SizedBox(height: 90),
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
                    showErrorAlert('Błąd NFC', 'Brak modułu NFC');
                  } else {
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
                    await FlutterNfcKit.finish(
                        iosAlertMessage: "Odczytano dane",
                        iosErrorMessage: "Niepoprawna e-Legitymacja");
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
