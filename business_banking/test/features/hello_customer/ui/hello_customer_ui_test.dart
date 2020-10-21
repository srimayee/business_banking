import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/hello_customer/bloc/hello_customer_bloc.dart';
import 'package:business_banking/features/hello_customer/ui/hello_customer_widget.dart';
import 'package:business_banking/features/hello_customer/ui/hello_customer_presenter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('HelloCustomer, with true bloc', (tester) async {
    final testWidget = MaterialApp(home: HelloCustomerWidget());

    await tester.pumpWidget(testWidget);
    await tester.pump(Duration(milliseconds: 500));

    expect(find.byType(HelloCustomerPresenter), findsOneWidget);
    await tester.tap(find.byType(HelloCustomerPresenter));
  });
}
