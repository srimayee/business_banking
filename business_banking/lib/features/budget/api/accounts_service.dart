import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:business_banking/locator.dart';

import 'accounts_json_response_model.dart';

class AccountsService
    extends EitherService<JsonRequestModel, AccountsJsonResponseModel> {
  AccountsService()
      : super(
            method: RestMethod.get,
            restApi: ExampleLocator().api,
            path: 'accounts');

  @override
  AccountsJsonResponseModel parseResponse(Map<String, dynamic> jsonResponse) =>
      AccountsJsonResponseModel.fromJson(jsonResponse);
}
