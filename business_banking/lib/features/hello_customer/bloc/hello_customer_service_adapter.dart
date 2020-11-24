import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:business_banking/features/hello_customer/model/hello_customer_entity.dart';
import 'package:business_banking/features/hello_customer/api/hello_customer_service.dart';
import 'package:business_banking/features/hello_customer/api/hello_customer_service_response_model.dart';

import '../model/hello_customer_entity.dart';

class HelloCustomerServiceAdapter extends ServiceAdapter<
    HelloCustomerEntity,
    JsonRequestModel,
    HelloCustomerServiceResponseModel,
    HelloCustomerService> {
  HelloCustomerServiceAdapter() : super(HelloCustomerService());

  @override
  HelloCustomerEntity createEntity(
      HelloCustomerEntity initialEntity,
      HelloCustomerServiceResponseModel responseModel) {
    return HelloCustomerEntity(
        honrsic: responseModel.honrsic,
        firstName: responseModel.firstName,
        lastName: responseModel.lastName,
        nickName: responseModel.nickName,
        accountType: responseModel.accountType == "private" ? AccountType.private : AccountType.retail,);
  }
}
