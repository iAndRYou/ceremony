import 'package:ceremony/classes/user.dart';
import 'package:flutter/material.dart';
import 'package:foil/foil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:iconsax/iconsax.dart';

class IDClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 20);
    var firstControlPoint = Offset(size.width / 4, size.height - 40);
    var firstEndPoint = Offset(size.width / 2, size.height - 20);
    var secondControlPoint = Offset(size.width - (size.width / 4), size.height);
    var secondEndPoint = Offset(size.width, size.height - 20);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height - 20);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}

class HoloDSL extends StatefulWidget {
  final double width;
  final double height;
  const HoloDSL(this.width, this.height, {Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<HoloDSL> createState() => _HoloDSLState(width, height);
}

class _HoloDSLState extends State<HoloDSL> {
  final double width;
  final double height;
  _HoloDSLState(this.width, this.height);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(width / 10),
        color: HexColor('1e4e82'),
      ),
      child: Stack(
        children: [
          Foil(
            opacity: 0.7,
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment(0.8, 1),
              colors: <Color>[
                Color(0xff1e4e82),
                Color(0xff1e4e82),
                Color(0xff1e4e82),
                Color(0xff045587),
                Color(0xff005d8b),
                Color(0xff00648e),
                Color(0xff006a8f),
                Color(0xff007190),
                Color(0xff00778f),
                Color(0xff007d8e),
                Color(0xff00838c),
                Color(0xff007d8e),
                Color(0xff00778f),
                Color(0xff007190),
                Color(0xff006a8f),
                Color(0xff00648e),
                Color(0xff005d8b),
                Color(0xff045587),
                Color(0xff1e4e82),
                Color(0xff1e4e82),
                Color(0xff1e4e82),
              ],
              tileMode: TileMode.repeated,
            ),
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(width / 10),
                color: HexColor('1e4e82'),
              ),
            ),
          ),
          Center(
            child: Image.asset(
              'lib/assets/ddsl.png',
              alignment: Alignment.center,
            ),
          ),
        ],
      ),
    );
  }
}

class DSL extends StatefulWidget {
  final double width;
  final double height;
  const DSL(this.width, this.height, {Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<DSL> createState() => _DSLState(width, height);
}

class _DSLState extends State<DSL> {
  final double width;
  final double height;
  _DSLState(this.width, this.height);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(width / 10),
        color: HexColor('1e4e82'),
      ),
      child: Stack(
        children: [
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(width / 10),
              color: HexColor('1e4e82'),
            ),
          ),
          Positioned.fill(
            child: Image.asset(
              'lib/assets/ddsl.png',
              alignment: Alignment.center,
            ),
          ),
        ],
      ),
    );
  }
}

