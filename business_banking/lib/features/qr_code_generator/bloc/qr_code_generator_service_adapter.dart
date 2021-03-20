import 'package:business_banking/features/qr_code_generator/api/qr_code_generator_service.dart';
import 'package:business_banking/features/qr_code_generator/api/qr_code_generator_service_model.dart';
import 'package:business_banking/features/qr_code_generator/model/qr_code_generator_entity.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class QRCodeGeneratorServiceAdapter extends ServiceAdapter<
    QRCodeGeneratorEntity,
    JsonRequestModel,
    QRCodeGeneratorServiceResponseModel,
    QRCodeGeneratorService> {
  QRCodeGeneratorServiceAdapter() : super(QRCodeGeneratorService());

  @override
  QRCodeGeneratorEntity createEntity(QRCodeGeneratorEntity initialEntity,
      QRCodeGeneratorServiceResponseModel responseModel) {
    return QRCodeGeneratorEntity(
      seed: responseModel.seed,
      expiresAt: responseModel.expiresAt,
    );
  }
}
