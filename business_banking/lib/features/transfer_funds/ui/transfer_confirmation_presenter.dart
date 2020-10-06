import 'package:business_banking/features/transfer_funds/bloc/transfer_bloc.dart';
import 'package:business_banking/features/transfer_funds/model/transfer_view_model.dart';
import 'package:business_banking/features/transfer_funds/ui/tansfer_screen_widgets/transfer_funds_screen.dart';
import 'package:business_banking/features/transfer_funds/ui/transfer_confirmation_screen.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/src/widgets/framework.dart';

class TransferFundsConfirmationPresenter extends Presenter<TransferFundsBloc, TransferFundsViewModel, TransferConfirmationScreen> {

  @override
  Stream<TransferFundsViewModel> getViewModelStream(TransferFundsBloc bloc) {
    // TODO: implement getViewModelStream
    throw UnimplementedError();
  }

  @override
  TransferConfirmationScreen buildScreen(BuildContext context, TransferFundsBloc bloc, TransferFundsViewModel viewModel) {
    return TransferConfirmationScreen(viewModel);
  }

}