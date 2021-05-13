// @dart=2.9
import 'package:business_banking/features/bill_pay/bloc/first_card/bill_pay_card_event.dart';
import 'package:business_banking/features/bill_pay/model/first_card/bill_pay_card_view_model.dart';
import 'package:business_banking/features/bill_pay/model/bill.dart';
import 'package:business_banking/features/deposit_check/model/enums.dart';
import 'package:business_banking/features/bill_pay/ui/first_card/bill_pay_card_presenter.dart';
import 'package:business_banking/features/bill_pay/ui/first_card/bill_pay_card_widget.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../bloc/bill_pay_bloc_mock.dart';

class MockPresenterActions extends Mock
    implements BillPayCardPresenterActions {
  BillPayBlocMock blocMock;
  BillPayCardViewModel viewModel;
  MockPresenterActions(this.blocMock, this.viewModel);

  @override
  navigateToBillPay(BuildContext context) {
    //would normally navigate
  }
}

class MockBuildContext extends Mock implements BuildContext {}

void main() {
  MockBuildContext mockBuildContext;
  BillPayCardViewModel billPayViewModelSucceed;
  MockPresenterActions mockPresenterActions;
  BillPayCardPresenterActions billPayCardPresenterActions;
  BillPayBlocMock mockBloc;
  MaterialApp testWidget;

  setUp(() {
    mockBuildContext = MockBuildContext();

    mockBloc = BillPayBlocMock();

    billPayViewModelSucceed = BillPayCardViewModel(
        billsDue: 4,
        serviceResponseStatus: ServiceResponseStatus.succeed);

    mockPresenterActions =
         MockPresenterActions(mockBloc, billPayViewModelSucceed);
    billPayCardPresenterActions = BillPayCardPresenterActions(
        mockBloc, billPayViewModelSucceed);

    testWidget = MaterialApp(
      home: BlocProvider<BillPayBlocMock>(
        create: (_) => BillPayBlocMock(),
        child: BillPayCardWidget(),
      ),
    );
  });

  group('Bill Pay Card', () {
    testWidgets('should show the presenter', (tester) async {
      await tester.pumpWidget(testWidget);
      await tester.pump(Duration(milliseconds: 500));

      final widgetType = find.byType(BillPayCardPresenter);
      expect(widgetType, findsOneWidget);
    });

    test(
        'presenterActions should be run for more coverage',
            () async {
          billPayCardPresenterActions.navigateToBillPay(mockBuildContext);
          //done!
        });
  });
}
