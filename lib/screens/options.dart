import 'package:ceremony/options/about.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class OptionsPage extends StatefulWidget {
  const OptionsPage({Key? key}) : super(key: key);

  @override
  State<OptionsPage> createState() => _OptionsPageState();
}

class _OptionsPageState extends State<OptionsPage> {
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
          "Opcje",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Divider(
            height: 3,
            color: Theme.of(context).dividerColor,
          ),
          ListTile(
            dense: true,
            title: Text(
              "Kim jest Ceremoniarz?",
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
              onPressed: () {},
              child: const Icon(
                Iconsax.message_question,
                size: 30,
                color: Colors.black87,
              ),
            ),
          ),
          Divider(
            height: 3,
            color: Theme.of(context).dividerColor,
          ),
          ListTile(
            dense: true,
            title: Text(
              "Pobierz dokument",
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
              onPressed: () {},
              child: const Icon(
                Iconsax.document_download,
                size: 30,
                color: Colors.black87,
              ),
            ),
          ),
          Divider(
            height: 3,
            color: Theme.of(context).dividerColor,
          ),
          ListTile(
            dense: true,
            title: Text(
              "Bezpieczeństwo",
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
              onPressed: () {},
              child: const Icon(
                Iconsax.key,
                size: 30,
                color: Colors.black87,
              ),
            ),
          ),
          Divider(
            height: 3,
            color: Theme.of(context).dividerColor,
          ),
          ListTile(
            dense: true,
            title: Text(
              "Aktualizuj dane",
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
              onPressed: () async {},
              child: const Icon(
                Iconsax.mirroring_screen,
                size: 30,
                color: Colors.black87,
              ),
            ),
          ),
          Divider(
            height: 3,
            color: Theme.of(context).dividerColor,
          ),
          ListTile(
            dense: true,
            title: Text(
              "Przedłuż ważność",
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
              onPressed: () async {},
              child: const Icon(
                Iconsax.calendar,
                size: 30,
                color: Colors.black87,
              ),
            ),
          ),
          Divider(
            height: 3,
            color: Theme.of(context).dividerColor,
          ),
          ListTile(
            dense: true,
            title: Text(
              "O aplikacji",
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
              onPressed: () {
                Get.to(() => const AboutPage(),
                    transition: Transition.noTransition, popGesture: false);
              },
              child: const Icon(
                Iconsax.book_1,
                size: 30,
                color: Colors.black87,
              ),
            ),
          ),
          Divider(
            height: 3,
            color: Theme.of(context).dividerColor,
          ),
          ListTile(
            dense: true,
            title: Text(
              "Pomoc",
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
              onPressed: () async {},
              child: const Icon(
                Iconsax.information,
                size: 30,
                color: Colors.black87,
              ),
            ),
          ),
          Divider(
            height: 3,
            color: Theme.of(context).dividerColor,
          ),
        ],
      ),
    );
  }
}
