import 'package:business_banking/features/billpay/api/billpay_service.dart';
import 'package:business_banking/features/billpay/bloc/billpay_bloc.dart';
import 'package:business_banking/features/billpay/ui/bill_screen.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Bill pay widget Test', (tester) async {
    final testWidget = MaterialApp(
        home: BlocProvider<BillPayBloc>(
            create: (_) => BillPayBloc(), child: BillScreen()));

    await tester.pumpWidget(testWidget);
    var appBar = find.byKey(Key('CBillPayAppBarTitle'));
    expect(appBar, findsOneWidget);
  });
}
