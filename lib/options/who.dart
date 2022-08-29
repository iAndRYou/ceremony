import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class WhoIs extends StatefulWidget {
  const WhoIs({Key? key}) : super(key: key);

  @override
  State<WhoIs> createState() => _WhoIsState();
}

class _WhoIsState extends State<WhoIs> {
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
          "Kim jest Ceremoniarz?",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: Column(
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
              "Bezpieczne logowanie",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          const Divider(
            height: 3,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
