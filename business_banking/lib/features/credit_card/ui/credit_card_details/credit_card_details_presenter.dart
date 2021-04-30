import 'package:business_banking/features/credit_card/bloc/credit_card_bloc.dart';
import 'package:business_banking/features/credit_card/model/credit_card_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/cupertino.dart';
import 'credit_card_details_actions.dart';
import 'credit_card_details_screen.dart';

class CreditCardDetailsPresenter extends Presenter<CreditCardBloc, CreditCardViewModel, CreditCardDetailsScreen> {
  @override
  Stream<CreditCardViewModel> getViewModelStream(CreditCardBloc bloc) {
    return bloc.creditCardViewModelPipe.receive;
  }

  @override
  CreditCardDetailsScreen buildScreen(BuildContext context, CreditCardBloc bloc, CreditCardViewModel viewModel) {
    return CreditCardDetailsScreen(
      viewModel: viewModel,
      actions: CreditCardDetailsActions(bloc, viewModel),
    );
  }

}
