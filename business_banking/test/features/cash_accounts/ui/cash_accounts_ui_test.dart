import 'package:business_banking/features/cash_accounts/api/cash_accounts_service_response_model.dart';
import 'package:business_banking/features/cash_accounts/bloc/cash_accounts_service_adapter.dart';
import 'package:business_banking/features/cash_accounts/model/cash_accounts_entity.dart';
import 'package:business_banking/features/cash_accounts/model/cash_accounts_list_entity.dart';
import 'package:business_banking/features/cash_accounts/model/cash_accounts_list_view_model.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/cash_accounts/bloc/cash_accounts_bloc.dart';
import 'package:business_banking/features/cash_accounts/ui/cash_accounts_widget.dart';
import 'package:business_banking/features/cash_accounts/ui/cash_accounts_presenter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../bloc/cash_accounts_bloc_mock.dart';
import '../bloc/cash_accounts_use_case_test.dart';

/// Test the Cash Accounts Widget Rendering and Values
void main() {
  final bool debugEnabled = true;

  /// Create Bloc Mock
  final bloc = CashAccountsBlocMock();

  /// Create Use Case
  CashAccountsUseCaseMock _useCase;

  /// Test Title
  testWidgets('CashAccounts with True BLoc Mock', (tester) async {
    /// Create Cash Account Entity Model List
    List<CashAccountsEntityModel> cashAccountsEntityModelListManuallyCreated =
        [];

    /// Create Cash Accounts Entity List
    CashAccountsEntityModelList cashAccountsEntityModelListCreated =
        CashAccountsEntityModelList(
            errors: [],
            cashAccountsServiceResponseModelList:
                cashAccountsEntityModelListManuallyCreated);

    /// Use Service Adapter to Assign Entity List to Entity
    /// List Object through Merge method
    final cashAccountsModelListEntityCreated = CashAccountsServiceAdapter()
        .createEntity(
            cashAccountsEntityModelListCreated,
            CashAccountsServiceResponseModel.fromJson(
                createMockJSONResponse()));

    if (debugEnabled) {
      logger().debug(
          'UI Test Mock JSON Response: ' + createMockJSONResponse().toString());
      logger().debug('Cash Accounts Entity List Created: ' +
          cashAccountsModelListEntityCreated.cashAccountsEntityModelList
              .toString());
    }

    /// Setup View Model List Pipe Listener
    createViewModelListener(bloc,debugEnabled);

    /// Set up Use Case to
    _useCase = CashAccountsUseCaseMock((viewModel) => bloc.cashAccountsViewModelListPipe.send(viewModel));

    /// Create Bloc and UI
    final testWidget = MaterialApp(
        home: BlocProvider<CashAccountsBloc>(
            create: (_) => CashAccountsBlocMock(),
            child: CashAccountsWidget()));

    /// Load the Widget UI Components
    await tester.pumpWidget(testWidget);

    if (debugEnabled) {
      logger().debug('PumpWidget Started');
    }

    /// Allow Build Time for the UI Rendering
    await tester.pump(Duration(milliseconds: 500));

    if (debugEnabled) {
      logger().debug('PumpWidget Started started 500:');
    }

    /// Assert Expect Against UI Rendering
    expect(find.byType(CashAccountsPresenter), findsOneWidget);

    /// Check For Nulls
    checkForTextNulls(debugEnabled);
  }, timeout: Timeout(Duration(seconds: 3)));
}

/// Null Value Checks
void checkForTextNulls(bool debugEnabled) {
  if (debugEnabled) {
    logger().debug('checkForTextNulls');
  }

  expect(find.text('Checking Account'), findsNothing);
  expect(find.text('null'), findsNothing);
  expect(find.text('NULL'), findsNothing);
}

/// Create Mock JSON Response
Map<String, dynamic> createMockJSONResponse() {
  return {
    "accounts": [
      {
        "accountTitle": "Checking Account",
        "accountNumber": "6542",
        "accountBalance": 3545.54,
        "accountStatus": "Active"
      },
      {
        "accountTitle": "Savings Account",
        "accountNumber": "6543",
        "accountBalance": 0.02,
        "accountStatus": "Active"
      }
    ]
  };
}


void createViewModelListener(CashAccountsBlocMock bloc, bool debugEnabled){
  /// Setup View Model List Pipe Listener
  bloc.cashAccountsViewModelListPipe.receive.listen(expectAsync1((model) {
    if (debugEnabled) {
      logger().debug('Received Pipe View Model: ' +
          model.cashAccountEntityModel.toString());
    }

    /// Check the View Model Object Type
    expect(model, isA<CashAccountsViewModelList>());
  }));
}