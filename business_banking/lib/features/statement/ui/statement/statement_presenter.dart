import 'package:business_banking/features/statement/bloc/statement_bloc.dart';
import 'package:business_banking/features/statement/model/statement/statement_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/cupertino.dart';

import 'statement_screen.dart';

class StatementPresenter
    extends Presenter<StatementBloc, StatementViewModel, StatementScreen> {
  @override
  Stream<StatementViewModel> getViewModelStream(StatementBloc bloc) {
    return bloc.statementViewModelPipe.receive;
  }

  @override
  StatementScreen buildScreen(
      BuildContext context, StatementBloc bloc, StatementViewModel viewModel) {
    return StatementScreen(
      viewModel: viewModel,
      presenterActions: StatementPresenterActions(bloc),
    );
  }
}

class StatementPresenterActions {
  StatementBloc bloc;

  StatementPresenterActions(this.bloc);

  navigateBackToHub(BuildContext context) {
    CFRouterScope.of(context).pop();
  }
}
