import 'package:business_banking/features/card_usage/bloc/card_summary_bloc.dart';
import 'package:business_banking/features/card_usage/ui/card_summary_presenter.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockBuildContext extends Mock implements BuildContext {}

void main() {
  MaterialApp? testWidget;
  setUp(() {
    testWidget = MaterialApp(
      home: BlocProvider<CardSummaryBloc>(
        create: (_) => CardSummaryBloc(),
        child: CardSummaryPresenter(),
      ),
    );
  });

    tearDown(() {
      testWidget = null;
    });
    group('Successfully presents Card Summary', () {
      testWidgets('should show the presenter', (tester) async {
        await tester.pumpWidget(testWidget!);
        await tester.pump(Duration(milliseconds: 500));
        final widgetType = find.byType(CardSummaryPresenter);
        expect(widgetType, findsOneWidget);
      });
    });
}
