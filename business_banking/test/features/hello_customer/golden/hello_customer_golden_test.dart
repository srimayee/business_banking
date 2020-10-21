import 'package:business_banking/features/hello_customer/bloc/hello_customer_bloc.dart';
import 'package:business_banking/features/hello_customer/ui/hello_customer_presenter.dart';
import 'package:business_banking/features/hello_customer/ui/hello_customer_widget.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('HelloCustomer Golden test', (tester) async {
    final testWidget = MaterialApp(
        home: BlocProvider<HelloCustomerBloc>(
            create: (_) => HelloCustomerBloc(), child: HelloCustomerWidget()));

    await tester.pumpWidget(testWidget);
    await tester.pump(Duration(milliseconds: 500));
    await expectLater(find.byType(HelloCustomerPresenter), matchesGoldenFile('main.png'));
  });
}