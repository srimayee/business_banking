import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/hello_landing/model/hello_landing_entity.dart';
import 'package:business_banking/features/hello_landing/api/hello_landing_request_model.dart';
import 'package:business_banking/features/hello_landing/api/hello_landing_response_model.dart';
import 'package:business_banking/features/hello_landing/api/hello_landing_service.dart';

class HelloLandingServiceAdapter extends ServiceAdapter<HelloLandingEntity,
    HelloLandingServiceRequestModel, HelloLandingServiceResponseModel, HelloLandingService> {
  HelloLandingServiceAdapter() : super(HelloLandingService());

  @override
  HelloLandingEntity createEntity(
      HelloLandingEntity initialEntity, HelloLandingServiceResponseModel responseModel) {
    return initialEntity.merge(errors: <EntityError>[]);
  }

  @override
  HelloLandingServiceRequestModel createRequest(HelloLandingEntity entity) {
    return HelloLandingServiceRequestModel();
  }
}