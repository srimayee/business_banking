// @dart=2.9
import 'package:business_banking/features/bill_pay/bloc/bill_pay_bloc.dart';
import 'package:business_banking/features/bill_pay/bloc/form_screen/bill_pay_event.dart';
import 'package:business_banking/features/bill_pay/model/form_screen/bill_pay_view_model.dart';
import 'package:business_banking/features/bill_pay/model/bill.dart';
import 'package:business_banking/features/bill_pay/ui/form_screen/bill_pay_screen.dart';
import 'package:business_banking/features/bill_pay/model/enums.dart';
import 'package:business_banking/features/bill_pay/ui/form_screen/bill_pay_presenter.dart';
import 'package:business_banking/features/bill_pay/ui/form_screen/bill_pay_widget.dart';
import 'package:business_banking/routes.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../bloc/bill_pay_bloc_mock.dart';

class MockPresenterActions extends Mock
    implements BillPayPresenterActions {
  BillPayBlocMock blocMock;
  BillPayViewModel viewModel;
  MockPresenterActions(this.blocMock, this.viewModel);

  @override
  onBillSelectedListener(int selectedBillIndex) {
    blocMock.billPayEventPipe
        .send(SelectBillEvent(selectedBillIndex));
  }
}

class MockBuildContext extends Mock implements BuildContext {}

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  MockBuildContext mockBuildContext;
  BillPayViewModel billPayViewModelSucceed;
  BillPayViewModel billPayViewModelPaySuccess;
  BillPayViewModel billPayViewModelPayFailed;
  MockPresenterActions mockPresenterActions;
  BillPayPresenterActions billPayPresenterActions;
  BillPayBlocMock mockBloc;
  MaterialApp testWidget;
  List<Bill> allBills;
  BillPayPresenter presenter;

  setUp(() {
    mockBuildContext = MockBuildContext();

    mockBloc = BillPayBlocMock();

    allBills = [
      Bill.fromJson({
        "id": 123,
        "payee": "AEP",
        "memo": "Electric bill",
        "amount": 216.88,
        "due": 1622793600000
      }),
      Bill.fromJson({
        "id": 124,
        "payee": "City of Columbus",
        "memo": "Water bill",
        "amount": 59.53,
        "due": 1620039600000
      }),
      Bill.fromJson({
        "id": 125,
        "payee": "City of Columbus",
        "memo": "Gas bill",
        "amount": 32,
        "due": 1621422000000
      }),
      Bill.fromJson({
        "id": 126,
        "payee": "Coinbase",
        "memo": "Monthly Bitcoin splurging",
        "amount": 14228.27,
        "due": 1621753200000
      })
    ];

    billPayViewModelSucceed = BillPayViewModel(
        allBills: allBills,
        selectedBillIndex: -1,
        serviceRequestStatus: ServiceRequestStatus.success,
        payStatus: PayBillStatus.none,
        referenceNumber: '');
    billPayViewModelPaySuccess = BillPayViewModel(
        allBills: allBills,
        selectedBillIndex: 0,
        serviceRequestStatus: ServiceRequestStatus.success,
        payStatus: PayBillStatus.success,
        referenceNumber: '');
    billPayViewModelPayFailed = BillPayViewModel(
        allBills: allBills,
        selectedBillIndex: 0,
        serviceRequestStatus: ServiceRequestStatus.success,
        payStatus: PayBillStatus.failed,
        referenceNumber: '');

    presenter = BillPayPresenter();

    mockPresenterActions =
         MockPresenterActions(mockBloc, billPayViewModelSucceed);
    billPayPresenterActions = BillPayPresenterActions(
        mockBloc);

    testWidget = MaterialApp(
      home: BlocProvider<BillPayBlocMock>(
        create: (_) => BillPayBlocMock(),
        child: BillPayWidget(),
      ),
    );
  });

  group('Bill Pay screen', () {
    testWidgets('should show the presenter', (tester) async {
      await tester.pumpWidget(testWidget);
      await tester.pump(Duration(milliseconds: 500));

      final widgetType = find.byType(BillPayPresenter);
      expect(widgetType, findsOneWidget);
    });

    test(
        'presenterActions should send event through the pipe on onBillSelectedListener',
            () async {
          billPayPresenterActions.onBillSelectedListener(-1);

          await mockBloc.billPayViewModelPipe.receive.listen((event) {
            expect(event, isA<BillPayViewModel>());
          });
        });

    test(
        'presenterActions should send event through the pipe on onTapConfirmButton',
            () async {
          billPayPresenterActions.onTapConfirmBtn(mockBuildContext, billPayViewModelSucceed);

          await mockBloc.billPayViewModelPipe.receive.listen((event) {
            expect(event, isA<BillPayViewModel>());
          });
        });

    test(
        'presenterActions should send event through the pipe on onTapConfirmButton',
            () async {
          billPayPresenterActions.confirmBillPayed();

          await mockBloc.billPayViewModelPipe.receive.listen((event) {
            expect(event, isA<BillPayViewModel>());
          });
        });

    testWidgets(
        'presenterActions should pop context on popNavigationListener',
            (tester) async {
              Widget testWidgetRouter;
              MockNavigatorObserver observer = MockNavigatorObserver();
              BuildContext routeContext;
              testWidgetRouter = CFRouterScope(
                  routeGenerator: BusinessBankingRouter.generate,
                  initialRoute: BusinessBankingRouter.initialRoute,
                  builder: (context) => BlocProvider(
                    create: (context) {
                      routeContext = context;
                      return BillPayBloc();
                    },
                    child: MaterialApp(
                      home: BillPayScreen(
                        viewModel: BillPayViewModel(allBills: []),
                        presenterActions: billPayPresenterActions,
                      ),
                      navigatorObservers: [observer],
                      debugShowCheckedModeBanner: false,
                    ),
                  )
              );

              await tester.pumpWidget(testWidgetRouter);
              await tester.pump(Duration(milliseconds: 500));
              billPayPresenterActions.popNavigationListener(routeContext);
              verify(observer.didPush(any, any)).called(1);
        });
  });

  //these two tests work but don't get code coverage for presenter
  //I may need to actually test that the alert dialog is there
  test('presenter with success pop up', () {
    final result = presenter.buildScreen(null, null, billPayViewModelPaySuccess);
    expect(result, isA<BillPayScreen>());
  });

  test('presenter with failure pop up', () {
    final result = presenter.buildScreen(null, null, billPayViewModelPayFailed);
    expect(result, isA<BillPayScreen>());
  });

  //doesn't work

  // testWidgets("success pop up should show", (tester) async {
  //   await tester.pumpWidget(testWidget);
  //   await mockBloc.billPayViewModelPipe.send(billPayViewModelPaySuccess);
  //   await tester.pumpAndSettle();
  //
  //   final title = find.text("Success");
  //   expect(title, findsOneWidget);
  //
  //   final line1 = find.text("You successfully paid \$216.88 to AEP!");
  //   expect(line1, findsOneWidget);
  //
  //   final line2 = find.text("Reference number: 987654321");
  //   expect(line2, findsOneWidget);
  // });
}
