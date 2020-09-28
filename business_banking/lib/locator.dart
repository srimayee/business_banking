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


  /// Points to Mockoon local instance
  /// If you are testing on a physical device or Android Emulator
  /// make sure to point to the proper endpoint of your local
  /// machine: Ex: http://192.1.2.123:3001/
  /// Just get the IP address from the localhost machine and replace the
  /// 'localhost' value within the baseUrl.
  SimpleRestApi api = SimpleRestApi(baseUrl: 'http://192.168.1.230:3001/');

  Repository repository = Repository();
}