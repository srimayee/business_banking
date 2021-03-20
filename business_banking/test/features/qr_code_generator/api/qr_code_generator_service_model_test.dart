import 'package:business_banking/features/qr_code_generator/api/qr_code_generator_service_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('QRCodeGeneratorServiceResponseModel response', () {
    final response = QRCodeGeneratorServiceResponseModel.fromJson(
        {"seed": "2a6abu", "expiresAt": "2080-02-18T23:42:30.802Z"});
    expect(response.seed, '2a6abu');
    expect(response.expiresAt, '2080-02-18T23:42:30.802Z');
    expect(response.props, ['2a6abu', '2080-02-18T23:42:30.802Z']);
  });

  test(
      'Validate integer to string conversion of QRCodeGeneratorServiceResponseModel response',
      () {
    final response = QRCodeGeneratorServiceResponseModel.fromJson(
        {"seed": 12345, "expiresAt": 2020});
    expect(response.seed, "12345");
    expect(response.expiresAt, '2020');
    expect(response.props, ['12345', '2020']);
  });

  test('Validate empty QRCodeGeneratorServiceResponseModel response', () {
    final response = QRCodeGeneratorServiceResponseModel.fromJson({});
    expect(response.seed, '');
    expect(response.expiresAt, '');
    expect(response.props, ['', '']);
  });
}
