import 'package:business_banking/features/side_cash/side_cash_details/bloc/side_cash_details_bloc.dart';
import 'package:business_banking/features/side_cash/side_cash_details/models/side_cash_details_view_model.dart';
import 'package:business_banking/features/side_cash/side_cash_details/ui/side_cash_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  SideCashDetailsBloc sideCashDetailsBloc;
  setUp(() {
    sideCashDetailsBloc = SideCashDetailsBloc();
  });
  group('SideCashDetails Feature Widget', () {
    testWidgets('Build When Available', (tester) async {
      await tester.pumpWidget(Material(child: SideCashDetailsWidget()));
      sideCashDetailsBloc.viewModelPipe.send(SideCashDetailsViewModel());
      await tester.pumpAndSettle(Duration(milliseconds: 100));

      // expect(find.text(billPayStrings.billPayHeader), findsOneWidget);
      // expect(find.text(billPayStrings.payBills), findsOneWidget);
      // expect(find.text(billPayStrings.managePayees), findsOneWidget);
      // expect(find.text(billPayStrings.scheduledPayments), findsOneWidget);
    });
  });
}
