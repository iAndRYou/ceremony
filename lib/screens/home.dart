import 'dart:async';
import 'package:ceremony/classes/sheets.dart';
import 'package:ceremony/classes/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ceremony/classes/user.dart';

class HomePage extends StatefulWidget {
  final User user;
  final bool valid;
  const HomePage(this.user, this.valid, {Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<HomePage> createState() => _HomePageState(user, valid);
}

class _HomePageState extends State<HomePage> {
  User user;
  bool valid;
  _HomePageState(this.user, this.valid);

  @override
  void initState() {
    super.initState();
    Timer.periodic(
      const Duration(minutes: 1),
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
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          floating: false,
          pinned: true,
          centerTitle: true,
          title: Text(
            "e-Legitymacja",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        CupertinoSliverRefreshControl(
          onRefresh: () async {
            var refreshedValid = await user.valid();
            if (mounted) {
              setState(() {
                valid = refreshedValid;
              });
            }
          },
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: Document(user, valid),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: Stamp(),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: DocumentData(user),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: DutyData(user),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 15),
                child: DutyDataExtended(user),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
