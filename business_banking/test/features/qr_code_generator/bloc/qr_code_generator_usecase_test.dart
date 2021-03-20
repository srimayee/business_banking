import 'package:business_banking/features/qr_code_generator/api/qr_code_generator_service.dart';
import 'package:business_banking/features/qr_code_generator/bloc/qr_code_generator_usecase.dart';
import 'package:business_banking/features/qr_code_generator/model/qr_code_generator_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('QRGenerator useCase initialize and create', () {
    final useCase = QRCodeGeneratorUseCase((viewModel) {
      expect(viewModel, isA<QRCodeGeneratorViewModel>());
    });
    useCase.create();
  });
  test('QRGenerator useCase creates proper data', () async {
    QRCodeGeneratorService.mockService = true;
    QRCodeGeneratorViewModel model;
    QRCodeGeneratorUseCase useCase = QRCodeGeneratorUseCase((viewModel) {
      model = viewModel;
    });

    await useCase.create();

    expect(
        model,
        QRCodeGeneratorViewModel(
            seed: '2a6abu', expiresAt: '2080-02-18T23:42:30.802Z'));
  });

  test('Test QRGenerator useCase with error', () {
    try {
      QRCodeGeneratorUseCase(null);
      expect(false, true);
    } catch (error) {
      expect(error != null, true);
    }
  });
}
