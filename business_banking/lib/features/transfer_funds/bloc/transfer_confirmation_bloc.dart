import 'package:business_banking/features/transfer_funds/bloc/transfer_confirmation_usecase.dart';
import 'package:business_banking/features/transfer_funds/model/transfer_confirmation_view_model.dart';
import 'package:clean_framework/clean_framework.dart';

class TransferConfirmationBloc extends Bloc {
  TransferConfirmationUseCase _useCase;

  final viewModelPipe = Pipe<TransferConfirmationViewModel>();
  // final submitPipe = EventPipe();

  TransferConfirmationBloc() {
    print('Creating TransferConfirmationBloc');
    _useCase = TransferConfirmationUseCase((viewModel) => viewModelPipe.send(viewModel));
    viewModelPipe.onListen(() {
      print('viewModelPipe.onListen called');
      _useCase.create();
    });
    // submitPipe.listen(submitHandler);
  }

  // void submitHandler() {
  //   _useCase.submitTransfer();
  // }

  @override
  void dispose() {
    viewModelPipe.dispose();
    // submitPipe.dispose();
  }
}