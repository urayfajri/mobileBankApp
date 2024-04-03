import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const storage = FlutterSecureStorage();

class SecureStorage {
  Future<void> writeData(String key, dynamic value) async {
    await storage.write(key: key, value: value);
  }

  Future<String?> readData(String key) async {
    return storage.read(key: key);
  }

  Future<void> updateData(String key, dynamic value) async {
    await storage.write(key: key, value: value);
  }

  Future<void> deleteData(String key) async {
    await storage.delete(key: key);
  }

  Future<Map<String, String>> readAll() async {
    return await storage.readAll();
  }
}
