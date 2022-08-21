import 'dart:async';
import 'package:ceremony/classes/security.dart';
import 'package:ceremony/classes/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ceremony/classes/user.dart';

class HomePage extends StatefulWidget {
  final User user;
  final bool valid;
  final String stamp;
  const HomePage(this.user, this.valid, this.stamp, {Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<HomePage> createState() => _HomePageState(user, valid, stamp);
}

class _HomePageState extends State<HomePage> {
  User user;
  bool valid;
  String stamp;
  _HomePageState(this.user, this.valid, this.stamp);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          floating: false,
          centerTitle: true,
          title: Text(
            "e-Legitymacja",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        CupertinoSliverRefreshControl(
          onRefresh: () async {
              var refreshedStamp = await TimeNow().getStamp();
              if (mounted) {
                setState(() {
                  stamp = refreshedStamp;
                });
              }
              var refreshedValid = await user.valid();
              if (mounted) {
                setState(() {
                  valid = refreshedValid;
                });
              }
          },
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: Document(user, valid),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: Text(
              "Stan na dzień:   $stamp",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: DocumentData(user),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: DutyData(user),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: DutyDataExtended(user),
          ),
        ),
      ],
    );
  }
}
