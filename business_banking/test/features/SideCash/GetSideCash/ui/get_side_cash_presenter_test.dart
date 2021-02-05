import 'dart:math';

import 'package:business_banking/features/side_cash/get_side_cash/model/get_side_cash_view_model.dart';
import 'package:business_banking/features/side_cash/get_side_cash/ui/get_side_cash_presenter.dart';
import 'package:business_banking/features/side_cash/get_side_cash/ui/get_side_cash_screen.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../SideCashDetails/mock_dummy_functions.dart';
import '../../SideCashDetails/side_cash_details_mocks.dart';
import '../models/get_side_cash_view_model_test.dart';

main() {
  GetSideCashPresenter presenter;
  MockGetSideCashBloc bloc;
  MockBuildContext context;

  setUpAll(() {
    presenter = GetSideCashPresenter();
    bloc = MockGetSideCashBloc();
    context = MockBuildContext();
  });

  _getApp(Widget widget) {
    return MaterialApp(
      // navigatorKey: navigatorKey,
      home: Builder(
        builder: (context) => BlocProvider<MockGetSideCashBloc>(
            create: (context) => MockGetSideCashBloc(), child: widget),
      ),
    );
  }

  test('BuildScreen returns a GetSideCashScreen ', () {
    final result = presenter.buildScreen(
        MockBuildContext(), bloc, MockGetSideCashViewModel());
    expect(result, isA<GetSideCashViewModel>());
  });
  testWidgets(
      'Screen returns a showDialog when present success method is called ',
      (tester) async {
    final materialApp = MaterialApp(
        home: Scaffold(body: await presenter.presentSuccess(context, bloc)));
    tester.pumpWidget(materialApp);
    tester.pumpAndSettle();
    expect(find.byKey(Key('SideCashDetailsSuccessMessage')), findsOneWidget);
  });

  test("resetViewModel method ", () {
    final isReset = presenter.resetViewModel(bloc);
    expect(isReset, true);
  });

  test("requestSideCash method ", () {
    final requestMade = presenter.requestSideCash('123', bloc);
    expect(requestMade, true);
  });
  test("onControllerChanged method ", () {
    final controllerUpdated = presenter.onControllerChanged('123', bloc);
    expect(controllerUpdated, true);
  });
}
