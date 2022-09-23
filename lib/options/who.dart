import 'dart:async';
import 'dart:io';
import 'package:ceremony/classes/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../classes/security.dart';
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
    await loginUser();
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
                    "Posługa Ceremoniarza",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  subtitle: Text(
                    "Funkcja ceremoniarza jest najwyższym stopniem formacji liturgicznej. Każdy kto posiada ten tytuł ukończył Szkołę Ceremoniarza Parafialnego oraz został pobłogosławiony do pełnienia tej funkcji. Każdy absolwent Szkoły posiada wiedzę niezbędną do pełnienia swoich obowiązków, którą powinien poszerzać poprzez lekturę, kursy oraz dalszą formację i częste uczestnictwo w liturgii.",
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
                    "Obowiązki Ceremoniarza",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  subtitle: Text(
                    "Ceremoniarz odpowiedzialny jest przede wszystkim za przygotowanie liturgii, a więc:\n      wyznacza funkcje,\n      prowadzi próby asyst,\n      koordynuje zespoły liturgiczne,\n      czuwa nad przebiegiem liturgii,\n      dba o przestrzeganie reguł,\n      oraz podejmuje decyzje.\nCeremoniarz ponosi odpowiedzialność za zespoły liturgiczne i dba aby współpracowały one nienagannie.\n\nCeremoniarz:\n      posiada wiedzę,\n      którą potrafi stosować,\n      oraz którą chętnie pogłębia,\n      działa dyskretnie,\n      jest gorliwy i opanowany,\n      oraz nie zabiega o uznanie.",
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
                    "Ceremoniarz ma prawo do prowadzenia:\n      spotkań formacyjnych,\n      spotkań praktycznych,\n      prób asyst.\n\nCeremoniarz może służyć kapłanowi odpowiedzialnemu za LSO w parafii radą, a w granicach przyzwoitości, z pokorą, powołując się na obowiązujące przepisy i po uwzględnieniu czynników lokalnych, również konstruktywną krytyką.\n\nKażdy Ceremoniarz jest mile widziany na każdej uroczystości diecezjalnej, na której, jeżeli nie występują szczególne okoliczności, ma on priorytet w podjęciu funkcji wyznaczonej przez odpowiedzialnego za liturgię.",
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
