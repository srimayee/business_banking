import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:business_banking/features/quickpay/model/quickpay_entity.dart';
import 'package:business_banking/features/quickpay/api/quickpay_service.dart';
import 'package:business_banking/features/quickpay/api/quickpay_service_response_model.dart';

class QuickPayServiceAdapter extends ServiceAdapter<QuickPayEntity,
      JsonRequestModel, QuickPayServiceResponseModel, QuickPayService> {
  QuickPayServiceAdapter() :super(QuickPayService());

  @override
  QuickPayEntity createEntity(
      QuickPayEntity initialEntity, QuickPayServiceResponseModel responseModel) {
    return QuickPayEntity(
      name: responseModel.name,
      email: responseModel.email,
      imageUrl: responseModel.imageUrl,
    );
  }
}
