import 'package:business_banking/features/customer/ui/customer_detail_presenter.dart';
import 'package:business_banking/features/customer/ui/customer_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
    testWidgets('CustomerDetailWidget, with true bloc', (tester) async {
    final testWidget = MaterialApp(home: CustomerDetailWidget());
    await tester.pumpWidget(testWidget);
    await tester.pump(Duration(milliseconds: 500));

    expect(find.byType(CustomerDetailPresenter), findsOneWidget);
  });
}
