import 'package:business_banking/features/online_registration/api/online_registration_service.dart';
import 'package:business_banking/features/online_registration/api/online_registration_service_request_model.dart';
import 'package:business_banking/features/online_registration/api/online_registration_service_response_model.dart';
import 'package:business_banking/features/online_registration/model/online_registration_form_entry/online_registration_entity.dart';
import 'package:clean_framework/clean_framework.dart';

class OnlineRegistrationServiceAdapter extends ServiceAdapter<
    OnlineRegistrationEntity,
    OnlineRegistrationServiceRequestModel,
    OnlineRegistrationServiceResponseModel,
    OnlineRegistrationService> {
  OnlineRegistrationServiceAdapter() : super(OnlineRegistrationService());

  @override
  OnlineRegistrationEntity createEntity(initialEntity, responseModel) {
    return initialEntity.merge(
      errors: <EntityFailure>[],
      accountNumberGenerated: responseModel.accountNumberGenerated,
    ) as OnlineRegistrationEntity;
  }

  @override
  OnlineRegistrationServiceRequestModel createRequest(
      OnlineRegistrationEntity entity) {
    return OnlineRegistrationServiceRequestModel(
      cardHolderName: entity.cardHolderName,
      cardNumber: entity.cardNumber,
      email: entity.email,
      ssnLastFourDigits: entity.ssnLastFourDigits,
      userPassword: entity.userPassword,
    );
  }
}
