import 'dart:async';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:v2ray_vpn/core/data/local/storage_service.dart';

class SecureSharedPrefsService implements StorageService {
  FlutterSecureStorage? sharedPreferences;

  AndroidOptions _getAndroidOptions() =>
      const AndroidOptions(encryptedSharedPreferences: true);

  @override
  void init() {
    sharedPreferences = FlutterSecureStorage(aOptions: _getAndroidOptions());
  }

  @override
  bool get hasInitialized => sharedPreferences != null;

  @override
  Future<Object?> get(String key) async {
    return sharedPreferences!.read(key: key);
  }

  @override
  Future<void> clear() async {
    await sharedPreferences!.deleteAll();
  }

  @override
  Future<bool> has(String key) async {
    return sharedPreferences?.containsKey(key: key) ?? false;
  }

  @override
  Future<bool> remove(String key) async {
    try {
      await sharedPreferences!.delete(key: key);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> set(String key, data) async {
    try {
      await sharedPreferences!.write(key: key, value: data.toString());
      return true;
    } catch (e) {
      return false;
    }
  }
}
