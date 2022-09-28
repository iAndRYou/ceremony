import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class HelpPage extends StatefulWidget {
  final String title;
  final String subtitle;
  const HelpPage({required this.title, required this.subtitle, Key? key})
      : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<HelpPage> createState() => _HelpPageState(title, subtitle);
}

class _HelpPageState extends State<HelpPage> {
  String title;
  String subtitle;
  String pin = "";
  _HelpPageState(this.title, this.subtitle);

  updateInput(String value) {
    if (pin.length < 4) {
      setState(() {
        pin += value;
      });
    }
  }

  deleteInput() {
    if (pin.isNotEmpty) {
      setState(() {
        pin = pin.substring(0, pin.length - 1);
      });
    }
  }

  double dotSize = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          title,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  pin.isNotEmpty
                      ? Padding(
                          padding: EdgeInsets.all(dotSize / 4),
                          child: Container(
                            height: dotSize,
                            width: dotSize,
                            decoration: BoxDecoration(
                              color: Colors.black87,
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        )
                      : Padding(
                          padding: EdgeInsets.all(dotSize / 4),
                          child: Container(
                            height: dotSize,
                            width: dotSize,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.black87,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        ),
                  pin.length > 1
                      ? Padding(
                          padding: EdgeInsets.all(dotSize / 4),
                          child: Container(
                            height: dotSize,
                            width: dotSize,
                            decoration: BoxDecoration(
                              color: Colors.black87,
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        )
                      : Padding(
                          padding: EdgeInsets.all(dotSize / 4),
                          child: Container(
                            height: dotSize,
                            width: dotSize,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.black87,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        ),
                  pin.length > 2
                      ? Padding(
                          padding: EdgeInsets.all(dotSize / 4),
                          child: Container(
                            height: dotSize,
                            width: dotSize,
                            decoration: BoxDecoration(
                              color: Colors.black87,
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        )
                      : Padding(
                          padding: EdgeInsets.all(dotSize / 4),
                          child: Container(
                            height: dotSize,
                            width: dotSize,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.black87,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        ),
                  pin.length > 3
                      ? Padding(
                          padding: EdgeInsets.all(dotSize / 4),
                          child: Container(
                            height: dotSize,
                            width: dotSize,
                            decoration: BoxDecoration(
                              color: Colors.black87,
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        )
                      : Padding(
                          padding: EdgeInsets.all(dotSize / 4),
                          child: Container(
                            height: dotSize,
                            width: dotSize,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.black87,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        ),
                ],
              ),
            ),
            Center(
              child: Text(
                "Podaj PIN",
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                    color: Colors.black26,
                    fontWeight: FontWeight.w700,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(dotSize),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      primary: Colors.black38,
                      backgroundColor: Colors.black38,
                      side: const BorderSide(
                        color: Colors.transparent,
                      ),
                      fixedSize: Size(5 * dotSize, 5 * dotSize),
                      elevation: 0,
                      shape: const CircleBorder(),
                    ),
                    onPressed: () => updateInput("1"),
                    child: Center(
                      child: Text(
                        "1",
                        style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(dotSize),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      primary: Colors.black38,
                      backgroundColor: Colors.black38,
                      side: const BorderSide(
                        color: Colors.transparent,
                      ),
                      fixedSize: Size(5 * dotSize, 5 * dotSize),
                      elevation: 0,
                      shape: const CircleBorder(),
                    ),
                    onPressed: () => updateInput("2"),
                    child: Center(
                      child: Text(
                        "2",
                        style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(dotSize),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      primary: Colors.black38,
                      backgroundColor: Colors.black38,
                      side: const BorderSide(
                        color: Colors.transparent,
                      ),
                      fixedSize: Size(5 * dotSize, 5 * dotSize),
                      elevation: 0,
                      shape: const CircleBorder(),
                    ),
                    onPressed: () => updateInput("3"),
                    child: Center(
                      child: Text(
                        "3",
                        style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(dotSize),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      primary: Colors.black38,
                      backgroundColor: Colors.black38,
                      side: const BorderSide(
                        color: Colors.transparent,
                      ),
                      fixedSize: Size(5 * dotSize, 5 * dotSize),
                      elevation: 0,
                      shape: const CircleBorder(),
                    ),
                    onPressed: () => updateInput("4"),
                    child: Center(
                      child: Text(
                        "4",
                        style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(dotSize),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      primary: Colors.black38,
                      backgroundColor: Colors.black38,
                      side: const BorderSide(
                        color: Colors.transparent,
                      ),
                      fixedSize: Size(5 * dotSize, 5 * dotSize),
                      elevation: 0,
                      shape: const CircleBorder(),
                    ),
                    onPressed: () => updateInput("5"),
                    child: Center(
                      child: Text(
                        "5",
                        style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(dotSize),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      primary: Colors.black38,
                      backgroundColor: Colors.black38,
                      side: const BorderSide(
                        color: Colors.transparent,
                      ),
                      fixedSize: Size(5 * dotSize, 5 * dotSize),
                      elevation: 0,
                      shape: const CircleBorder(),
                    ),
                    onPressed: () => updateInput("6"),
                    child: Center(
                      child: Text(
                        "6",
                        style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(dotSize),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      primary: Colors.black38,
                      backgroundColor: Colors.black38,
                      side: const BorderSide(
                        color: Colors.transparent,
                      ),
                      fixedSize: Size(5 * dotSize, 5 * dotSize),
                      elevation: 0,
                      shape: const CircleBorder(),
                    ),
                    onPressed: () => updateInput("7"),
                    child: Center(
                      child: Text(
                        "7",
                        style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(dotSize),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      primary: Colors.black38,
                      backgroundColor: Colors.black38,
                      side: const BorderSide(
                        color: Colors.transparent,
                      ),
                      fixedSize: Size(5 * dotSize, 5 * dotSize),
                      elevation: 0,
                      shape: const CircleBorder(),
                    ),
                    onPressed: () => updateInput("8"),
                    child: Center(
                      child: Text(
                        "8",
                        style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(dotSize),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      primary: Colors.black38,
                      backgroundColor: Colors.black38,
                      side: const BorderSide(
                        color: Colors.transparent,
                      ),
                      fixedSize: Size(5 * dotSize, 5 * dotSize),
                      elevation: 0,
                      shape: const CircleBorder(),
                    ),
                    onPressed: () => updateInput("9"),
                    child: Center(
                      child: Text(
                        "9",
                        style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(dotSize),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.white,
                      side: const BorderSide(
                        color: Colors.transparent,
                      ),
                      fixedSize: Size(5 * dotSize, 5 * dotSize),
                      elevation: 0,
                      shape: const CircleBorder(),
                    ),
                    onPressed: () => Get.back(),
                    child: const Center(
                      child: Icon(
                        Iconsax.close_square,
                        size: 30,
                        color: Colors.redAccent,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(dotSize),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      primary: Colors.black38,
                      backgroundColor: Colors.black38,
                      side: const BorderSide(
                        color: Colors.transparent,
                      ),
                      fixedSize: Size(5 * dotSize, 5 * dotSize),
                      elevation: 0,
                      shape: const CircleBorder(),
                    ),
                    onPressed: () => updateInput("0"),
                    child: Center(
                      child: Text(
                        "0",
                        style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(dotSize),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.white,
                      side: const BorderSide(
                        color: Colors.white,
                      ),
                      fixedSize: Size(5 * dotSize, 5 * dotSize),
                      elevation: 0,
                      shape: const CircleBorder(),
                    ),
                    onPressed: () => deleteInput(),
                    child: const Center(
                      child: Icon(
                        Iconsax.arrow_square_left,
                        size: 30,
                        color: Colors.black38,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
