import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hnb_flutter_ui/hnb_flutter_ui.dart';

void main() {
  testWidgets('Primary button test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: PrimaryButtonHNB(
          buttonText: "PB", onTap: () {}, disableWhenClicked: false),
    ));

    final buttonFinder = find.byType(ElevatedButton);
    final semanticsFinder = find.bySemanticsLabel("PB");
    final buttonTextFinder = find.text("PB");

    expect(buttonFinder, findsOneWidget);
    expect(semanticsFinder, findsOneWidget);
    expect(buttonTextFinder, findsOneWidget);
  });
}
