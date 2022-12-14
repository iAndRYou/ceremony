import 'package:ceremony/classes/security.dart';
import 'package:ntp/ntp.dart';

enum UserType {
  check,
  acc,
  name,
  surname,
  bdate,

  pin,
  id,
  date,
  exdate,
  years,

  parish,
  deca,
  location,
  district,
  council,
  prize
}

class User {
  // user identification attributes
  String? acc; // AUTO type of account -> [x, x, x] title, job, details

  String? name; // name / names
  String? surname; // surname
  String? bdate; // birthday

  String? pin; // AUTO user's pin
  String? id; // AUTO user id -> to implement BIG DATA
  String? date; // AUTO date of issue
  String? exdate; // AUTO date of expiration
  String? years; // AUTO unobstructed

  String? parish; // parish name
  String? deca; // deca name
  String? location; // location name
  String? district; // if Cracow -> district name
  String? council; // AUTO council rights [0, 0, 0] if, deca, year of expiration
  String? prize; // AUTO prizes record [0, 0] times, date of prize

  User();

  User.fromToken(String token) {
    var data = decrypt(token).split('+');
    acc = data[1];

    name = data[2];
    surname = data[3];
    bdate = data[4];

    pin = data[5];
    id = data[6];
    date = data[7];
    exdate = data[8];
    years = data[9];

    parish = data[10];
    deca = data[11];
    location = data[12];
    district = data[13];

    council = data[14];
    prize = data[15];
  }

  String toToken() {
    var data = "CRMNY";
    data +=
        '+$acc+$name+$surname+$bdate+$pin+$id+$date+$exdate+$years+$parish+$deca+$location+$district+$council+$prize';
    return encrypt(data);
  }

  update(UserType type, String value) {
    switch (type) {
      case UserType.acc:
        acc = value;
        break;
      case UserType.name:
        name = value;
        break;
      case UserType.surname:
        surname = value;
        break;
      case UserType.bdate:
        bdate = value;
        break;
      case UserType.pin:
        pin = value;
        break;
      case UserType.id:
        id = value;
        break;
      case UserType.date:
        exdate = value;
        break;
      case UserType.exdate:
        exdate = value;
        break;
      case UserType.years:
        years = value;
        break;
      case UserType.parish:
        parish = value;
        break;
      case UserType.deca:
        deca = value;
        break;
      case UserType.location:
        location = value;
        break;
      case UserType.district:
        district = value;
        break;
      case UserType.council:
        council = value;
        break;
      case UserType.prize:
        prize = value;
        break;
      default:
        throw Error();
    }
  }

  String deanery() {
    Map<String, String> d = {
      "1": "Krak??w Centrum",
      "2": "Krak??w Kazimierz",
      "3": "Krak??w Salwator",
      "4": "Krak??w Bronowice",
      "5": "Krak??w Krowodrza",
      "6": "Krak??w Pr??dnik",
      "7": "Krak??w Podg??rze",
      "8": "Krak??w Prokocim",
      "9": "Krak??w Borek Fa????cki",
      "10": "Krak??w Mogi??a",
      "11": "Krak??w Bie??czyce",
      "12": "Babice",
      "13": "Bia??ka Tatrza??ska",
      "14": "Bia??y Dunajec",
      "15": "Bolechowice",
      "16": "Chrzan??w",
      "17": "Czarny Dunajec",
      "18": "Czernich??w",
      "19": "Dobczyce",
      "20": "Jab??onka",
      "21": "Jordan??w",
      "22": "Kalwaria",
      "23": "Krzeszowice",
      "24": "Libi????",
      "25": "Mak??w Podhala??ski",
      "26": "Mogilany",
      "27": "Mszana Dolna",
      "28": "My??lenice",
      "29": "Niedzica",
      "30": "Niegowi??",
      "31": "Niepo??omice",
      "32": "Nowy Targ",
      "33": "Pcim",
      "34": "Rabka",
      "35": "Skawina",
      "36": "Sucha Beskidzka",
      "37": "Su??kowice",
      "38": "Trzebinia",
      "39": "Wadowice P????noc",
      "40": "Wadowice Po??udnie",
      "41": "Wawrze??czyce",
      "42": "Wieliczka Wsch??d",
      "43": "Wieliczka Zach??d",
      "44": "Zakopane",
      "45": "Zator",
      "sa": "Krak??w Sanktuaria",
      "ww": "Krak??w Wawel",
    };
    return d[deca]!;
  }

  String dist() {
    Map<String, String> d = {
      "1": "Stare Miasto",
      "2": "Grzeg??rzki",
      "3": "Pr??dnik Czerwony",
      "4": "Pr??dnik Bia??y",
      "5": "Krowodrza",
      "6": "Bronowice",
      "7": "Zwierzyniec",
      "8": "D??bniki",
      "9": "??agiewniki-Borek Fa????cki",
      "10": "Swoszowice",
      "11": "Podg??rze Duchackie",
      "12": "Bie??an??w-Prokocim",
      "13": "Podg??rze",
      "14": "Czy??yny",
      "15": "Mistrzejowice",
      "16": "Bie??czyce",
      "17": "Wzg??rza Krzes??awickie",
      "18": "Nowa Huta",
    };
    return d[district]!;
  }

  String title() {
    Map<String, String> t = {
      "A": "Administrator",
      "N": "Animator",
      "C": "Ceremoniarz",
      "D": "Duszpasterz AK",
    };
    return t[acc!.split(' ')[0]]!;
  }

  String job() {
    Map<String, String> j = {
      "0": "-",
      "L": "Wyk??adowca SCP",
      "W": "Prowadz??cy warsztat SCP",
      "C": "Ceremoniarz",
      "D": "Duszpasterz AK",
    };
    return j[acc!.split(' ')[1]]!;
  }

  String details() {
    Map<String, String> d = {
      "0": "none",
    };
    return d[acc!.split(' ')[2]]!;
  }

  String duration() {
    if (years == '0') {
      return "-";
    } else {
      return "${years!}.";
    }
  }

  List<int> dotCode() {
    var table = id!.split("-");
    var data13 = int.parse(table[0]);
    var data45 = int.parse(table[1]);
    return [
      data13 ~/ 1000 + data45 ~/ 100,
      data13 ~/ 10 % 10,
      data13 % 10,
      (data45 ~/ 10) % 10,
      data45 % 10
    ];
  }

  Future<bool> valid() async {
    var ex =
        exdate!.split(".")[2] + exdate!.split(".")[1] + exdate!.split(".")[0];
    var exDT = DateTime.parse(ex);
    var now = await NTP.now();
    if (now.isBefore(exDT)) {
      return true;
    } else {
      return false;
    }
  }
}
