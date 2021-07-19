import 'package:business_banking/dependency/url_launcher.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

import 'core/patch_simple_rest_api.dart';

AuthorizedUsersLocator locator() => AuthorizedUsersLocator();

Logger logger() => AuthorizedUsersLocator().logger;

Future<void> openUrl(url) => AuthorizedUsersLocator().urlLauncher!.launchURL(url);

class AuthorizedUsersLocator implements Locator {
  AuthorizedUsersLocator._();

  factory AuthorizedUsersLocator() {
    Locator.init(AuthorizedUsersLocator._());
    return Locator.getInstance();
  }

  @override
  Connectivity connectivity = AlwaysOnlineConnectivity();

  @override
  Logger logger = ConsoleLogger(LogLevel.verbose);

  UrlLauncher? urlLauncher = UrlLauncher();

  PatchSimpleRestApi api = PatchSimpleRestApi(
      baseUrl: 'https://gorest.co.in/public/v1');

  Repository repository = Repository();

  void dispose() => Locator.dispose();
}
