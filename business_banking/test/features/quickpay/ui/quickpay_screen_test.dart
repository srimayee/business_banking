import 'package:business_banking/features/quickpay/model/quickpay_view_model.dart';
import 'package:business_banking/features/quickpay/ui/quickpay_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget buildTestableWidget(Widget widget) {
    return MediaQuery(
        data: const MediaQueryData(),
        child: MaterialApp(
          home: widget,
        ));
  }

  testWidgets('Test QRCode generated with expiry time',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      buildTestableWidget(
        QuickPayScreen(
          viewModel: QuickPayViewModel(
              name: 'user name', email: 'username@gmail.com', imageUrl: ''),
          navigateToGenerateQrCode: () {},
          navigateToMakePayment: () {},
        ),
      ),
    );
    await tester.pump();
    expect(find.text('Name'), findsOneWidget);
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('QRCode'), findsOneWidget);
    expect(find.text('Generate'), findsOneWidget);
    expect(find.text('Request Money'), findsOneWidget);
  });

  testWidgets('Test QRCode generated with expiry time',
      (WidgetTester tester) async {
    int count = 0;
    await tester.pumpWidget(
      buildTestableWidget(
        QuickPayScreen(
          viewModel: QuickPayViewModel(
            name: 'user name',
            email: 'username@gmail.com',
            imageUrl: '',
          ),
          navigateToMakePayment: () {},
          navigateToGenerateQrCode: () {
            count++;
          },
        ),
      ),
    );
    await tester.pump();
    expect(find.text('Name'), findsOneWidget);
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('QRCode'), findsOneWidget);
    expect(find.text('Generate'), findsOneWidget);
    expect(find.text('Request Money'), findsOneWidget);
    await tester.tap(find.text('Generate'));
    await tester.pumpAndSettle();
    expect(count, 1);
  });
}
