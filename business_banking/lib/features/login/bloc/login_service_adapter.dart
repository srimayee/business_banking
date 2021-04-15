import 'package:business_banking/features/login/api/login_service.dart';
import 'package:business_banking/features/login/api/login_service_request_model.dart';
import 'package:business_banking/features/login/api/login_service_response_model.dart';
import 'package:business_banking/features/login/model/login_entity.dart';
import 'package:clean_framework/clean_framework.dart';

class LoginServiceAdapter extends ServiceAdapter<LoginEntity,
    LoginServiceRequestModel, LoginServiceResponseModel, LoginService> {

  LoginServiceAdapter() : super(LoginService());

  @override
  LoginServiceRequestModel createRequest(LoginEntity entity) {
    return LoginServiceRequestModel(
        userName: entity.userName, password: entity.password);
  }

  @override
  LoginEntity createEntity(initialEntity, responseModel) {
    return initialEntity.merge(errors: <EntityFailure>[]) as LoginEntity;
  }
}
