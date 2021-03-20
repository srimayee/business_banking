import 'package:business_banking/features/qr_code_generator/model/qr_code_generator_view_model.dart';
import 'package:business_banking/features/qr_code_generator/ui/count_down_timer.dart';
import 'package:business_banking/features/qr_code_generator/ui/qr_code_generator_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qr_flutter/qr_flutter.dart';

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
    await tester.pumpWidget(buildTestableWidget(QRCodeGeneratorScreen(
      viewModel: QRCodeGeneratorViewModel(
          seed: '2a6abu', expiresAt: '2080-02-18T23:42:30.802Z'),
    )));
    await tester.pump();
    expect(find.text('QRCODE'), findsOneWidget);
    expect(find.byType(CountDown), findsOneWidget);
    expect(find.byType(QrImage), findsOneWidget);
    expect(find.text('Expired try another'), findsNothing);
  });

  testWidgets('Test QRCode generated with expired time',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(QRCodeGeneratorScreen(
      viewModel: QRCodeGeneratorViewModel(
          seed: '2a6abu', expiresAt: '2021-03-19T23:42:30.802Z'),
    )));
    await tester.pump();
    expect(find.text('QRCODE'), findsOneWidget);
    expect(find.byType(CountDown), findsOneWidget);
    expect(find.byType(QrImage), findsOneWidget);
    expect(find.text('Expired try another'), findsOneWidget);
  });

  testWidgets('Test empty container if both seed and expiryDate is empty',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(QRCodeGeneratorScreen(
      viewModel: QRCodeGeneratorViewModel(seed: '', expiresAt: ''),
    )));
    await tester.pump();
    expect(find.text('QRCODE'), findsOneWidget);
    expect(find.byType(CountDown), findsNothing);
    expect(find.byType(QrImage), findsNothing);
    expect(find.text('Oops, something went wrong. Try again later'),
        findsOneWidget);
  });

  testWidgets('Test empty container if seed is empty string',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(QRCodeGeneratorScreen(
      viewModel: QRCodeGeneratorViewModel(
          seed: '', expiresAt: '2021-03-20T23:42:30.802Z'),
    )));
    await tester.pump();
    expect(find.text('QRCODE'), findsOneWidget);
    expect(find.byType(CountDown), findsNothing);
    expect(find.byType(QrImage), findsNothing);
    expect(find.text('Oops, something went wrong. Try again later'),
        findsOneWidget);
  });
  testWidgets('Test empty container if expiryDate is empty string',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(QRCodeGeneratorScreen(
      viewModel: QRCodeGeneratorViewModel(seed: '2a6abu', expiresAt: ''),
    )));
    await tester.pump();
    expect(find.text('QRCODE'), findsOneWidget);
    expect(find.byType(CountDown), findsNothing);
    expect(find.byType(QrImage), findsNothing);
    expect(find.text('Oops, something went wrong. Try again later'),
        findsOneWidget);
  });
}
