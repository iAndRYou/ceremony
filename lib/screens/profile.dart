import 'dart:io';
import 'package:ceremony/classes/preferences.dart';
import 'package:ceremony/classes/sheets.dart';
import 'package:ceremony/classes/user.dart';
import 'package:ceremony/classes/widgets.dart';
import 'package:ceremony/screens/options.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProfilePage extends StatefulWidget {
  final User user;
  const ProfilePage(this.user, {Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<ProfilePage> createState() => _ProfilePageState(user);
}

class _ProfilePageState extends State<ProfilePage> {
  User user;
  _ProfilePageState(this.user);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          floating: false,
          title: Text(
            "Profil",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          centerTitle: true,
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
            "Duszpasterstwo Służby Liturgicznej\nArchidiecezji Krakowskiej",
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
          child: Divider(
            height: 3,
            color: Theme.of(context).dividerColor,
          ),
        ),
        SliverToBoxAdapter(
          child: ListTile(
            dense: true,
            title: Text(
              "${user.name!.toUpperCase()} ${user.surname!.toUpperCase()}",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            subtitle: Text(
              "Użytkownik",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Divider(
            height: 3,
            color: Theme.of(context).dividerColor,
          ),
        ),
        SliverToBoxAdapter(
          child: ListTile(
            dense: true,
            title: Text(
              user.parish!.toUpperCase(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            subtitle: Text(
              "Parafia",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Divider(
            height: 3,
            color: Theme.of(context).dividerColor,
          ),
        ),
        SliverToBoxAdapter(
          child: ListTile(
            dense: true,
            title: Text(
              user.deanery().toUpperCase(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            subtitle: Text(
              "Dekanat",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Divider(
            height: 3,
            color: Theme.of(context).dividerColor,
          ),
        ),
        SliverToBoxAdapter(
          child: ListTile(
            dense: true,
            title: Text(
              "••••",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            subtitle: Text(
              "PIN",
              style: Theme.of(context).textTheme.bodyMedium,
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
              onPressed: () async {
                showChangePinBar(context, user);
              },
              child: const Icon(
                Iconsax.edit,
                size: 30,
                color: Colors.black87,
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Divider(
            height: 3,
            color: Theme.of(context).dividerColor,
          ),
        ),
        SliverToBoxAdapter(
          child: ListTile(
            dense: true,
            title: Text(
              "Opcje",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            subtitle: Text(
              "Menu",
              style: Theme.of(context).textTheme.bodyMedium,
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
                Get.to(
                  () => const OptionsPage(),
                  transition: Transition.cupertino,
                );
              },
              child: const Icon(
                Iconsax.arrow_right_3,
                size: 30,
                color: Colors.black87,
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Divider(
            height: 3,
            color: Theme.of(context).dividerColor,
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 20,
          ),
        ),
        SliverToBoxAdapter(
          child: Row(
            children: [
              Expanded(
                child: Container(),
              ),
              SizedBox(
                width: 200,
                height: 50,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    fixedSize: const Size(200, 50),
                    alignment: Alignment.center,
                    elevation: 0,
                    primary: Colors.black26,
                    side: const BorderSide(
                      width: 3,
                      color: Colors.black26,
                      style: BorderStyle.solid,
                    ),
                  ),
                  child: const Center(
                    child: Text("WYLOGUJ"),
                  ),
                  onPressed: () async {
                    var token = await Cache().getToken();
                    var user = User.fromToken(token);
                    // ignore: use_build_context_synchronously
                    await showLogoutBar(context, user);
                  },
                ),
              ),
              Expanded(
                child: Container(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
