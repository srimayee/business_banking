import 'package:business_banking/features/transfer_funds/bloc/transfer_confirmation_usecase.dart';
import 'package:business_banking/features/transfer_funds/model/transfer_confirmation_view_model.dart';
import 'package:clean_framework/clean_framework.dart';

class TransferConfirmationBloc extends Bloc {
  TransferConfirmationUseCase _useCase;

  final viewModelPipe = Pipe<TransferConfirmationViewModel>();

  TransferConfirmationBloc() {
    _useCase = TransferConfirmationUseCase((viewModel) => viewModelPipe.send(viewModel));
    viewModelPipe.onListen(() {
      _useCase.create();
    });
  }

  @override
  void dispose() {
    viewModelPipe.dispose();
  }
}