import 'dart:async';

import 'package:business_banking/features/qr_code_generator/ui/count_down_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockTimer extends Mock implements Timer {}

void main() {
  Widget buildTestableWidget(Widget widget) {
    return MediaQuery(
        data: const MediaQueryData(),
        child: MaterialApp(
          home: widget,
        ));
  }

  testWidgets('Test count down time with expired date',
      (WidgetTester tester) async {
    await tester
        .pumpWidget(buildTestableWidget(CountDown('2020-02-18T23:42:30.802Z')));
    await tester.pumpAndSettle();
    expect(find.text('Expired try another'), findsOneWidget);
  });

  testWidgets('Test count down time with non expired date',
      (WidgetTester tester) async {
    await tester
        .pumpWidget(buildTestableWidget(CountDown('2080-02-18T23:42:30.802Z')));
    await tester.pumpAndSettle();
    expect(find.text('Expired try another'), findsNothing);
  });

  testWidgets('Test count down time with current time',
      (WidgetTester tester) async {
    await tester
        .pumpWidget(buildTestableWidget(CountDown(DateTime.now().toString())));
    await tester.pumpAndSettle();
    expect(find.text('Expired try another'), findsOneWidget);
  });
}
