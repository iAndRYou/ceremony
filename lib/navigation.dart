import 'dart:async';

import 'package:ceremony/classes/user.dart';
import 'package:flutter/material.dart';
import 'package:ceremony/screens/profile.dart';
import 'package:ceremony/screens/home.dart';
import 'package:iconsax/iconsax.dart';

class Navigate extends StatefulWidget {
  final int index;
  final User user;
  final bool valid;
  const Navigate(this.index, this.user, this.valid, {Key? key})
      : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<Navigate> createState() => _NavigateState(index, user, valid);
}

class _NavigateState extends State<Navigate> {
  int index;
  User user;
  bool valid;
  _NavigateState(this.index, this.user, this.valid);

  @override
  void initState() {
    super.initState();
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) async {
        var refreshedValid = await user.valid();
        if (mounted) {
          setState(() {
            valid = refreshedValid;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var navigate = [
      HomePage(user, valid),
      ProfilePage(user),
    ];

    return Scaffold(
      body: navigate[index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (index) => setState(() => this.index = index),
        animationDuration: const Duration(seconds: 1),
        destinations: [
          NavigationDestination(
            icon: Icon(
              Iconsax.personalcard,
              color: Theme.of(context).iconTheme.color,
            ),
            label: "e-Legitymacja",
            selectedIcon: Icon(
              Iconsax.personalcard5,
              color: Theme.of(context).iconTheme.color,
            ),
          ),
          NavigationDestination(
            icon: Icon(
              Iconsax.more_square,
              color: Theme.of(context).iconTheme.color,
            ),
            label: "Profil",
            selectedIcon: Icon(
              Iconsax.more_square5,
              color: Theme.of(context).iconTheme.color,
            ),
          ),
        ],
      ),
    );
  }
}
