import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  SecureStorageService._();

  factory SecureStorageService() {
    _this ??= SecureStorageService._();
    return _this!;
  }

  static SecureStorageService? _this;

  final _storage = const FlutterSecureStorage();
  final _androidOptions =
      const AndroidOptions(encryptedSharedPreferences: true);
  final _iosOptions =
      const IOSOptions(accessibility: KeychainAccessibility.first_unlock);

  Future<void> put({
    required String key,
    required String value,
  }) =>
      _storage.write(
        key: key,
        value: value,
        aOptions: _androidOptions,
        iOptions: _iosOptions,
      );

  Future<String?> get(String key) => _storage.read(
        key: key,
        aOptions: _androidOptions,
        iOptions: _iosOptions,
      );
}