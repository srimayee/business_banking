import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'core/patch_simple_rest_api.dart';

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
  PatchSimpleRestApi api = PatchSimpleRestApi(baseUrl: 'http://localhost:3001/'); // Points to Mockoon instance

  Repository repository = Repository();
}