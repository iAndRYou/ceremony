import 'package:ceremony/classes/security.dart';
import 'package:ntp/ntp.dart';

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

  String deanery() {
    Map<String, String> d = {
      "1": "Kraków Centrum",
      "2": "Kraków Kazimierz",
      "3": "Kraków Salwator",
      "4": "Kraków Bronowice",
      "5": "Kraków Krowodrza",
      "6": "Kraków Prądnik",
      "7": "Kraków Podgórze",
      "8": "Kraków Prokocim",
      "9": "Kraków Borek Fałęcki",
      "10": "Kraków Mogiła",
      "11": "Kraków Bieńczyce",
      "12": "Babice",
      "13": "Białka Tatrzańska",
      "14": "Biały Dunajec",
      "15": "Bolechowice",
      "16": "Chrzanów",
      "17": "Czarny Dunajec",
      "18": "Czernichów",
      "19": "Dobczyce",
      "20": "Jabłonka",
      "21": "Jordanów",
      "22": "Kalwaria",
      "23": "Krzeszowice",
      "24": "Libiąż",
      "25": "Maków Podhalański",
      "26": "Mogilany",
      "27": "Mszana Dolna",
      "28": "Myślenice",
      "29": "Niedzica",
      "30": "Niegowić",
      "31": "Niepołomice",
      "32": "Nowy Targ",
      "33": "Pcim",
      "34": "Rabka",
      "35": "Skawina",
      "36": "Sucha Beskidzka",
      "37": "Sułkowice",
      "38": "Trzebinia",
      "39": "Wadowice Północ",
      "40": "Wadowice Południe",
      "41": "Wawrzeńczyce",
      "42": "Wieliczka Wschód",
      "43": "Wieliczka Zachód",
      "44": "Zakopane",
      "45": "Zator",
      "sa": "Kraków Sanktuaria",
      "ww": "Kraków Wawel",
    };
    return d[deca]!;
  }

  String dist() {
    Map<String, String> d = {
      "1": "Stare Miasto",
      "2": "Grzegórzki",
      "3": "Prądnik Czerwony",
      "4": "Prądnik Biały",
      "5": "Krowodrza",
      "6": "Bronowice",
      "7": "Zwierzyniec",
      "8": "Dębniki",
      "9": "Łagiewniki-Borek Fałęcki",
      "10": "Swoszowice",
      "11": "Podgórze Duchackie",
      "12": "Bieżanów-Prokocim",
      "13": "Podgórze",
      "14": "Czyżyny",
      "15": "Mistrzejowice",
      "16": "Bieńczyce",
      "17": "Wzgórza Krzesławickie",
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
      "L": "Wykładowca SCP",
      "W": "Prowadzący warsztat SCP",
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
