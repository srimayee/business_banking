import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hnb_flutter_ui/src/ui/text_regular/text_regular.dart';

void main() {
  testWidgets('Text render properly with TextRegular Widget',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: TextRegularHNB(text: 'Testtext'),
    ));

    final textFinder = find.byType(Text);
    expect(textFinder, findsOneWidget);
    expect(find.text('Testtext'), findsOneWidget);
  });
}
