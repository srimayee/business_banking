import 'package:business_banking/features/transfer_funds/bloc/transfer_usecase.dart';
import 'package:business_banking/features/transfer_funds/model/transfer_view_model.dart';
import 'package:clean_framework/clean_framework.dart';

class TransferFundsBloc extends Bloc {
  TransferFundsUseCase _useCase;

  final transferFundsViewModelPipe = Pipe<TransferFundsViewModel>();
  final fromAccountPipe = Pipe<String>();
  final toAccountPipe = Pipe<String>();
  final amountPipe = Pipe<String>();
  final datePipe = Pipe<DateTime>();
  // final submitPipe = EventPipe();

  TransferFundsBloc() {
    _useCase = TransferFundsUseCase(
            (viewModel) => transferFundsViewModelPipe.send(viewModel));
    transferFundsViewModelPipe.onListen(() => _useCase.create());
    fromAccountPipe.receive.listen(fromAccountInputHandler);
    toAccountPipe.receive.listen(toAccountInputHandler);
    amountPipe.receive.listen(amountPipeHandler);
    datePipe.receive.listen(dateHandler);
    // submitPipe.listen(submitHandler);
  }

  void fromAccountInputHandler(String fromAccount) {
    _useCase.updateFromAccount(fromAccount);
  }

  void toAccountInputHandler(String toAccount) {
    _useCase.updateToAccount(toAccount);
  }

  void amountPipeHandler(String amount) {
    _useCase.updateAmount(amount);
  }

  void dateHandler(DateTime date) {
    _useCase.updateDate(date);
  }

  // void submitHandler() {
  //   _useCase.submitTransfer();
  // }

  @override
  void dispose() {
    transferFundsViewModelPipe.dispose();
    fromAccountPipe.dispose();
    toAccountPipe.dispose();
    amountPipe.dispose();
    datePipe.dispose();
    // submitPipe.dispose();
  }
}