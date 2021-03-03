import 'package:business_banking/features/customer/bloc/customer_bloc.dart';
import 'package:business_banking/features/customer/ui/customer_detail_presenter.dart';
import 'package:business_banking/features/customer/ui/customer_detail_widget.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CustomerDetail Golden test', (tester) async {
    final testWidget = MaterialApp(
        home: BlocProvider<CustomerBloc>(
            create: (_) => CustomerBloc(), child: CustomerDetailWidget()));

    await tester.pumpWidget(testWidget);
    await tester.pump(Duration(milliseconds: 500));
    await expectLater(find.byType(CustomerDetailPresenter),
        matchesGoldenFile('customerDetail.png'));
  });
}
