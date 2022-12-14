import 'dart:async';
import 'dart:io';
import 'package:ceremony/classes/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../screens/login.dart';

class WhoIs extends StatefulWidget {
  const WhoIs({Key? key}) : super(key: key);

  @override
  State<WhoIs> createState() => _WhoIsState();
}

class _WhoIsState extends State<WhoIs> with WidgetsBindingObserver {
  late Timer _updateTimer;
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    _updateTimer.cancel();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (Platform.isIOS && state == AppLifecycleState.resumed) {
      _updateTimer.cancel();
    } else if (Platform.isAndroid && state == AppLifecycleState.resumed) {
      _updateTimer.cancel();
    }
    if (Platform.isIOS && state == AppLifecycleState.paused) {
      _updateTimer = Timer(const Duration(seconds: 5), () => secureBack());
    } else if (Platform.isAndroid && state == AppLifecycleState.paused) {
      _updateTimer = Timer(const Duration(seconds: 5), () => secureBack());
    }
  }

  secureBack() async {
    Get.offAll(
      () => const LoginPage(),
      transition: Transition.noTransition,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 700),
    );
    Future.delayed(const Duration(milliseconds: 500));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
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
              "Kim jest Ceremoniarz?",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          SliverToBoxAdapter(
            child: Row(
              children: [
                Expanded(child: Container()),
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: DSL(75, 112.5),
                ),
                Expanded(child: Container()),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Text(
              "Ceremoniarz Parafialny\nArchidiecezji Krakowskiej",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  height: 3,
                  color: Colors.white,
                ),
                ListTile(
                  dense: true,
                  title: Text(
                    "Pos??uga Ceremoniarza",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  subtitle: Text(
                    "Funkcja ceremoniarza jest najwy??szym stopniem formacji liturgicznej. Ka??dy kto posiada ten tytu?? uko??czy?? Szko???? Ceremoniarza Parafialnego oraz zosta?? pob??ogos??awiony do pe??nienia tej funkcji. Ka??dy absolwent Szko??y posiada wiedz?? niezb??dn?? do pe??nienia swoich obowi??zk??w, kt??r?? powinien poszerza?? poprzez lektur??, kursy oraz dalsz?? formacj?? i cz??ste uczestnictwo w liturgii.",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                const Divider(
                  height: 3,
                  color: Colors.white,
                ),
                ListTile(
                  dense: true,
                  title: Text(
                    "Obowi??zki Ceremoniarza",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  subtitle: Text(
                    "Ceremoniarz odpowiedzialny jest przede wszystkim za przygotowanie liturgii, a wi??c:\n      wyznacza funkcje,\n      prowadzi pr??by asyst,\n      koordynuje zespo??y liturgiczne,\n      czuwa nad przebiegiem liturgii,\n      dba o przestrzeganie regu??,\n      oraz podejmuje decyzje.\nCeremoniarz ponosi odpowiedzialno???? za zespo??y liturgiczne i dba aby wsp????pracowa??y one nienagannie.\n\nCeremoniarz:\n      posiada wiedz??,\n      kt??r?? potrafi stosowa??,\n      oraz kt??r?? ch??tnie pog????bia,\n      dzia??a dyskretnie,\n      jest gorliwy i opanowany,\n      oraz nie zabiega o uznanie.",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                const Divider(
                  height: 3,
                  color: Colors.white,
                ),
                ListTile(
                  dense: true,
                  title: Text(
                    "Prawa Ceremoniarza",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  subtitle: Text(
                    "Ceremoniarz ma prawo do prowadzenia:\n      spotka?? formacyjnych,\n      spotka?? praktycznych,\n      pr??b asyst.\n\nCeremoniarz mo??e s??u??y?? kap??anowi odpowiedzialnemu za LSO w parafii rad??, a w granicach przyzwoito??ci, z pokor??, powo??uj??c si?? na obowi??zuj??ce przepisy i po uwzgl??dnieniu czynnik??w lokalnych, r??wnie?? konstruktywn?? krytyk??.\n\nKa??dy Ceremoniarz jest mile widziany na ka??dej uroczysto??ci diecezjalnej, na kt??rej, je??eli nie wyst??puj?? szczeg??lne okoliczno??ci, ma on priorytet w podj??ciu funkcji wyznaczonej przez odpowiedzialnego za liturgi??.",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
