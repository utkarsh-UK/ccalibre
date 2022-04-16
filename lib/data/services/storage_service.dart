import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

/// Extends [GetxService] to implement read and writes to storage.
class SecuredStorageService extends GetxService {
  late FlutterSecureStorage _secureStorage;
  late GetStorage _box;

  Future<SecuredStorageService> init() async {
    _box = GetStorage();
    _secureStorage = const FlutterSecureStorage();
    // await _box.writeIfNull(Constants.medStorageKey, []);
    // await _box.writeIfNull(Constants.docStorageKey, []);

    return this;
  }

  /// Reads and returns object of type [T] having storage key [key].
  T read<T>(String key) {
    return _box.read(key);
  }

  /// Writes [value] with [key].
  void write(String key, dynamic value) async {
    await _box.write(key, value);
  }

  Future<void> writeSecured<T>(String key, String value) async {
    return await _secureStorage.write(key: key, value: value);
  }

  Future<String?> readSecured(String key) async {
    return await _secureStorage.read(key: key);
  }
}
