import 'dart:math';
import 'package:encrypt/encrypt.dart';
import 'package:intl/intl.dart';
import 'package:ntp/ntp.dart';

List<String> keys = [
  '4t7w!z%C*F)J@NcRfUjXn2r5u8x/A?D(',
  'x!A%D*G-JaNdRgUkXp2s5v8y/B?E(H+M',
  'w!z%C*F-JaNdRfUjXn2r5u8x/A?D(G+K',
  'gUkXp2s5u8x/A?D(G+KbPeShVmYq3t6w',
  'mZq4t7w!z#C&F)J@NcRfUjXn2r5u8x/A',
  '2r5u8x/A%D*G-KaPdSgVkYp3s6v9y=B&',
  'cQfTjWmZq4t7w!z%C*F-JaNdRgUkXp2r',
  '+KbPeShVmYq3t6v9y&B&E)H@McQfTjWn',
  'q3t6w9z%C&F)H@McQfTjWnZr4u7x!A%D',
  'VmYq3t6w9z*C&F)J@NcRfUjWnZr4u7x!',
];

String encrypt(String id) {
  int index = Random.secure().nextInt(10);
  final key = Key.fromUtf8(keys[index]);
  final iv = IV.fromLength(16);
  return Encrypter(AES(key)).encrypt(id, iv: iv).base64 + index.toString();
}

String decrypt(String id) {
  int index = int.parse(id.substring(id.length - 1));
  id = id.replaceRange(id.length - 1, id.length, '');
  final key = Key.fromUtf8(keys[index]);
  final iv = IV.fromLength(16);
  String decrypted = Encrypter(AES(key)).decrypt64(id, iv: iv);
  return decrypted;
}

class TimeNow {
  Future<String> getStamp() async {
    var now = await NTP.now();
    return "${DateFormat('dd.MM.yyyy').format(now)}   ${DateFormat('HH:mm').format(now)}";
  }
}
