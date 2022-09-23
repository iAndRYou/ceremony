import 'package:ceremony/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:iconsax/iconsax.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:ceremony/classes/preferences.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      showBackButton: false,
      showSkipButton: true,
      showNextButton: true,
      baseBtnStyle: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        primary: Colors.black26,
      ),
      next: const Icon(
        Iconsax.arrow_right_3,
        size: 24,
        color: Colors.black87,
      ),
      skip: Text(
        "Pomiń",
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      done: Text(
        "Ok",
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      onDone: () async {
        await Cache().setFirstBoot();
        Get.offAll(() => const SplashScreen(),
            transition: Transition.noTransition);
      },
      onSkip: () async {
        await Cache().setFirstBoot();
        Get.offAll(() => const SplashScreen(),
            transition: Transition.noTransition);
      },
      dotsDecorator: DotsDecorator(
        size: const Size.square(10),
        activeSize: const Size(20, 10),
        activeColor: HexColor('1e4e82'),
        color: Colors.black26,
        spacing: const EdgeInsets.symmetric(horizontal: 3.0),
        activeShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      ),
      freeze: true,
      pages: [
        PageViewModel(
          title: "Skanuj e-Legitymację",
          body:
              "Dzięki aplikacji Ceremony możesz skanować każdą e-legitymację ceremoniarza, sprawdzać jej ważność i podstawowe dane na niej zapisane. Możesz zrobić to z poziomu ekranu logowania.",
          image: Center(
            child: Icon(
              Iconsax.mirroring_screen,
              size: 140,
              color: HexColor('1e4e82'),
            ),
          ),
        ),
        PageViewModel(
          title: "e-Legitymacja",
          body:
              "Zaloguj się, a dane twojej legitymacji oraz informacje o twojej posłudze zostaną zebrane w jednym miejscu - na twoim telefonie. Okazanie e-legitymacji w aplikacji jest równoprawne okazaniu fizycznego dokumentu. W aplikacji sprawdzisz, czy dokument jest ważny.",
          image: Center(
            child: Icon(
              Iconsax.personalcard,
              size: 140,
              color: HexColor('1e4e82'),
            ),
          ),
        ),
        PageViewModel(
          title: "Przedłużaj ważność",
          body:
              "Weź udział w conajmniej jednym zjeździe dla ceremoniarzy organizowanym przez Duszpasterstwo Służby Liturgicznej w ciągu roku, zeskanuj kod i przedłuż ważność e-legitymacji o rok.",
          image: Center(
            child: Icon(
              Iconsax.calendar_tick,
              size: 140,
              color: HexColor('1e4e82'),
            ),
          ),
        ),
      ],
    );
  }
}
