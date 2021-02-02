import 'package:business_banking/features/side_cash/get_side_cash/BLoC/get_side_cash_bloc.dart';
import 'package:business_banking/features/side_cash/get_side_cash/model/get_side_cash_view_model.dart';
import 'package:business_banking/features/side_cash/get_side_cash/ui/get_side_cash_screen.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/src/widgets/framework.dart';

class GetSideCashPresenter extends Presenter<GetSideCashBloc,
    GetSideCashViewModel, GetSideCashScreen> {
  @override
  buildScreen(BuildContext context, GetSideCashBloc bloc,
      GetSideCashViewModel viewModel) {
    return GetSideCashScreen(
      requestSideCash: (String amt) {
        _requestSideCash(amt, bloc);
      },
      onControllerChanged: (String amount) {
        _onControllerChanged(amount, bloc);
      },
      viewModel: viewModel,
      inputController: bloc.inputController,
    );
  }

  @override
  Stream<GetSideCashViewModel> getViewModelStream(GetSideCashBloc bloc) {
    return bloc.viewModelPipe.receive;
  }

  _requestSideCash(String amt, GetSideCashBloc bloc) {
    bool isValid = bloc.validateInput(amt);
    if (isValid) {
      bloc.requestValue.launch();
    }
  }

  _onControllerChanged(String amount, GetSideCashBloc bloc) {
    bloc.validateInput(amount);
  }
}