class Document extends StatefulWidget {
  final User user;
  final bool valid;
  const Document(this.user, this.valid, {Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<Document> createState() => _DocumentState(user, valid);
}

class _DocumentState extends State<Document> {
  User user;
  bool valid;
  _DocumentState(this.user, this.valid);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 5,
                spreadRadius: 1,
              )
            ],
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[
                  const Color(0xff1e4e82).withOpacity(0.8),
                  const Color(0xff1e4e82).withOpacity(0.8),
                  const Color(0xff1e4e82).withOpacity(0.8),
                  const Color(0xff1e4e82).withOpacity(0.8),
                  const Color(0xff1e4e82).withOpacity(0.8),
                  const Color(0xff045587).withOpacity(0.8),
                  const Color(0xff005d8b).withOpacity(0.8),
                  const Color(0xff00648e).withOpacity(0.8),
                  const Color(0xff006a8f).withOpacity(0.8),
                  const Color(0xff007190).withOpacity(0.8),
                  const Color(0xff00778f).withOpacity(0.8),
                  const Color(0xff007d8e).withOpacity(0.8),
                  const Color(0xff00838c).withOpacity(0.8),
                ],
                tileMode: TileMode.repeated,
              ),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            ),
            child: Stack(
              children: [
                Center(
                  child: Container(),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 200,
                            width: 160,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Center(
                              child: Foil(
                                opacity: 1,
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: const Alignment(0.8, 1),
                                  colors: <Color>[
                                    const Color(0xff808080).withOpacity(0.8),
                                    const Color(0xff808080).withOpacity(0.8),
                                    const Color(0xff808080).withOpacity(0.8),
                                    const Color(0xff808080).withOpacity(0.8),
                                    const Color(0xff808080).withOpacity(0.8),
                                    const Color(0xff808080).withOpacity(0.8),
                                    const Color(0xff8d8d8d).withOpacity(0.8),
                                    const Color(0xff9b9b9b).withOpacity(0.8),
                                    const Color(0xffa9a9a9).withOpacity(0.8),
                                    const Color(0xffb6b6b6).withOpacity(0.8),
                                    const Color(0xffc5c5c5).withOpacity(0.8),
                                    const Color(0xffd3d3d3).withOpacity(0.8),
                                    const Color(0xffe1e1e1).withOpacity(0.8),
                                    const Color(0xfff0f0f0).withOpacity(0.8),
                                    const Color(0xffffffff).withOpacity(0.8),
                                    const Color(0xffffffff).withOpacity(0.8),
                                    const Color(0xffffffff).withOpacity(0.8),
                                    const Color(0xfff0f0f0).withOpacity(0.8),
                                    const Color(0xffe1e1e1).withOpacity(0.8),
                                    const Color(0xffd3d3d3).withOpacity(0.8),
                                    const Color(0xffc5c5c5).withOpacity(0.8),
                                    const Color(0xffb6b6b6).withOpacity(0.8),
                                    const Color(0xffa9a9a9).withOpacity(0.8),
                                    const Color(0xff9b9b9b).withOpacity(0.8),
                                    const Color(0xff8d8d8d).withOpacity(0.8),
                                    const Color(0xff808080).withOpacity(0.8),
                                    const Color(0xff808080).withOpacity(0.8),
                                    const Color(0xff808080).withOpacity(0.8),
                                    const Color(0xff808080).withOpacity(0.8),
                                    const Color(0xff808080).withOpacity(0.8),
                                    const Color(0xff808080).withOpacity(0.8),
                                  ],
                                  tileMode: TileMode.repeated,
                                ),
                                child: Text(
                                  user.id!.toUpperCase(),
                                  style: GoogleFonts.bebasNeue(
                                    color: Colors.white.withOpacity(0.15),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 36,
                                    letterSpacing: 6,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Column(
                        children: [
                          ListTile(
                            dense: true,
                            title: Text(
                              user.name!.toUpperCase(),
                              style: GoogleFonts.lato(
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            subtitle: Text(
                              "Imiona",
                              style: GoogleFonts.lato(
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          const Divider(
                            height: 3,
                            indent: 15,
                            endIndent: 15,
                            color: Colors.white,
                          ),
                          ListTile(
                            dense: true,
                            title: Text(
                              user.surname!.toUpperCase(),
                              style: GoogleFonts.lato(
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            subtitle: Text(
                              "Nazwisko",
                              style: GoogleFonts.lato(
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          const Divider(
                            height: 3,
                            indent: 15,
                            endIndent: 15,
                            color: Colors.white,
                          ),
                          ListTile(
                            dense: true,
                            title: Text(
                              user.bdate!.toUpperCase(),
                              style: GoogleFonts.lato(
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            subtitle: Text(
                              "Data urodzenia",
                              style: GoogleFonts.lato(
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          const Divider(
                            height: 3,
                            indent: 15,
                            endIndent: 15,
                            color: Colors.white,
                          ),
                          ListTile(
                            dense: true,
                            title: Text(
                              user.title().toUpperCase(),
                              style: GoogleFonts.lato(
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            subtitle: Text(
                              "Funkcja",
                              style: GoogleFonts.lato(
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15)),
                      ),
                      child: SizedBox(
                        height: 200,
                        width: 180,
                        child: Stack(
                          children: [
                            ClipPath(
                              clipper: IDClipper(),
                              child: Foil(
                                opacity: 0.7,
                                gradient: const LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: <Color>[
                                    Color(0xff1e4e82),
                                    Color(0xff1e4e82),
                                    Color(0xff1e4e82),
                                    Color(0xff045587),
                                    Color(0xff005d8b),
                                    Color(0xff00648e),
                                    Color(0xff006a8f),
                                    Color(0xff007190),
                                    Color(0xff00778f),
                                    Color(0xff007d8e),
                                    Color(0xff00838c),
                                    Color(0xff007d8e),
                                    Color(0xff00778f),
                                    Color(0xff007190),
                                    Color(0xff006a8f),
                                    Color(0xff00648e),
                                    Color(0xff005d8b),
                                    Color(0xff045587),
                                    Color(0xff1e4e82),
                                    Color(0xff1e4e82),
                                    Color(0xff1e4e82),
                                  ],
                                  tileMode: TileMode.repeated,
                                ),
                                child: Container(
                                  alignment: Alignment.topLeft,
                                  height: 200,
                                  decoration: const BoxDecoration(
                                    color: Color(0xff1e4e82),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        bottomRight: Radius.circular(15)),
                                  ),
                                ),
                              ),
                            ),
                            ClipPath(
                              clipper: IDClipper(),
                              child: Container(
                                alignment: Alignment.topLeft,
                                height: 197,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      bottomRight: Radius.circular(15)),
                                ),
                              ),
                            ),
                            ClipPath(
                              clipper: IDClipper(),
                              child: Foil(
                                opacity: 0.7,
                                gradient: const LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: <Color>[
                                    Color(0xff1e4e82),
                                    Color(0xff1e4e82),
                                    Color(0xff1e4e82),
                                    Color(0xff045587),
                                    Color(0xff005d8b),
                                    Color(0xff00648e),
                                    Color(0xff006a8f),
                                    Color(0xff007190),
                                    Color(0xff00778f),
                                    Color(0xff007d8e),
                                    Color(0xff00838c),
                                    Color(0xff007d8e),
                                    Color(0xff00778f),
                                    Color(0xff007190),
                                    Color(0xff006a8f),
                                    Color(0xff00648e),
                                    Color(0xff005d8b),
                                    Color(0xff045587),
                                    Color(0xff1e4e82),
                                    Color(0xff1e4e82),
                                    Color(0xff1e4e82),
                                  ],
                                  tileMode: TileMode.repeated,
                                ),
                                child: Container(
                                  alignment: Alignment.topLeft,
                                  height: 194,
                                  decoration: const BoxDecoration(
                                    color: Color(0xff1e4e82),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        bottomRight: Radius.circular(15)),
                                  ),
                                ),
                              ),
                            ),
                            ClipPath(
                              clipper: IDClipper(),
                              child: Container(
                                alignment: Alignment.topLeft,
                                height: 191,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      bottomRight: Radius.circular(15)),
                                ),
                              ),
                            ),
                            ClipPath(
                              clipper: IDClipper(),
                              child: Foil(
                                opacity: 0.7,
                                gradient: const LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: <Color>[
                                    Color(0xff1e4e82),
                                    Color(0xff1e4e82),
                                    Color(0xff1e4e82),
                                    Color(0xff045587),
                                    Color(0xff005d8b),
                                    Color(0xff00648e),
                                    Color(0xff006a8f),
                                    Color(0xff007190),
                                    Color(0xff00778f),
                                    Color(0xff007d8e),
                                    Color(0xff00838c),
                                    Color(0xff007d8e),
                                    Color(0xff00778f),
                                    Color(0xff007190),
                                    Color(0xff006a8f),
                                    Color(0xff00648e),
                                    Color(0xff005d8b),
                                    Color(0xff045587),
                                    Color(0xff1e4e82),
                                    Color(0xff1e4e82),
                                    Color(0xff1e4e82),
                                  ],
                                  tileMode: TileMode.repeated,
                                ),
                                child: Container(
                                  alignment: Alignment.topLeft,
                                  height: 188,
                                  decoration: const BoxDecoration(
                                    color: Color(0xff1e4e82),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        bottomRight: Radius.circular(15)),
                                  ),
                                ),
                              ),
                            ),
                            ClipPath(
                              clipper: IDClipper(),
                              child: Container(
                                alignment: Alignment.topLeft,
                                height: 185,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      bottomRight: Radius.circular(15)),
                                ),
                              ),
                            ),
                            ClipPath(
                              clipper: IDClipper(),
                              child: Foil(
                                opacity: 0.7,
                                gradient: const LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: <Color>[
                                    Color(0xff1e4e82),
                                    Color(0xff1e4e82),
                                    Color(0xff1e4e82),
                                    Color(0xff045587),
                                    Color(0xff005d8b),
                                    Color(0xff00648e),
                                    Color(0xff006a8f),
                                    Color(0xff007190),
                                    Color(0xff00778f),
                                    Color(0xff007d8e),
                                    Color(0xff00838c),
                                    Color(0xff007d8e),
                                    Color(0xff00778f),
                                    Color(0xff007190),
                                    Color(0xff006a8f),
                                    Color(0xff00648e),
                                    Color(0xff005d8b),
                                    Color(0xff045587),
                                    Color(0xff1e4e82),
                                    Color(0xff1e4e82),
                                    Color(0xff1e4e82),
                                  ],
                                  tileMode: TileMode.repeated,
                                ),
                                child: Container(
                                  alignment: Alignment.topLeft,
                                  height: 182,
                                  decoration: const BoxDecoration(
                                    color: Color(0xff1e4e82),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        bottomRight: Radius.circular(15)),
                                  ),
                                ),
                              ),
                            ),
                            ClipPath(
                              clipper: IDClipper(),
                              child: Container(
                                alignment: Alignment.topLeft,
                                height: 179,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      bottomRight: Radius.circular(15)),
                                ),
                              ),
                            ),
                            ClipPath(
                              clipper: IDClipper(),
                              child: Foil(
                                opacity: 0.7,
                                gradient: const LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: <Color>[
                                    Color(0xff1e4e82),
                                    Color(0xff1e4e82),
                                    Color(0xff1e4e82),
                                    Color(0xff045587),
                                    Color(0xff005d8b),
                                    Color(0xff00648e),
                                    Color(0xff006a8f),
                                    Color(0xff007190),
                                    Color(0xff00778f),
                                    Color(0xff007d8e),
                                    Color(0xff00838c),
                                    Color(0xff007d8e),
                                    Color(0xff00778f),
                                    Color(0xff007190),
                                    Color(0xff006a8f),
                                    Color(0xff00648e),
                                    Color(0xff005d8b),
                                    Color(0xff045587),
                                    Color(0xff1e4e82),
                                    Color(0xff1e4e82),
                                    Color(0xff1e4e82),
                                  ],
                                  tileMode: TileMode.repeated,
                                ),
                                child: Container(
                                  alignment: Alignment.topLeft,
                                  height: 176,
                                  decoration: const BoxDecoration(
                                    color: Color(0xff1e4e82),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        bottomRight: Radius.circular(15)),
                                  ),
                                ),
                              ),
                            ),
                            ClipPath(
                              clipper: IDClipper(),
                              child: Container(
                                alignment: Alignment.topLeft,
                                height: 173,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      bottomRight: Radius.circular(15)),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 95,
                              top: 95,
                              width: 75,
                              height: 60,
                              child: Container(
                                alignment: Alignment.topLeft,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      top: 0,
                                      right: user.dotCode()[0] * 7,
                                      child: Container(
                                        height: 5,
                                        width: 5,
                                        decoration: const BoxDecoration(
                                          color: Colors.black26,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(15),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 10,
                                      right: user.dotCode()[1] * 7,
                                      child: Container(
                                        height: 5,
                                        width: 5,
                                        decoration: const BoxDecoration(
                                          color: Colors.black26,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(15),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 20,
                                      right: user.dotCode()[2] * 7,
                                      child: Container(
                                        height: 5,
                                        width: 5,
                                        decoration: const BoxDecoration(
                                          color: Colors.black26,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(15),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 30,
                                      right: user.dotCode()[3] * 7,
                                      child: Container(
                                        height: 5,
                                        width: 5,
                                        decoration: const BoxDecoration(
                                          color: Colors.black26,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(15),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 40,
                                      right: user.dotCode()[4] * 7,
                                      child: Container(
                                        height: 5,
                                        width: 5,
                                        decoration: const BoxDecoration(
                                          color: Colors.black26,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(15),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              alignment: Alignment.topLeft,
                              child: Row(
                                children: [
                                  const HoloDSL(75, 112.5),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      'DSL\nAK\n',
                                      style: GoogleFonts.signikaNegative(
                                        color: Colors.black26,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 32,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 80,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15)),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 5,
                spreadRadius: 1,
                offset: Offset(0, 5),
              )
            ],
          ),
          child: Row(
            children: [
              valid
                  ? Padding(
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: Icon(
                        Iconsax.tick_square,
                        color: Colors.green.withOpacity(0.8),
                        size: 60,
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: Icon(
                        Iconsax.close_square,
                        color: Colors.red.withOpacity(0.8),
                        size: 60,
                      ),
                    ),
              valid
                  ? Expanded(
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: "Dokument ważny",
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                color: Colors.green.withOpacity(0.8),
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          TextSpan(
                            text: " do dnia ${user.exdate!}",
                            style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ]),
                      ),
                    )
                  : Expanded(
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: "Dokument nieważny",
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                color: Colors.red.withOpacity(0.8),
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          TextSpan(
                            text: " od dnia ${user.exdate!}",
                            style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ),
            ],
          ),
        ),
      ],
    );
  }
}

class DocumentData extends StatefulWidget {
  final User user;
  const DocumentData(this.user, {Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<DocumentData> createState() => _DocumentDataState(user);
}

class _DocumentDataState extends State<DocumentData> {
  User user;
  _DocumentDataState(this.user);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Dane Dokumentu".toUpperCase(),
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              ListTile(
                dense: true,
                title: Text(
                  user.id!.toUpperCase(),
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                subtitle: Text(
                  "Numer legitymacji",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              Divider(
                height: 3,
                indent: 15,
                endIndent: 15,
                color: Theme.of(context).dividerColor,
              ),
              ListTile(
                dense: true,
                title: Text(
                  user.date!.toUpperCase(),
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                subtitle: Text(
                  "Data wydania",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              Divider(
                height: 3,
                indent: 15,
                endIndent: 15,
                color: Theme.of(context).dividerColor,
              ),
              ListTile(
                dense: true,
                title: Text(
                  "DSL Archidiecezji Krakowskiej".toUpperCase(),
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                subtitle: Text(
                  "Wydający dokument",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class DutyData extends StatefulWidget {
  final User user;
  const DutyData(this.user, {Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<DutyData> createState() => _DutyDataState(user);
}

class _DutyDataState extends State<DutyData> {
  User user;
  _DutyDataState(this.user);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Miejsce Posługi".toUpperCase(),
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(
          height: 3,
        ),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              ListTile(
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
              Divider(
                height: 3,
                indent: 15,
                endIndent: 15,
                color: Theme.of(context).dividerColor,
              ),
              ListTile(
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
              Divider(
                height: 3,
                indent: 15,
                endIndent: 15,
                color: Theme.of(context).dividerColor,
              ),
              ListTile(
                dense: true,
                title: Text(
                  user.location!.toUpperCase(),
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                subtitle: Text(
                  "Miejscowość",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              Divider(
                height: 3,
                indent: 15,
                endIndent: 15,
                color: Theme.of(context).dividerColor,
              ),
              ListTile(
                dense: true,
                title: Text(
                  user.dist().toUpperCase(),
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                subtitle: Text(
                  "Dzielnica",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class DutyDataExtended extends StatefulWidget {
  final User user;
  const DutyDataExtended(this.user, {Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<DutyDataExtended> createState() => _DutyDataExtendedState(user);
}

class _DutyDataExtendedState extends State<DutyDataExtended> {
  User user;
  _DutyDataExtendedState(this.user);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Dane Posługi".toUpperCase(),
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(
          height: 3,
        ),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              ListTile(
                dense: true,
                title: Text(
                  user.title().toUpperCase(),
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                subtitle: Text(
                  "Funkcja",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              Divider(
                height: 3,
                indent: 15,
                endIndent: 15,
                color: Theme.of(context).dividerColor,
              ),
              ListTile(
                dense: true,
                title: Text(
                  user.job().toUpperCase(),
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                subtitle: Text(
                  "Dodatkowe funkcje",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              user.details() != "none"
                  ? Divider(
                      height: 3,
                      indent: 15,
                      endIndent: 15,
                      color: Theme.of(context).dividerColor,
                    )
                  : Container(),
              user.details() != "none"
                  ? ListTile(
                      dense: true,
                      title: Text(
                        "-",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      subtitle: Text(
                        "Dodatkowe informacje",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ],
    );
  }
}
