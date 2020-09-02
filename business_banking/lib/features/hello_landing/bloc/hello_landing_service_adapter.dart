import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/hello_landing/model/hello_landing_entity.dart';
import 'package:business_banking/features/hello_landing/api/hello_landing_service.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class HelloLandingServiceAdapter extends ServiceAdapter<HelloLandingEntity,
    JsonRequestModel, JsonResponseModel, HelloLandingService> {
  HelloLandingServiceAdapter() : super(HelloLandingService());

  @override
  HelloLandingEntity createEntity(
      HelloLandingEntity initialEntity, JsonResponseModel responseModel) {
    return initialEntity.merge(errors: <EntityError>[]);
  }
}