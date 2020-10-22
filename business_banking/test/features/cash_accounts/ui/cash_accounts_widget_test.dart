import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

import '../bloc/cash_accounts_bloc_mock.dart';
import 'cash_accounts_presenter_test.dart';

class CashAccountsWidgetTest extends StatelessWidget {
  final bool debugEnabled = false;

  @override
  Widget build(BuildContext context) {
    if (debugEnabled) {
      logger().debug('Test Widget Built');
    }

    return BlocProvider<CashAccountsBlocMock>(
      create: (_) => CashAccountsBlocMock(),
      child: CashAccountsPresenterTest(),
    );
  }
}
