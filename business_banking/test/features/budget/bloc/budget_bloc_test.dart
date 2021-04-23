// @dart=2.9

import 'package:business_banking/features/budget/bloc/budget_bloc.dart';
import 'package:business_banking/features/budget/bloc/budget_usecase.dart';
import 'package:business_banking/features/budget/model/account_info.dart';
import 'package:business_banking/features/budget/model/budget_view_model.dart';
import 'package:business_banking/features/budget/model/posted_transactions.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  BudgetBloc bloc;
  final viewModel = BudgetViewModel(
      accountInfo: AccountInfo(
        '1234567890',
        1.00,
        'Account Nickname',
      ),
      allTransactions: [
        PostedTransactions(
          '2021-04-04T19:00:03Z',
          'SUNRISE MINI MART',
          2.00,
          'Wholesale Clubs',
          'xxxx-xxxx-xxxx-6917',
        )
      ],
      chartData: [],
      serviceStatus: TransactionsServiceStatus.success);

  setUp(() {
    bloc = BudgetBloc();
    bloc.useCase = BudgetUsecase((viewModel) =>
        bloc.budgetViewModelPipe.send(viewModel as BudgetViewModel));
    bloc.budgetViewModelPipe
        .whenListenedDo(() => bloc.budgetViewModelPipe.send(viewModel));
  });

  tearDown(() {
    bloc.dispose();
  });

  test(
      'block sends the BudgetViewModel to subscribed presenters when listened.',
      () {
    bloc.budgetViewModelPipe.receive.listen(expectAsync1((model) {
      expect(model, isA<BudgetViewModel>());
      expect(model.accountInfo, isA<AccountInfo>());
      expect(model.allTransactions, isA<List<PostedTransactions>>());
    }));
  });
}
