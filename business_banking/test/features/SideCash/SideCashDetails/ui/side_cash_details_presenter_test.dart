import 'package:business_banking/features/side_cash/side_cash_details/bloc/side_cash_details_bloc.dart';
import 'package:business_banking/features/side_cash/side_cash_details/models/side_cash_details_view_model.dart';
import 'package:business_banking/features/side_cash/side_cash_details/ui/side_cash_details_presenter.dart';
import 'package:business_banking/features/side_cash/side_cash_details/ui/side_cash_details_screen.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../side_cash_details_mocks.dart';

class MockSideCashDetialsPresenter extends Mock
    implements SideCashDetailsPresenter {
  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.debug}) {
    super.toString();
  }
}

main() {
  MockSideCashDetialsPresenter presenter;
  SideCashDetailsBloc bloc;

  setUpAll(() {
    presenter = MockSideCashDetialsPresenter();
    bloc = SideCashDetailsBloc();
  });

  test("render SideCashDetailsScreen", () {
    final SideCashDetailsScreen result = presenter.buildScreen(
        MockBuildContext(),
        bloc,
        SideCashDetailsViewModel(
          detailsOpen: false,
          grossSideCashBalance: '12.34',
          interest: '12.34',
          paymentMin: '12',
          remainingCredit: '12',
        ));
    print(result);
    expect(result, isA<SideCashDetailsScreen>());
  });

  testWidgets('call toggleDetails method', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<SideCashDetailsBloc>(
          create: (context) => SideCashDetailsBloc(),
          child: presenter,
        ),
      ),
    );
    presenter.toggleDetails(true, SideCashDetailsBloc());
    verify(presenter.toggleDetails).called(1);
  });
}
