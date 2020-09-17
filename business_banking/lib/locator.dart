import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

ExampleLocator locator() => ExampleLocator();

Logger logger() => ExampleLocator().logger;

class ExampleLocator implements Locator {
  ExampleLocator._();

  factory ExampleLocator() {
    Locator.instance ??= ExampleLocator._();
    return Locator.instance;
  }

  @override
  Connectivity connectivity = AlwaysOnlineConnectivity();

  @override
  Logger logger = ConsoleLogger(LogLevel.verbose);

  /// Points to Mockoon instance
  /// If you are testing on a physical device make sure to point to
  /// the proper endpoint: Ex: http://192.1.2.123:3001/
  SimpleRestApi api = SimpleRestApi(baseUrl: 'http://localhost:3001/');

  Repository repository = Repository();
}