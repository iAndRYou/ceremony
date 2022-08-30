import 'package:nfc_manager/nfc_manager.dart';
import 'package:nfc_manager/platform_tags.dart';

cardRead() {
  var gotToken;
  var gotID;
  var id;
  NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
    var ndef = Ndef.from(tag);
    var mifare = MifareClassic.from(tag);
    if (ndef == null || !ndef.isWritable) {
      NfcManager.instance
          .stopSession(errorMessage: 'Niewłaściwa karta. Spróbuj ponownie.');
      return;
    }
    if (mifare == null) {
      NfcManager.instance
          .stopSession(errorMessage: 'Niewłaściwa karta. Spróbuj ponownie.');
      return;
    }

    gotToken = ndef.cachedMessage?.records[0].payload;
    gotID = ndef.cachedMessage?.records[1].payload;
    id = mifare.identifier.toString();
    NfcManager.instance.stopSession();
  });
  return [gotToken, gotID, id];
}

void cardWrite(String token, String id) {
  NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
    var ndef = Ndef.from(tag);
    var mifare = MifareClassic.from(tag);
    if (ndef == null || !ndef.isWritable) {
      NfcManager.instance
          .stopSession(errorMessage: 'Niewłaściwa karta. Spróbuj ponownie.');
      return;
    }
    if (mifare == null) {
      NfcManager.instance
          .stopSession(errorMessage: 'Niewłaściwa karta. Spróbuj ponownie.');
      return;
    }

    NdefMessage message = NdefMessage([
      NdefRecord.createText(token),
      NdefRecord.createText(id),
    ]);

    try {
      await ndef.write(message);
      NfcManager.instance.stopSession();
    } catch (e) {
      NfcManager.instance
          .stopSession(errorMessage: 'Błąd zapisu. Spróbuj ponownie');
      return;
    }
  });
}
