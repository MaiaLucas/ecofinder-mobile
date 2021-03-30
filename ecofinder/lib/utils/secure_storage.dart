import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static FlutterSecureStorage secureStorage = FlutterSecureStorage();

  static Future writeSecureStorage(String key, String value) async {
    final writtenData = await secureStorage.write(key: key, value: value);

    return writtenData;
  }

  static Future readSecureStorage(String key) async {
    final readData = await secureStorage.read(key: key);
    return readData;
  }

  static Future readAllSecureStorage() async {
    Map<String, String> readData = await secureStorage.readAll();
    return readData;
  }

  static Future deleteSecureStorage() async {
    final deletedData = await secureStorage.deleteAll();
    return deletedData;
  }
}
