import 'package:business_banking/features/investment_detail/ui/investment_detail_feature_widget.dart';
import 'package:business_banking/features/investment_detail/ui/investment_detail_presenter.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../bloc/investment_detail_bloc_mock.dart';

void main() {
  MaterialApp testWidget;

  setUp(() {
    testWidget = MaterialApp(
      home: BlocProvider<InvestmentDetailBlockMock>(
        create: (_) => InvestmentDetailBlockMock(),
        child: InvestmentDetailWidget(),
      ),
    );
  });

  testWidgets('description', (tester) async {
    // pumpWidget calls runApp, and also triggers a frame to paint the app.
    await tester.pumpWidget(testWidget);
    //pump trigger a rebuild since the data-loading process will happen post-runApp.
    await tester.pump(Duration(milliseconds: 500));

    final widgetType = find.byType(InvestmentDetailPresenter);
    expect(widgetType, findsOneWidget);
  });
}
