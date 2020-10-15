import 'package:business_banking/features/transfer_funds/bloc/transfer_confirmation_usecase.dart';
import 'package:business_banking/features/transfer_funds/bloc/transfer_usecase.dart';
import 'package:business_banking/features/transfer_funds/model/transfer_confirmation_view_model.dart';
import 'package:business_banking/features/transfer_funds/model/transfer_view_model.dart';
import 'package:clean_framework/clean_framework.dart';

class TransferFundsBloc extends Bloc {
  TransferFundsUseCase _fundsUseCase;
  TransferConfirmationUseCase _confirmationUseCase;

  final transferFundsViewModelPipe = Pipe<TransferFundsViewModel>();
  final fromAccountPipe = Pipe<String>();
  final toAccountPipe = Pipe<String>();
  final amountPipe = Pipe<double>();
  final datePipe = Pipe<DateTime>();
  final submitPipe = EventPipe();
  final resetServiceStatusPipe = EventPipe();
  final confirmationViewModelPipe = Pipe<TransferConfirmationViewModel>();
  final resetViewModelPipe = EventPipe();

  TransferFundsBloc() {
    _fundsUseCase = TransferFundsUseCase(
            (viewModel) => transferFundsViewModelPipe.send(viewModel));
    transferFundsViewModelPipe.onListen(() {
      _fundsUseCase.create();
    });

    _confirmationUseCase = TransferConfirmationUseCase((viewModel) => confirmationViewModelPipe.send(viewModel));
    confirmationViewModelPipe.onListen(() {
      _confirmationUseCase.create();
    });

    fromAccountPipe.receive.listen(fromAccountInputHandler);
    toAccountPipe.receive.listen(toAccountInputHandler);
    amountPipe.receive.listen(amountPipeHandler);
    datePipe.receive.listen(dateHandler);
    resetServiceStatusPipe.listen(() => _fundsUseCase.resetServiceStatus());
    submitPipe.listen(() => _fundsUseCase.submitTransfer());
    resetViewModelPipe.listen(() => _confirmationUseCase.clearTransferData());
  }

  void fromAccountInputHandler(String fromAccount) {
    _fundsUseCase.updateFromAccount(fromAccount);
  }

  void toAccountInputHandler(String toAccount) {
    _fundsUseCase.updateToAccount(toAccount);
  }

  void amountPipeHandler(double amount) {
    _fundsUseCase.updateAmount(amount);
  }

  void dateHandler(DateTime date) {
    _fundsUseCase.updateDate(date);
  }

  @override
  void dispose() {
    transferFundsViewModelPipe.dispose();
    fromAccountPipe.dispose();
    toAccountPipe.dispose();
    amountPipe.dispose();
    datePipe.dispose();
    submitPipe.dispose();
    resetServiceStatusPipe.dispose();
    confirmationViewModelPipe.dispose();
    resetViewModelPipe.dispose();
  }
}