
import 'package:business_banking/features/authorized_users/api/authorized_users_response_model.dart';
import 'package:business_banking/features/authorized_users/api/authorized_users_service.dart';
import 'package:business_banking/features/authorized_users/model/authorized_users_entity.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class AuthorizedUsersServiceAdapter extends ServiceAdapter<AuthorizedUsersEntity,
    JsonRequestModel, AuthorizedUsersServiceResponseModel, AuthorizedUsersService> {

  AuthorizedUsersServiceAdapter() : super(AuthorizedUsersService());

  @override
  AuthorizedUsersEntity createEntity(AuthorizedUsersEntity initialEntity, AuthorizedUsersServiceResponseModel responseModel) {
    print('createEntity');
    return initialEntity.merge(authorizedUsers: responseModel.authorizedUsers);
  }
}
