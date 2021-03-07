import 'package:business_banking/features/investment/bloc/investment_bloc.dart';
import 'package:business_banking/features/investment/ui/investment_feature.dart';
import 'package:business_banking/features/investment/ui/investment_presenter.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../bloc/investment_bloc_mock.dart';

void main() {
  testWidgets('description', (tester) async {
    final testWidget = MaterialApp(
      home: BlocProvider<InvestmentBlockMock>(
        create: (_) => InvestmentBlockMock(),
        child: InvestmentFeatureWidget(),
      ),
    );

    await tester.pumpWidget(testWidget);
    await tester.pump(Duration(milliseconds: 500));

    expect(find.byType(InvestmentPresenter), findsOneWidget);
  });
}
