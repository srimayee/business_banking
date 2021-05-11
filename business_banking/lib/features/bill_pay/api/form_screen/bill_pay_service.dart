import 'package:business_banking/features/bill_pay/api/form_screen/bill_pay_response_model.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class BillPayService
    extends EitherService<JsonRequestModel, BillPayResponseModel> {
  BillPayService()
      : super(
      method: RestMethod.get,
      restApi: ExampleLocator().api,
      path: 'bills');

  @override
  BillPayResponseModel parseResponse(
      Map<String, dynamic> jsonResponse) {
    return BillPayResponseModel.fromJson(jsonResponse);
  }
}