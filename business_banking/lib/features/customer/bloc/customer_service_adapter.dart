import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:business_banking/features/customer/model/customer_entity.dart';
import 'package:business_banking/features/customer/api/customer_service.dart';
import 'package:business_banking/features/customer/api/customer_service_response_model.dart';

import '../model/customer_entity.dart';

class CustomerServiceAdapter extends ServiceAdapter<
    CustomerEntity,
    JsonRequestModel,
    CustomerServiceResponseModel,
    CustomerService> {
  CustomerServiceAdapter() : super(CustomerService());

  @override
  CustomerEntity createEntity(
      CustomerEntity initialEntity,
      CustomerServiceResponseModel responseModel) {
    return CustomerEntity(
        honorific: responseModel.honorific,
        firstName: responseModel.firstName,
        lastName: responseModel.lastName,
        nickName: responseModel.nickName,
        accountType: responseModel.accountType == "private" ? AccountType.private : AccountType.retail,
        address: responseModel.address);
  }
}
