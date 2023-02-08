import 'package:encrypt/encrypt.dart';

class Cryptor {
  var key = Key.fromBase64('yE9tgqNxWcYDTSPNM+EGQw==');
  var iv = IV.fromBase64('8PzGKSMLuqSm0MVbviaWHA==');

  passwordEncryption(String password)  {
     Encrypted? encrypted;
    final encrypter = Encrypter(AES(key));
    encrypted = encrypter.encrypt(password, iv: iv);
    return encrypted.base64;
  }

  passwordDencryption(String password) async {
    final decrypter = Encrypter(AES(key));
    final decrypted = decrypter.decrypt64(password, iv: iv);
    return decrypted;
  }
}
