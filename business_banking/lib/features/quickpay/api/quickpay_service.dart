import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:business_banking/locator.dart';
import 'quickpay_service_response_model.dart';

class QuickPayService extends EitherService<JsonRequestModel, QuickPayServiceResponseModel> {
  QuickPayService() : super(
      method: RestMethod.get,
      restApi: ExampleLocator().api,
      path: 'quickpay'
  );

  @override
  QuickPayServiceResponseModel parseResponse(Map<String, dynamic> jsonResponse) {
    return QuickPayServiceResponseModel.fromJson(jsonResponse);
  }
}