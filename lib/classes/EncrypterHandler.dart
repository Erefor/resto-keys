import 'package:encrypt/encrypt.dart' as Salsa;

class EncrypterHandler {
  static String encryptPassword(String password) {
    final key = Salsa.Key.fromLength(32);
    final iv = Salsa.IV.fromLength(8);
    final encrypter = Salsa.Encrypter(Salsa.Salsa20(key));
    return encrypter.encrypt(password, iv: iv).base64;
  }

  static String decodePassword(String password) {
    final key = Salsa.Key.fromLength(32);
    final encrypter = Salsa.Encrypter(Salsa.Salsa20(key));
    final iv = Salsa.IV.fromLength(8);
    return encrypter.decrypt64(password, iv: iv);
  }
}
