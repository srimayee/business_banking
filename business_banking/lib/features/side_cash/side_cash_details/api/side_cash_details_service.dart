import 'dart:convert';

import 'package:business_banking/features/side_cash/side_cash_details/api/side_cash_details_request_model.dart';
import 'package:business_banking/features/side_cash/side_cash_details/api/side_cash_details_response_model.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class SideCashDetailsService extends EitherService<SideCashDetailsRequestModel,
    SideCashDetailsResponseModel> {
  SideCashDetailsService()
      : super(
            method: RestMethod.get,
            restApi: ExampleLocator().api,
            path: 'side-cash-details');
  @override
  SideCashDetailsResponseModel parseResponse(
      Map<String, dynamic> jsonResponse) {
    print("JSON Response -> " + jsonResponse.toString());
    return SideCashDetailsResponseModel.fromJson(jsonResponse);
  }
}
