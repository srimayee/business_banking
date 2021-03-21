import 'package:business_banking/features/qr_code_generator/bloc/qr_code_generator_bloc.dart';
import 'package:business_banking/features/qr_code_generator/model/qr_code_generator_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:mockito/mockito.dart';

class QRCodeGeneratorBlocFailureMock extends Fake
    implements QRCodeGeneratorBloc {
  Pipe<QRCodeGeneratorViewModel> qrCodeGeneratorViewModelPipe =
      Pipe<QRCodeGeneratorViewModel>();

  QRCodeGeneratorBlocFailureMock() {
    qrCodeGeneratorViewModelPipe.whenListenedDo(() {
      qrCodeGeneratorViewModelPipe.send(QRCodeGeneratorViewModel(
        seed: '',
        expiresAt: '',
      ));
    });
  }

  @override
  void dispose() {
    qrCodeGeneratorViewModelPipe.dispose();
  }
}
