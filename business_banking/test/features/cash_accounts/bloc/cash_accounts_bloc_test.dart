import 'package:business_banking/example_locator.dart';
import 'package:business_banking/features/cash_accounts/bloc/cash_accounts_bloc.dart';
import 'package:business_banking/features/cash_accounts/model/cash_accounts_view_model.dart';
import 'package:business_banking/features/cash_accounts/bloc/cash_accounts_service_adapter.dart';
import 'package:business_banking/features/cash_accounts/model/cash_accounts_entity.dart';
import 'package:business_banking/features/cash_accounts/api/cash_accounts_service_response_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('CashAccountsBloc gets view model', () {
    final bloc = CashAccountsBloc();

    bloc.helloLandingViewModelPipe.receive.listen(expectAsync1((model) {
      expect(model, isA<CashAccountsViewModel>());
    }));
  });
  
  test('Entity is created by service adapter', () {
    final entity = CashAccountsServiceAdapter().createEntity(
        CashAccountsEntity(),
        CashAccountsServiceResponseModel.fromJson({}));

    expect(entity,
        CashAccountsEntity());
  });
}