import 'package:business_banking/features/hello_customer_detail/bloc/hello_customer_detail_bloc.dart';
import 'package:business_banking/features/hello_customer_detail/ui/hello_customer_detail_presenter.dart';
import 'package:business_banking/features/hello_customer_detail/ui/hello_customer_detail_widget.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('HelloCustomerDetail, with true bloc', (tester) async {
    final testWidget = MaterialApp(home: HelloCustomerDetailWidget());
    await tester.pumpWidget(testWidget);
    await tester.pump(Duration(milliseconds: 500));

    expect(find.byType(HelloCustomerDetailPresenter), findsOneWidget);
  });
}
