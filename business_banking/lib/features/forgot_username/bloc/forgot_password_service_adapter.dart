
import 'package:business_banking/features/forgot_username/api/forgot%20_password_request_model.dart';
import 'package:business_banking/features/forgot_username/api/forgot_password_response_model.dart';
import 'package:business_banking/features/forgot_username/api/forgot_password_service.dart';
import 'package:business_banking/features/forgot_username/model/forgot_password_entity.dart';
import 'package:clean_framework/clean_framework.dart';

class ForgotPasswordServiceAdapter extends ServiceAdapter<ForgotPasswordEntity,
    ForgotPasswordServiceRequestModel, ForgotPasswordServiceResponseModel, ForgotPasswordService> {

  ForgotPasswordServiceAdapter() : super(ForgotPasswordService());

  @override
  ForgotPasswordServiceRequestModel createRequest(ForgotPasswordEntity entity) {
    return ForgotPasswordServiceRequestModel(
        email: entity.email);
  }

  @override
  ForgotPasswordEntity createEntity(initialEntity, responseModel) {
    return initialEntity.merge(errors: <EntityFailure>[]) as ForgotPasswordEntity;
  }
}
