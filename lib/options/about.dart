import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:iconsax/iconsax.dart';
import 'package:introduction_screen/introduction_screen.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
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
        "Wyjdź",
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      done: Text(
        "Ok",
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      onDone: () {
        Get.back();
      },
      onSkip: () {
        Get.back();
      },
      dotsDecorator: DotsDecorator(
          size: const Size.square(10),
          activeSize: const Size(20, 10),
          activeColor: HexColor('1e4e82'),
          color: Colors.black26,
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0))),
      pages: [
        PageViewModel(
          title: "Skanuj Legitymacje",
          body: "Dzięki aplikacji",
          image: Center(
            child: Icon(
              Iconsax.mirroring_screen,
              size: 140,
              color: HexColor('1e4e82'),
            ),
          ),
        ),
        PageViewModel(
          title: "Title of second page",
          body:
              "Here you can write the description of the page, to explain someting...",
          image: Center(
            child: Icon(
              Iconsax.message_question,
              size: 140,
              color: HexColor('1e4e82'),
            ),
          ),
        ),
        PageViewModel(
          title: "Title of third page",
          body:
              "Here you can write the description of the page, to explain someting...",
          image: Center(
            child: Icon(
              Iconsax.information,
              size: 140,
              color: HexColor('1e4e82'),
            ),
          ),
        )
      ],
    );
  }
}
