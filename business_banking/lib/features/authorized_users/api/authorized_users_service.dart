
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

import '../../../authorized_users_locator.dart';
import 'authorized_users_response_model.dart';

class AuthorizedUsersService
    extends EitherService<JsonRequestModel, AuthorizedUsersServiceResponseModel> {
  AuthorizedUsersService()
      : super(
            method: RestMethod.get,
            restApi: AuthorizedUsersLocator().api,
            path: '/users');

  @override
  AuthorizedUsersServiceResponseModel parseResponse(Map<String, dynamic> jsonResponse) {
    print('Inside response');
    print(jsonResponse);
    return AuthorizedUsersServiceResponseModel.fromJson(jsonResponse);
  }
}
