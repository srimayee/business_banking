import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import '../../../locator.dart';
import 'mortgage_detail_service_response_model.dart';

class MortgageDetailService extends EitherService<JsonRequestModel,
    MortgageDetailServiceResponseModel> {
  MortgageDetailService()
      : super(
          method: RestMethod.get,
          restApi: ExampleLocator().api,
          path: 'mortgage-details',
        );

  @override
  MortgageDetailServiceResponseModel parseResponse(
      Map<String, dynamic> jsonResponse) {
    return MortgageDetailServiceResponseModel.fromJson(jsonResponse);
  }
}
