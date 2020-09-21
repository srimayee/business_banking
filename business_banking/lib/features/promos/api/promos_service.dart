import 'package:business_banking/features/promos/api/promos_service_request_model.dart';
import 'package:business_banking/features/promos/api/promos_service_response_model.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class PromosService extends EitherService<PromosServiceRequestModel, PromosServiceResponseModel> {
  PromosService()
      : super(
          method: RestMethod.get,
          restApi: ExampleLocator().api,
          path: 'promos/{customerId}',
        );

  @override
  PromosServiceResponseModel parseResponse(Map<String, dynamic> jsonResponse) {
    return PromosServiceResponseModel.fromJson(jsonResponse);
  }
}
