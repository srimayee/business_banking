import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

//Add additional input keys need to this enum
enum SecureStorageInputKey { currentEnv, username, companyId }

class SecureStoreInput {
  SecureStorageInputKey key;
  String value;
  SecureStoreInput(this.key, this.value);
}

class SecureStorageService {
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<String?> read(SecureStorageInputKey key) async {
    if (!kIsWeb) {
      final String? value = await storage.read(key: describeEnum(key));
      return value;
    }
    return null;
  }

  Future write(SecureStorageInputKey key, String value) async {
    if (!kIsWeb) {
      await storage.write(key: describeEnum(key), value: value);
    }
  }
}
