import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:business_banking/features/hello_customer_detail/model/hello_customer_detail_entity.dart';
import 'package:business_banking/features/hello_customer_detail/api/hello_customer_detail_service.dart';
import 'package:business_banking/features/hello_customer_detail/api/hello_customer_detail_service_response_model.dart';

class HelloCustomerDetailServiceAdapter extends ServiceAdapter<
    HelloCustomerDetailEntity,
    JsonRequestModel,
    HelloCustomerDetailServiceResponseModel,
    HelloCustomerDetailService> {
  HelloCustomerDetailServiceAdapter() : super(HelloCustomerDetailService());

  @override
  HelloCustomerDetailEntity createEntity(
      HelloCustomerDetailEntity initialEntity,
      HelloCustomerDetailServiceResponseModel responseModel) {
    return HelloCustomerDetailEntity(
        name: responseModel.name,
        currentTimeString: responseModel.currentTimeString);
  }
}
