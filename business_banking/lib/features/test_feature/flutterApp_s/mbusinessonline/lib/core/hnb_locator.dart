import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:mbusinessonline/core/environment.dart';
import 'package:mbusinessonline/core/secure_storage_service.dart';

Logger logger() => HnbLocator().logger;

Repository repo() => HnbLocator().repository;

class HnbLocator implements Locator {
  factory HnbLocator() {
    Locator.init(HnbLocator._());
    return Locator.getInstance();
  }
  HnbLocator._();
  @override
  Logger logger = ConsoleLogger(LogLevel.debug);

  Repository repository = Repository();
  SecureStorageService storage = SecureStorageService();

  Environment environment = Environment.dev;
  Map<String, String> envConfig = {};

  @override
  Connectivity connectivity = AlwaysOnlineConnectivity();
}
