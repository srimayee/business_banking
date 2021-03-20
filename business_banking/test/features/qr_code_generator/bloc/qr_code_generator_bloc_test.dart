import 'package:business_banking/features/qr_code_generator/api/qr_code_generator_service.dart';
import 'package:business_banking/features/qr_code_generator/bloc/qr_code_generator_bloc.dart';
import 'package:business_banking/features/qr_code_generator/model/qr_code_generator_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

import 'qr_code_generator_bloc_mock.dart';

void main() {
  test('QuickPayBloc gets Failure view model, mock', () {
    final bloc = QRCodeGeneratorBlocFailureMock();
    bloc.qrCodeGeneratorViewModelPipe.receive.listen(expectAsync1((model) {
      expect(model, isA<QRCodeGeneratorViewModel>());
      expect(model.seed, '');
      expect(model.expiresAt, '');
    }));
  });

  test('QuickPayBloc gets view model, real', () {
    final bloc = QRCodeGeneratorBloc();
    QRCodeGeneratorService.mockService = true;
    bloc.qrCodeGeneratorViewModelPipe.receive.listen(expectAsync1((model) {
      expect(model, isA<QRCodeGeneratorViewModel>());
      expect(model.seed, '2a6abu');
      expect(model.expiresAt, '2080-02-18T23:42:30.802Z');
    }));
  });
}
