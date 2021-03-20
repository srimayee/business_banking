import 'package:business_banking/features/qr_code_generator/api/qr_code_generator_service.dart';
import 'package:business_banking/features/qr_code_generator/bloc/qr_code_generator_usecase.dart';
import 'package:business_banking/features/qr_code_generator/model/qr_code_generator_view_model.dart';
import 'package:clean_framework/clean_framework.dart';

class QRCodeGeneratorBloc extends Bloc {
  QRCodeGeneratorUseCase _useCase;
  final qrCodeGeneratorViewModelPipe = Pipe<QRCodeGeneratorViewModel>();

  @override
  void dispose() {
    qrCodeGeneratorViewModelPipe.dispose();
  }

  QRCodeGeneratorBloc({QRCodeGeneratorService qrCodeGeneratorService}) {
    _useCase = QRCodeGeneratorUseCase(
        (viewModel) => qrCodeGeneratorViewModelPipe.send(viewModel));
    qrCodeGeneratorViewModelPipe.whenListenedDo(() => _useCase.create());
  }
}
