import 'package:business_banking/features/cash_accounts/bloc/cash_accounts_bloc.dart';
import 'package:business_banking/features/cash_accounts/model/cash_accounts_list_view_model.dart';
import 'package:business_banking/locator.dart';
import 'cash_accounts_bloc_mock.dart';
import 'package:flutter_test/flutter_test.dart';

/// Compare manually create Bloc object to actual Bloc object and
/// child types and values.
void main() {
  final bool debugEnabled = false;

  /// Test Title
  test('Cash Accounts Get View Model, Mock', () {
    /// Create instance of the Mock Bloc Class
    final bloc = CashAccountsBlocMock();

    bloc.cashAccountsViewModelListPipe.receive.listen(expectAsync1((model) {
      /// Check the View Model Object Type
      expect(model, isA<CashAccountsViewModelList>());

      /// Check the View Model Data Values from the initialization of
      /// the object.
      checkViewModelListObjectValues(model);
    }));
  }, timeout: Timeout(Duration(seconds: 3)));

  /// Test the Actual BLoc Class
  test('Cash Accounts Get View Model, Actual', () {
    /// Create instance of the Actual Bloc Class
    final bloc = CashAccountsBloc();

    /// Create the Pipe Listener
    bloc.cashAccountsViewModelListPipe.receive.listen(expectAsync1((viewModel) {
      /// Debug print of the view model
      if (debugEnabled) {
        logger().debug('Cash Accounts BLoc View Model Received: ' +
            viewModel.cashAccountEntityModel.toString());
      }

      /// Check the View Model Object Type
      expect(viewModel, isA<CashAccountsViewModelList>());

      /// Check the View Model Data Correct Values
      checkViewModelListObjectValues(viewModel);
    }));
  }, timeout: Timeout(Duration(seconds: 3)));
}


void checkViewModelListObjectValues(model) {
  /// Object 1 in the List and Associated Values
  expect(model.cashAccountEntityModel[0].accountTitle.toString(),
      "Checking Account");
  expect(model.cashAccountEntityModel[0].accountNumber.toString(), "6542");
  expect(model.cashAccountEntityModel[0].accountBalance, 3545.54);
  expect(model.cashAccountEntityModel[0].accountStatus.toString(), "Active");

  /// Object 2 in the List and Associated Values
  expect(model.cashAccountEntityModel[1].accountTitle.toString(),
      "Savings Account");
  expect(model.cashAccountEntityModel[1].accountNumber.toString(), "6543");
  expect(model.cashAccountEntityModel[1].accountBalance, 0.02);
  expect(model.cashAccountEntityModel[1].accountStatus.toString(), "Active");
}
