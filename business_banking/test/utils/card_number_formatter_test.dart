import 'package:business_banking/utils/card_number_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CardNumberInputFormatter testing with entered Text',
      (WidgetTester tester) async {
    final TextEditingController textController = TextEditingController();
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
      body: TextField(
        controller: textController,
        decoration: null,
        inputFormatters: <TextInputFormatter>[
          CardNumberInputFormatter(),
        ],
      ),
    )));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField), '345246807615128');
    print(textController.text);
    expect(textController.text, '3452  4680  7615  128');
  });
}
