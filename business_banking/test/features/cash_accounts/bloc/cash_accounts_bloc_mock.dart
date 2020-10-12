import 'package:business_banking/features/cash_accounts/api/cash_accounts_service.dart';
import 'package:business_banking/features/cash_accounts/model/cash_accounts_list_view_model.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/cash_accounts/bloc/cash_accounts_bloc.dart';
import 'package:mockito/mockito.dart';

import 'cash_accounts_use_case_test.dart';

/// This test class will mock the Cash Accounts BLoc to then be
/// validated against the actual Cash Accounts BLoc
class CashAccountsBlocMock extends Fake implements CashAccountsBloc {
  final bool debugEnabled = false;

  /// Create View Model API pipe
  final Pipe<CashAccountsViewModelList> cashAccountsViewModelListPipe =
      Pipe<CashAccountsViewModelList>();

  /// Get The View Model List
  CashAccountsViewModelList cashAccountsViewModelList =
      CashAccountsViewModelList();

  /// Set up Use Case to
  CashAccountsUseCaseMock _useCase;

  /// Mock Cash Accounts Bloc Object Constructor
  CashAccountsBlocMock({CashAccountsService cashAccountsService}) {
    cashAccountsViewModelListPipe.onListen(() => _useCase.create());
    _useCase = CashAccountsUseCaseMock(
        (viewModel) => cashAccountsViewModelListPipe.send(viewModel));

    /// Debug Logging
    if (debugEnabled) {
      logger().debug('Cash Accounts Mock Bloc: ' + _useCase.toString());
    }
  }

  @override
  void dispose() {
    /// Dispose pipe in Life Cycle Dispose.
    cashAccountsViewModelListPipe.dispose();
  }
}
