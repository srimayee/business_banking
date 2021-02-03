import 'package:business_banking/features/side_cash/side_cash_details/bloc/side_cash_details_bloc.dart';
import 'package:business_banking/features/side_cash/side_cash_details/ui/side_cash_details_presenter.dart';
import 'package:business_banking/features/side_cash/side_cash_details/ui/side_cash_details_screen.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

main() {
  SideCashDetailsPresenter presenter;

  setUpAll(() {
    presenter = SideCashDetailsPresenter();
  });

  test("render SideCashDetailsScreen", () async {
    final result = presenter.buildScreen(null, null, null);
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
