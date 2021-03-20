import 'package:business_banking/features/qr_code_generator/api/qr_code_generator_service_model.dart';
import 'package:business_banking/features/qr_code_generator/bloc/qr_code_generator_service_adapter.dart';
import 'package:business_banking/features/qr_code_generator/model/qr_code_generator_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Entity is created by service adapter', () {
    final entity = QRCodeGeneratorServiceAdapter().createEntity(
        QRCodeGeneratorEntity(),
        QRCodeGeneratorServiceResponseModel.fromJson({
          'seed': '2a6abu',
          'expiresAt': '2080-02-18T23:42:30.802Z',
        }));

    expect(
        entity,
        QRCodeGeneratorEntity(
            seed: '2a6abu', expiresAt: '2080-02-18T23:42:30.802Z'));
  });

  test('Entity is created by service adapter for service failure', () {
    final entity = QRCodeGeneratorServiceAdapter().createEntity(
        QRCodeGeneratorEntity(),
        QRCodeGeneratorServiceResponseModel.fromJson({
          'seed': '',
          'expiresAt': '',
        }));

    expect(entity, QRCodeGeneratorEntity(seed: '', expiresAt: ''));
  });
}
