import 'package:business_banking/features/statement/model/statement.dart';
import 'package:business_banking/features/statement/model/statement/statement_entity.dart';
import 'package:business_banking/features/statement/model/statement/statement_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/locator.dart';

import 'statement_service_adapter.dart';

class StatementUseCase extends UseCase {
  late final ViewModelCallback<ViewModel> _viewModelCallBack;
  StatementUseCase(ViewModelCallback<ViewModel> viewModelCallBack)
      : _viewModelCallBack = viewModelCallBack;

  Future<void> create() async {
    final scope = ExampleLocator()
        .repository
        .create<StatementEntity>(StatementEntity(), _notifySubscribers);

    return ExampleLocator()
        .repository
        .runServiceAdapter(scope, StatementServiceAdapter());
  }

  void _notifySubscribers(entity) {
    _viewModelCallBack(buildViewModel(entity));
  }

  StatementViewModel buildViewModel(
    StatementEntity statementEntity,
  ) {
    return StatementViewModel(statements: statementEntity.statements);
  }

  getStatementForAccount(List<Statement> statement, {String? accountNumber}) {
    if (accountNumber != null) {
      return statement.firstWhere(
          (statement) => statement.accountInfo.accountNumber == accountNumber);
    }
  }
}
