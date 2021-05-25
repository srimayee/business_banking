import 'package:business_banking/utils/card_expiry_date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CardMonthInputFormatter testing with entered Text',
      (WidgetTester tester) async {
    final TextEditingController textController = TextEditingController();
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
      body: TextField(
        controller: textController,
        decoration: null,
        inputFormatters: <TextInputFormatter>[
          CardMonthInputFormatter(),
        ],
      ),
    )));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField), '0850');
    print(textController.text);
    expect(textController.text, '08/50');
  });
}
