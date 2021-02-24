import 'package:business_banking/features/customer/bloc/customer_bloc.dart';
import 'package:business_banking/features/customer/ui/customer_presenter.dart';
import 'package:business_banking/features/customer/ui/customer_widget.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CustomerWidget, with true bloc', (tester) async {
    final testWidget = MaterialApp(
        home: BlocProvider<CustomerBloc>(
      child: CustomerWidget(),
      create: (_) => CustomerBloc(),
    ));

    await tester.pumpWidget(testWidget);
    await tester.pump(Duration(milliseconds: 500));

    expect(find.byType(CustomerPresenter), findsOneWidget);

    await tester.tap(find.byType(CustomerPresenter));
  });
}
