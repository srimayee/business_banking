import 'package:business_banking/features/qr_code_generator/api/qr_code_generator_service_model.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class QRCodeGeneratorService extends EitherService<JsonRequestModel,
    QRCodeGeneratorServiceResponseModel> {
  QRCodeGeneratorService()
      : super(
            method: RestMethod.get,
            restApi: mockService ?? false
                ? ExampleLocator().api
                : ExampleLocator().qrCodeSeedApi,
            path: 'seed');
  //added to use mocked service through Mockoon in test cases
  static bool mockService;

  @override
  QRCodeGeneratorServiceResponseModel parseResponse(
      Map<String, dynamic> jsonResponse) {
    return QRCodeGeneratorServiceResponseModel.fromJson(jsonResponse);
  }
}
