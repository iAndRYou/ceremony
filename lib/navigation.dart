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
  final String stamp;
  const Navigate(this.index, this.user, this.valid, this.stamp, {Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<Navigate> createState() => _NavigateState(index, user, valid, stamp);
}

class _NavigateState extends State<Navigate> {
  int index;
  User user;
  bool valid;
  String stamp;
  _NavigateState(this.index, this.user, this.valid, this.stamp);

  @override
  initState() {
    user.valid().then((value) {
      if (mounted) {
        setState(() {
          valid = value;
        });
      }
    });
    Timer.periodic(
        const Duration(minutes: 1),
        (Timer t) => user.valid().then((value) {
              if (mounted) {
                setState(() {
                  valid = value;
                });
              }
            }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var navigate = [
      HomePage(user, valid, stamp),
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
            label: "Home",
            selectedIcon: Icon(
              Iconsax.personalcard5,
              color: Theme.of(context).iconTheme.color,
            ),
          ),
          NavigationDestination(
            icon: Icon(
              Iconsax.more,
              color: Theme.of(context).iconTheme.color,
            ),
            label: "Profile",
            selectedIcon: Icon(
              Iconsax.more5,
              color: Theme.of(context).iconTheme.color,
            ),
          ),
        ],
      ),
    );
  }
}
